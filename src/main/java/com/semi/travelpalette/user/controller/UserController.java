package com.semi.travelpalette.user.controller;

import java.util.HashMap;
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

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.KakaoService;
import com.semi.travelpalette.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	//권장
//	private final UserService uService;
//
//	private final KakaoService kService;
//
//	private final JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserService uService;
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
		User login = uService.loginUser(user);
		if(login != null) {
			// 유저 상세 정보 번호로 조회
			User userInfo = uService.selectUserAllInfo((int) login.getUserNo());
	        if (userInfo != null) {
	        	int userNo = login.getUserNo();
	            String userId = login.getUserId();
	            String userNickname = userInfo.getUserNickname();
	            // 플랫폼 타입 저장
	            String platformType = login.getPlatformType();
	            System.out.println("로그인 닉네임 정보 : " + userNickname);
	            System.out.println("로그인 플랫폼 정보 : " + platformType);
	            
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
    
    
    
    // ************************ 회원 기능 관련 ***************************
	
	@GetMapping("/mypage.tp")
	public ModelAndView showMypage (
			ModelAndView mv
			, HttpSession session
			, @ModelAttribute User user
			) {
		String userId = (String) session.getAttribute("userId");
		System.out.println("제발~~!!" + userId);
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		String userNickname = (String) session.getAttribute("userNickname");
		
		if(uOne != null) {
			mv.addObject("userId", uOne.getUserId()).addObject("userNickname", uOne.getUserNickname());
			mv.setViewName("/user/mypage");
		}else {
			mv.addObject("title", "마이페이지 조회 실패").addObject("msg", "로그인 후 이용 가능합니다.")
			.addObject("url", "redirect:/index.jsp").addObject("urlBtn", "메인으로 이동");
			mv.setViewName("common/serviceResult"); 
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
		System.out.println("제발~~!!" + userId);
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		System.out.println();
		if(uOne != null) {
			mv.addObject("title", "비밀번호 확인").addObject("titleMsg", "비밀번호 확인")
			.addObject("btnMsg", "비밀번호 입력");
			mv.setViewName("/user/normalPw");
		}else {
	        mv.addObject("javascript", "alert('로그인 후 이용 가능합니다.'); history.back();");
	        mv.setViewName("redirect:/index.jsp");
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
        User pwCheck = uService.loginUser(user);
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
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		// 유저 정보 검색 후 수정 페이지에 출력
		System.out.println("제발" + uOne.toString());
		System.out.println("되나? : " + uOne.getUserNo());
		int userNo = uOne.getUserNo();
		// 검색해온 유저 번호로 유저에 대한 모든 정보 select
		User userInfo = uService.selectUserAllInfo(userNo);
		System.out.println("되나??? : " + userInfo.toString());
		if(uOne != null) {
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/user/modifyNormal");
		}else {
	        mv.addObject("javascript", "alert('로그인 후 이용 가능합니다.'); history.back();");
	        mv.setViewName("/user/login.tp");
		}		
    	return mv;
    }

	
	@PostMapping("/modifyNormal.tp")
	public ModelAndView UserModifyNormal (
			ModelAndView mv
			, HttpSession session
			, User user) {
		System.out.println("아!!!!!!!!!!!!!!!");
		System.out.println(user.toString());
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		User userInfo = uService.selectUserAllInfo(uOne.getUserNo());
		uService.updateUserNormal(user);
		mv.setViewName("/user/mypage");
		return mv;
	}
	
	
	
    // 회원 정보 수정
	@GetMapping("/delete.tp")
    public ModelAndView showDeleteUser(
    		ModelAndView mv
    		, HttpSession session
    		, @ModelAttribute User user
    		) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		// 유저 정보 검색 후 수정 페이지에 출력
		int userNo = uOne.getUserNo();
		// 검색해온 유저 번호로 유저에 대한 모든 정보 select
		User userInfo = uService.selectUserAllInfo(userNo);
		if(uOne != null) {
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/user/delete");
		}else {
	        mv.addObject("javascript", "alert('로그인 후 이용 가능합니다.'); history.back();");
	        mv.setViewName("/user/login.tp");
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
        User pwCheck = uService.loginUser(oneUser);
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
    	int result = uService.deleteUser(userNo);
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
		uService.insertUser(user);
		return mv;
	}
	
	// 아이디 중복 검사
	@GetMapping("/idCheck.tp")
    @ResponseBody
    public Map<String, Object> checkId(@RequestParam String userId) {
        Map<String, Object> response = new HashMap<>();
        User userData = uService.checkUserId(userId);
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
		User userData = uService.checkUserNickname(userNickname);
		if (userData != null) {
			boolean isDuplicate = true; // 중복됨
			response.put("isDuplicate", isDuplicate);
		} else {
			boolean isDuplicate = false; // 중복되지 않음
			response.put("isDuplicate", isDuplicate);
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
		User mailCheck = uService.checkUserEmail(userEmail);
	    if (mailCheck != null) {
	        // 이메일이 이미 등록되어 있는 경우 (중복)
	        response.put("isDuplicate", true);
	    } else {
	        // 이메일이 등록되어 있지 않은 경우 (중복 아님)
	        response.put("isDuplicate", false);
	        joinEmail(userEmail, session);	// 메일 전송
	    }
	    
	    return response;
//		return joinEmail(userEmail, session);
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
		String setFrom = "travelpalette0901@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = userEmail;
		String title = "여행 팔레트 회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		this.mailSend(setFrom, toMail, title, content);
		int code = authNumber; // 인증번호를 code 변수에 저장
		
	    if (session.getAttribute("code") != null) {
	        session.removeAttribute("code");
	    }
	    session.setAttribute("code", code);
//		int code = (int) session.getAttribute("code");
		System.out.println("인증번호!!!!!!!!!!!! : " + code);
		return Integer.toString(authNumber);
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
		
		String userId = (String)list.get("userId"); 
		String userNickName = (String)list.get("userNickname"); 
		
	    // 세션에 로그인 정보 저장
	    session.setAttribute("userId", userId);
	    session.setAttribute("userNickName", userNickName);
	
		return "redirect:/index.jsp";
	}



    
	
}
