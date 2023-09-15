package com.semi.travelpalette.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.KakaoService;
import com.semi.travelpalette.user.service.MailService;
import com.semi.travelpalette.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	private UserService uService;
	@Autowired
	private KakaoService kService;
	@Autowired
	private MailService mService;
	
	@RequestMapping(value="/login.tp")
	public ModelAndView showUserLogin(
			ModelAndView mv) {
		mv.setViewName("/user/login");
		return mv;
	}
	
	
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
	
	// 클라이언트에게 랜덤한 인증번호를 보냄
	@RequestMapping(value="/mailCheck.tp", method = RequestMethod.GET)
	public String mailCheck(
			@RequestParam("userEmail") String userEmail) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + userEmail);
		return mService.joinEmail(userEmail);
	}
	
	@RequestMapping(value="/checkEmailCode.tp", method = RequestMethod.GET)
	public String codeCheck(
			@RequestParam("mailCheckCode") String code) {
		return "";
	}
	
	// 카카오 로그인
	@RequestMapping(value = "/kakao-login.tp")
	public String kakaoLogin(@RequestParam("code") String code, 
			Model model ,HttpSession session) throws Exception {
		
		//code로 토큰 받음
		String access_token = kService.getToken(code);
		
		//토큰으로 사용자 정보 담은 list 가져오기
		List<Object> list = kService.getUserInfo(access_token);
		
		//list 모델에 담아 view로 넘김
		model.addAttribute("list", list);
	
		return "/user/userInfo";
	}
    
	
}
