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
//			 @RequestParam("userId") String userId
//			, @RequestParam("userPw") String userPw
			, HttpSession session
			) {
		Map<String, Object> response = new HashMap<>();
//		User user = new User(userId, userPw);
		User login = uService.loginUser(user);
		System.out.println(login.toString());
		if(login != null) {
			User userInfo = uService.selectUserNickname((int) login.getUserNo());
	        if (userInfo != null) {
	            String userId = login.getUserId();
	            String userNickname = userInfo.getUserNickname();
	            System.out.println(userNickname);

	            session.setAttribute("userId", userId);
	            session.setAttribute("userNickname", userNickname);
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
		int result = uService.insertUser(user);
		int resultInfo = uService.insertUserInfo(user);
		
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
	
	@GetMapping("/mypage.tp")
	public ModelAndView showMypage (
			ModelAndView mv
			, HttpSession session
			, @ModelAttribute User user
//			, @ModelAttribute UserInfo userInfo
			) {
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		User userNickanme = uService.checkUserNickname((String)session.getAttribute("userNaickname"));
		System.out.println(uOne.getUserNickname());
		System.out.println(userNickanme.getUserNickname());
		if(uOne != null) {
			mv.addObject("userId", uOne).addObject("userNickname", userNickanme);
			mv.setViewName("/user/mypage");
		}else {
			mv.addObject("title", "마이페이지 조회 실패").addObject("msg", "로그인 후 이용 가능합니다.")
			.addObject("url", "redirect:/index.jsp").addObject("urlBtn", "메인으로 이동");
			mv.setViewName("common/serviceResult"); 
		}		
		return mv;
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
		mailSend(setFrom, toMail, title, content);
		int code = authNumber; // 인증번호를 code 변수에 저장
		session.setAttribute("code", code); // 세션에 code 변수의 값을 저장
//		int code = (int) session.getAttribute("code");
		System.out.println("인증번호!!!!!!!!!!!! : " + code);
		return Integer.toString(authNumber);
	}

	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
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
