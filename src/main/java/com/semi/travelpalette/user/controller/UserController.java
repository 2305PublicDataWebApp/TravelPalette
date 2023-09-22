package com.semi.travelpalette.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.inquiry.domain.PageInfo;
import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.domain.UserMypageDto;
import com.semi.travelpalette.user.service.KakaoService;
import com.semi.travelpalette.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	//권장
//	private final UserService userService;
//
//	private final KakaoService kService;
//
//	private final JavaMailSenderImpl mailSender;

	@Autowired
	private UserService userService;
	@Autowired
	private KakaoService kService;


	@Autowired
	private JavaMailSenderImpl mailSender;

	private int authNumber;


	// *************************** 로그인 관련 ***************************

	@RequestMapping(value="/login.tp")
	public ModelAndView showUserLogin(
			ModelAndView mv) {
		mv.setViewName("/user/login");
		return mv;
	}

	@PostMapping("/login.tp")
	@ResponseBody
	public Map<String, Object> UserLogin (
			@ModelAttribute User user
			, HttpSession session
			) {
		Map<String, Object> response = new HashMap<>();
		// 입력받은 로그인 정보(아이디, pw)로 로그인 정보 객체에 저장
		User login = userService.loginUser(user);
		if(login != null) {
			// 유저 상세 정보 번호로 조회
			User userInfo = userService.selectUserAllInfo((int) login.getUserNo());
	        if (userInfo != null) {
	        	int userNo = login.getUserNo();
	            String userId = login.getUserId();
	            String userNickname = userInfo.getUserNickname();
	            // 플랫폼 타입 저장
	            String platformType = login.getPlatformType();
	            System.out.println("로그인 닉네임 정보 : " + userNickname);
	            System.out.println("로그인 플랫폼 정보 : " + platformType);
	            System.out.println("로그인 아이디 정보 : " + userId);

	            session.setAttribute("userNo", userNo);
	            session.setAttribute("userId", userId);
	            session.setAttribute("userNickname", userNickname);
	            session.setAttribute("platformType", platformType);

	            response.put("success", true);
	        } else {
	            // 사용자 정보를 가져올 수 없는 경우에 대한 처리
	            response.put("success", false);
	            response.put("message", "사용자 정보를 가져올 수 없습니다.");
	        }
		} else {
			response.put("success", false);
            response.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
		}
		return response;
	}


	// 로그아웃 메소드
    @RequestMapping("/logout.tp")
    public String kakao_logout(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("userId");
        session.removeAttribute("userNickName");
        //세션에 담긴값 초기화
        session.invalidate();
        return "redirect:/index.jsp";
    }


	//***************** 카카오 로그인 관련 메소드 *************************

	// 카카오 로그인
	@RequestMapping(value = "/kakao-login.tp")
	public String kakaoLogin(
			@RequestParam("code") String code,
			Model model ,HttpSession session) throws Exception {

		//code로 토큰 받음
		String access_token = kService.getToken(code);

		//토큰으로 사용자 정보 담은 list 가져오기
		Map<String, Object> list = kService.getUserInfo(access_token);
		
		String id = (String)list.get("userEmail");
		String email = (String)list.get("userEmail");
		String userNickname = (String)list.get("userNickname");
		
		System.out.println(email);
		System.out.println(userNickname);
		
		User kakaoUserNo = userService.selectKakaoUserNo(id);
		
		User kakaoUserInfo = userService.selectKakaoUserInfo(kakaoUserNo.getUserNo());
		
		String platformType = kakaoUserInfo.getPlatformType();
		
	    // 세션에 로그인 정보 저장
	    session.setAttribute("userId", email);
	    session.setAttribute("userNickname", userNickname);
	    session.setAttribute("platformType", platformType);

		return "redirect:/index.jsp";
	}



    // ************************ 회원 기능 관련 ***************************

	@GetMapping("/mypage.tp")
	public ModelAndView showMypage (
			ModelAndView mv
			, HttpSession session
			, @ModelAttribute User user
			) {

		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId(userId);

		if(uOne != null) {
            List<UserMypageDto> userMypageDtoList = userService.selectUserActivity(userId);
            
			mv.addObject("userId", uOne.getUserId())
					.addObject("userNickname", uOne.getUserNickname())
					.addObject("userMypageActivity" , userMypageDtoList);
			mv.setViewName("/user/mypage");

		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}

    // 회원 페이지 접속 시 비밀번호 입력하기(회원 정보 수정, 회원 탈퇴)



	
	@GetMapping("/userNormalPw.tp")
    public ModelAndView showUserNormalPw(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		System.out.println();
		if(uOne != null) {
			mv.addObject("title", "비밀번호 확인").addObject("titleMsg", "비밀번호 확인")
			.addObject("btnMsg", "비밀번호 입력");
			mv.setViewName("/user/normalPw");
		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
    	return mv;
    }


    @PostMapping("/userNormalPw.tp")
    @ResponseBody
    public Map<String, Object> userNormalPw(@RequestParam("userPw") String userPw
    		, HttpSession session) {
        // 요청 처리 로직
        String userId = (String)session.getAttribute("userId");
        User user =new User(userId, userPw);
        User pwCheck = userService.loginUser(user);
        // 응답 데이터 생성
        Map<String, Object> response = new HashMap<>();
        if(pwCheck != null) {
        	boolean isDuplicate = true;
        	response.put("success", true);
        	response.put("isDuplicate", isDuplicate);
        	response.put("redirectUrl", "/user/modifyNormal.tp"); // 리디렉션할 URL 설정
        } else {
        	boolean isDuplicate = false;
        	response.put("success", false);
        	response.put("isDuplicate", isDuplicate);
            response.put("message", "아이디와 비밀번호를 확인해주세요."); // 실패 메시지 설정
        }
        return response;
    }

    // 회원 정보 수정
	@GetMapping("/modifyNormal.tp")
    public ModelAndView showUserModifyNormal(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		// 유저 정보 검색 후 수정 페이지에 출력
		int userNo = uOne.getUserNo();
		// 검색해온 유저 번호로 유저에 대한 모든 정보 select
		User userInfo = userService.selectUserAllInfo(userNo);
		if(uOne != null) {
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/user/modifyNormal");
		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
    	return mv;
    }


	@PostMapping("/modifyNormal.tp")
	public ModelAndView UserModifyNormal (
			ModelAndView mv
			, HttpSession session
			, User user) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		User userInfo = userService.selectUserAllInfo(uOne.getUserNo());
		String userEmailStatus = user.getUserEmailStatus();
		String userSmsStatus = user.getUserSmsStatus();
		System.out.println(userEmailStatus);
		if(userEmailStatus != "Y") {
			user.setUserEmailStatus("N");
		}
		if(userSmsStatus != "Y") {
			user.setUserSmsStatus("N");
		}
		userService.updateUserNormal(user);
		mv.setViewName("/user/mypage");
		return mv;
	}
	
	

	// ******************************* 카카오 *************************************
	@GetMapping("/userKakaoEmail.tp")
    public ModelAndView showUserKakaoEmail(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		System.out.println();
		if(uOne != null) {
			mv.addObject("title", "이메일 확인").addObject("titleMsg", "이메일 확인")
			.addObject("btnMsg", "카카오 계정 입력");
			mv.setViewName("/user/normalPw");
		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
    	return mv;
    }


    @PostMapping("/userKakaoEmail.tp")
    @ResponseBody
    public Map<String, Object> userKakaoEmail(@RequestParam("userId") String userId
    		, HttpSession session) {
        // 요청 처리 로직
        String sessionUserId = (String)session.getAttribute("userId");
        User kakaoEmailCheck = userService.selectKakaoEmailCheck(userId);
        // 응답 데이터 생성
        Map<String, Object> response = new HashMap<>();
        
        if(sessionUserId != null && sessionUserId.equals(userId)) {
        	boolean isDuplicate = true;
        	response.put("success", true);
        	response.put("isDuplicate", isDuplicate);
        	response.put("redirectUrl", "/user/modifyKakao.tp"); // 리디렉션할 URL 설정
        } else {
        	boolean isDuplicate = false;
        	response.put("success", false);
        	response.put("isDuplicate", isDuplicate);
            response.put("message", "이메일을 확인해주세요."); // 실패 메시지 설정
        }
        return response;
    }

    // 회원 정보 수정
	@GetMapping("/modifyKakao.tp")
    public ModelAndView showUserModifyKakao(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		// 유저 정보 검색 후 수정 페이지에 출력
		int userNo = uOne.getUserNo();
		// 검색해온 유저 번호로 유저에 대한 모든 정보 select
		User userInfo = userService.selectUserAllInfo(userNo);
		if(uOne != null) {
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/user/modifyKakao");
		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
    	return mv;
    }


	@PostMapping("/modifyKakao.tp")
	public ModelAndView UserModifyKaKao (
			ModelAndView mv
			, HttpSession session
			, User user) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		User userInfo = userService.selectUserAllInfo(uOne.getUserNo());
		String userEmailStatus = user.getUserEmailStatus();
		String userSmsStatus = user.getUserSmsStatus();
		System.out.println(userEmailStatus);
		if(userEmailStatus != "Y") {
			user.setUserEmailStatus("N");
		}
		if(userSmsStatus != "Y") {
			user.setUserSmsStatus("N");
		}
		userService.updateUserNormal(user);
		mv.setViewName("/user/mypage");
		return mv;
	}
	


	@GetMapping("/delete.tp")
    public ModelAndView showDeleteUser(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = userService.checkUserId((String)session.getAttribute("userId"));
		// 유저 정보 검색 후 수정 페이지에 출력
		int userNo = uOne.getUserNo();
		// 검색해온 유저 번호로 유저에 대한 모든 정보 select
		User userInfo = userService.selectUserAllInfo(userNo);
		if(uOne != null) {
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/user/delete");
		}else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
    	return mv;
    }


	// 탈퇴 시 비밀번호 입력 확인
    @PostMapping("/delete.tp")
    @ResponseBody
    public Map<String, Object> deleteUser(
    		User user
    		, HttpSession session) {
        // 요청 처리 로직
        String userId = (String)session.getAttribute("userId");
        User oneUser =new User(userId, user.getUserPw());
        User pwCheck = userService.loginUser(oneUser);
        // 응답 데이터 생성
        Map<String, Object> response = new HashMap<>();
        if(pwCheck != null) {
        	response.put("success", true);
//        	response.put("redirectUrl", "/user/modifyNormal.tp"); // 리디렉션할 URL 설정
        } else {
        	response.put("success", false);
            response.put("message", "비밀번호를 확인해주세요."); // 실패 메시지 설정
        }
        return response;
    }

    // confirm 누르면 진짜 회원 탈퇴
    @PostMapping("/deleteExecute.tp")
    @ResponseBody
    public Map<String, Object> deleteExecute(
    		User user
    		, HttpSession session) {
    	// 요청 처리 로직
    	int userNo = (int)session.getAttribute("userNo");
    	int result = userService.deleteUser(userNo);
    	// 응답 데이터 생성
    	Map<String, Object> response = new HashMap<>();
    	if(result > 0) {
    		response.put("success", true);
    		// 탈퇴 후 세션 파괴
    		session.invalidate();
    	} else {
    		response.put("success", false);
    		response.put("message", "회원 삭제가 제대로 처리되지 않았습니다."); // 실패 메시지 설정
    	}
    	return response;
    }


    // 아이디 찾기
    @GetMapping("/findId.tp")
    public ModelAndView findId(
    		ModelAndView mv
    		, User user
    		) {
    	mv.setViewName("/user/findId");
    	return mv;
    }
    
    @PostMapping("/findId.tp")
    @ResponseBody
    public Map<String, Object> UserSearchFindId(
    		User user
    		) {
    	User findId = new User();
    	findId.setUserEmail(user.getUserEmail());
    	findId.setUserName(user.getUserName());
    	User result = userService.selectFindId(findId);
    	String userId = userService.displayId(result.getUserId());
    	Map<String, Object> response = new HashMap<>();
    	if(result != null) {
    		response.put("success", true);
    		response.put("userId", userId);
    		response.put("url", "/user/infoResult.tp");
    	} else {
        	response.put("success", false);
            response.put("message", "아이디와 비밀번호를 확인해주세요."); // 실패 메시지 설정
    	}
    	return response;
    }
    
    @GetMapping("/infoResult.tp")
    public ModelAndView showInfoResult(
    		ModelAndView mv
    		, @RequestParam("userId") String userId
    		) {
    	mv.addObject("userId", userId);
    	mv.setViewName("/user/userInfoResult");
    	return mv;
    }
    
    // 비밀번호 찾기
    @GetMapping("/findPw.tp")
    public ModelAndView findPw(
    		ModelAndView mv
    		, User user
    		) {
    	mv.setViewName("/user/findPw");
    	return mv;
    }
    
    @PostMapping("/findPw.tp")
    @ResponseBody
    public Map<String, Object> UserSearchFindPw(
    		User user
    		, HttpSession session
    		) {
    	User findPw = new User();
    	findPw.setUserId(user.getUserId());
    	findPw.setUserEmail(user.getUserEmail());
    	User result = userService.selectFindPw(findPw);
    	Map<String, Object> response = new HashMap<>();
    	if(result != null) {
    		this.findPwEmail(findPw.getUserEmail(), session);
    		response.put("success", true);
    		response.put("msg", "임시 비밀번호가 발급되었습니다.\n임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.");
    		response.put("url", "/user/login.tp");
    	} else {
        	response.put("success", false);
            response.put("msg", "아이디와 비밀번호를 확인해주세요."); // 실패 메시지 설정
    	}
    	return response;
    }


	// ************************ 회원가입 관련 ***************************



	@RequestMapping(value="/register.tp", method = RequestMethod.GET)
	public ModelAndView showUserRegister(
			ModelAndView mv
			) {
		mv.setViewName("/user/register");
		return mv;
	}

	@RequestMapping(value="/register.tp", method = RequestMethod.POST)
	public ModelAndView userRegister(
			ModelAndView mv
			, @ModelAttribute User user
			) {
		String userEmailStatus = user.getUserEmailStatus();
		String userSmsStatus = user.getUserSmsStatus();
		if(userEmailStatus != "Y") {
			user.setUserEmailStatus("N");
		}
		if(userSmsStatus != "Y") {
			user.setUserSmsStatus("N");
		}
		int result = userService.insertUser(user);
		if(result > 0) {
			mv.addObject("msg", "회원가입이 성공적으로 완료되었습니다.").addObject("url", "redirect:/index.jsp");
			mv.setViewName("/user/login");
		}else {
			mv.addObject("msg", "회원가입이 완료되지 않았습니다.").addObject("url", "redirect:/index.jsp");
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}

	// 아이디 중복 검사
	@GetMapping("/idCheck.tp")
    @ResponseBody
    public Map<String, Object> checkId(@RequestParam String userId) {
        Map<String, Object> response = new HashMap<>();
        User userData = userService.checkUserId(userId);
        if (userData != null) {
            boolean isDuplicate = true; // 중복됨
            response.put("isDuplicate", isDuplicate);
        } else {
            boolean isDuplicate = false; // 중복되지 않음
            response.put("isDuplicate", isDuplicate);
        }

        return response;
    }

	// 닉네임 중복 검사
	@GetMapping("/nickNnameCheck.tp")
	@ResponseBody
	public Map<String, Object> checkNickname(@RequestParam String userNickname) {
		Map<String, Object> response = new HashMap<>();
		User userData = userService.checkUserNickname(userNickname);
		if (userData != null) {
			boolean isDuplicate = true; // 중복됨
			response.put("isDuplicate", isDuplicate);
		} else {
			boolean isDuplicate = false; // 중복되지 않음
			response.put("isDuplicate", isDuplicate);
		}

		return response;
	}
	
	
	
	// ******************* 유저 활동 내역 관리 ***********************
	
	@GetMapping("/activityLike.tp")
	@ResponseBody
	public ModelAndView likeDelete (
			ModelAndView mv
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage
			, Like like
			, HttpSession session){
		String userId = (String) session.getAttribute("userId");
		if(userId != null) {
			int totalCount = userService.selectLikeCount(userId);
			PageInfo pInfo = userService.getPageInfo(currentPage, userId, totalCount);
			List<Like> likes = userService.selectLikes(pInfo);
//			List<Board>
			System.out.println(like.getLikeNo());
			mv.addObject("like", likes);
			mv.setViewName("/user/activityLike");
		} else {
			mv.addObject("error", "로그인 후 이용 가능합니다.").addObject("msg", "로그인 후 이용 가능합니다.").addObject("url", "/user/login.tp").addObject("back",false);
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	@PostMapping("/likeDelete.tp")
	@ResponseBody
	public Map<String, Object> likeDelete(
			@RequestParam String likeNo) {
		Map<String, Object> response = new HashMap<>();
		try {
			
		} catch (Exception e) {
		}
		Like selectLike = userService.selectLike(likeNo);
		int boardNo = selectLike.getBoardNo();
		String boardType = selectLike.getBoardType();
		if (selectLike != null) {
			response.put("boardType", boardType);
			response.put("boardNo", boardNo);
		} else {
			response.put("error", "좋아요 정보를 찾을 수 없습니다.");
		}
		return response;
	}
	




	// ******************** 메일 관련 메소드 **************************

	// 클라이언트에게 랜덤한 인증번호를 보냄
	@RequestMapping(value="/mailCheck.tp", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> mailCheck(
			@RequestParam("userEmail") String userEmail
			, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + userEmail);

		// 이메일 중복 검사
		User mailCheck = userService.checkUserEmail(userEmail);
	    if (mailCheck != null) {
	        // 이메일이 이미 등록되어 있는 경우 (중복)
	        response.put("isDuplicate", true);
	    } else {
	        // 이메일이 등록되어 있지 않은 경우 (중복 아님)
	        response.put("isDuplicate", false);
	        joinEmail(userEmail, session);
	        int code = (int)session.getAttribute("code");
	        System.out.println("하" + code);
	        response.put("code", code);	// 메일 전송
	    }

	    return response;
	}


	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}

	public String joinEmail(String userEmail
			, HttpSession session) {
		makeRandomNumber();
		System.out.println("세션에 저장된 번호1 : " + session.getAttribute("code"));
		session.removeAttribute("code");
		System.out.println("세션에 저장된 번호2 : " + session.getAttribute("code"));
		session.setAttribute("code", authNumber);
		System.out.println("세션에 저장된 번호3 : " + session.getAttribute("code"));
		String setFrom = "travelpalette0901@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = userEmail;
		String title = "여행 팔레트 회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content =
			    "인증 번호는 " + authNumber + "입니다." +
			    "<br>" +
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		this.mailSend(setFrom, toMail, title, content);

		System.out.println("세션에 저장된 번호 : " + session.getAttribute("code"));
		return Integer.toString(authNumber);
	}
	
	public boolean findPwEmail(String userEmail
			, HttpSession session) {
		makeRandomNumber();
		String setFrom = "travelpalette0901@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = userEmail;
		String title = "여행 팔레트 임시 비밀번호 이메일 입니다."; // 이메일 제목
		int code = authNumber; // 인증번호를 code 변수에 저장
		String newPw = "n" + code + "~!@";
		String content =
				"임시 비밀번호는 " + newPw + "입니다." +
						"<br>" +
						"임시 비밀번호로 로그인 후 비밀번호를 변경해주세요."; //이메일 내용 삽입
		this.mailSend(setFrom, toMail, title, content);
		// 이메일로 번호 출력 후 UPDATE 하기
		User selectInfo = userService.selectUserNo(userEmail);
		// 비번 + 번호로 update
		User updateInfo = new User();
		updateInfo.setUserNo(selectInfo.getUserNo());
		updateInfo.setUserPw(newPw);
		int pwUpdate = userService.updateNewPw(updateInfo);
		if(pwUpdate > 0 ) {
			return true;
		} else {
			return false;
		}
	}

	//이메일 전송 메소드
	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

//    // 카카오 계정 탈퇴 메소드
//    public static boolean deleteKakaoAccount(String kakaoAccessToken) {
//        // 카카오 API 엔드포인트 URL
//        String apiUrl = "https://kapi.kakao.com/v1/user/unlink";
//
//        // HTTP 요청 헤더 설정
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("Authorization", "Bearer " + kakaoAccessToken);
//
//        // HTTP 요청 엔티티 설정
//        HttpEntity<String> requestEntity = new HttpEntity<>(headers);
//
//        // RestTemplate을 사용하여 DELETE 요청 보내기
//        RestTemplate restTemplate = new RestTemplate();
//        ResponseEntity<String> responseEntity = restTemplate.exchange(
//                apiUrl, HttpMethod.DELETE, requestEntity, String.class);
//
//        // 응답 처리
//        if (responseEntity.getStatusCode() == HttpStatus.NO_CONTENT) {
//            System.out.println("카카오 계정 탈퇴 성공");
//            return true;
//        } else {
//            System.out.println("카카오 계정 탈퇴 실패");
//            System.out.println("응답 코드: " + responseEntity.getStatusCodeValue());
//            System.out.println("응답 본문: " + responseEntity.getBody());
//            return false;
//        }
//    }
//
//    public static void main(String[] args) {
//        String kakaoAccessToken = "YOUR_KAKAO_ACCESS_TOKEN";
//        boolean result = deleteKakaoAccount(kakaoAccessToken);
//
//        // 탈퇴 결과에 따른 처리
//        if (result) {
//            // 성공적으로 탈퇴했을 때의 처리
//        } else {
//            // 탈퇴에 실패했을 때의 처리
//        }
//    }





}
