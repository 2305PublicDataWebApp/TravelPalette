package com.semi.travelpalette.inquiry.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.inquiry.domain.PageInfo;
import com.semi.travelpalette.inquiry.service.InquiryService;
import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.UserService;



@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private UserService uService;
	
	@GetMapping("/list.tp")
	public ModelAndView showInquiryList (
			ModelAndView mv
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage
			, HttpSession session
			, @ModelAttribute User user
			) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		String userNickname = (String) session.getAttribute("userNickname");
		int totalCount = inquiryService.selectInquiryListCount(userId);
		PageInfo pInfo = inquiryService.getPageInfo(currentPage, userId, totalCount);
		
		// 문의 내역 불러오기
		List<Inquiry> iList = inquiryService.selectInquiryList(pInfo);
		
		if(uOne != null) {
			mv.addObject("iList", iList).addObject("pInfo", pInfo);
			mv.setViewName("/inquiry/list");
		}else {
			mv.setViewName("/temp"); 
		}		
		return mv;
	}
	
	@GetMapping("/detail.tp")
	public ModelAndView showInquiryDetail (
			ModelAndView mv
			, HttpSession session
			, @RequestParam("inquiryNo") Integer inquiryNo
			) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		Inquiry inquiryInfo = new Inquiry(inquiryNo, userId);
		Inquiry iPost = inquiryService.selectOneInquiryPost(inquiryInfo);
		if(uOne != null) {
			mv.addObject("iPost", iPost);
			mv.setViewName("/inquiry/detail");
		}else {
			mv.setViewName("/temp"); 
		}	
		return mv;
	}
	
	@GetMapping("/delete.tp")
	public String deleteInquiry (
			@RequestParam("inquiryNo") Integer inquiryNo
			, HttpSession session
			, Inquiry inquiry) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		Inquiry inquiryInfo = new Inquiry(inquiryNo, userId);
		int result = inquiryService.deleteInquiry(inquiryInfo);
		if(uOne != null && result > 0) {
			return "redirect:/inquiry/list.tp";
		}else {
			return "/temp"; 
		}	
	}
	
	@GetMapping("/insert.tp")
	public ModelAndView showInsertInquiry(
			HttpSession session
			, ModelAndView mv
			) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		if(uOne != null) {
			mv.setViewName("/inquiry/insert.tp");
		}else {
			mv.setViewName("/temp");
		}	
		return mv;
	}
	
	
}
