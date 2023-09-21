package com.semi.travelpalette.inquiry.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
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
			mv.setViewName("/inquiry/insert");
		}else {
			mv.setViewName("/temp");
		}	
		return mv;
	}
	
	@PostMapping("/insert.tp")
	public ModelAndView insertInquiry (
			ModelAndView mv
			, Inquiry inquiry
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		int inquiryNo = inquiry.getInquiryNo();
		
		try {
			if(userId != null && !userId.equals("")) {
				inquiry.setUserId(userId);
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일 정보(이름, 리네임, 경로, 크기) 및 파일 저장
					Map<String, Object> bMap = inquiryService.saveFile(request, uploadFile);
					inquiry.setInquiryFileName((String)bMap.get("fileName"));
					inquiry.setInquiryFileRename((String)bMap.get("fileRename"));
					inquiry.setInquiryFilePath((String)bMap.get("filePath"));
					inquiry.setInquiryFileLength((long)bMap.get("fileLength"));
				}
				// 완료했으면 비즈니스 로직 태우기
				System.out.println(inquiry.toString());
				int result = inquiryService.insertInquiry(inquiry);
				if(result > 0) {
			        mv.setViewName("/inquiry/list");
				}
			} else {
				mv.addObject("msg", "로그인 정보가 존재하지 않습니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("/common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/inquiry/insert.tp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@GetMapping("/modify.tp")
	public ModelAndView showInquiryModify(
			ModelAndView mv
			, Inquiry inquiry
			, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		int inquiryNo = inquiry.getInquiryNo();
		Inquiry inquiryInfo = new Inquiry(inquiryNo, userId);
		Inquiry iPost = inquiryService.selectOneInquiryPost(inquiryInfo);
		if(uOne != null) {
			mv.addObject("iPost", iPost);
//			mv.setViewName("inquiry/modify.tp?inquiryNo="+inquiryNo);
		}else {
			mv.setViewName("/temp"); 
		}	
		return mv;
	}
	
	@PostMapping("/modify.tp")
	public ModelAndView modifyInquiry (
			ModelAndView mv
			, Inquiry inquiry
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		User uOne = uService.checkUserId((String)session.getAttribute("userId"));
		int inquiryNo = inquiry.getInquiryNo();
		
		try {
			if(userId != null && !userId.equals("")) {
				if(uploadFile != null && uploadFile.getOriginalFilename().equals("")) {
					String fileRename = inquiry.getInquiryFileRename();
					if(fileRename != null) {
						inquiryService.deleteFile(fileRename, request);
					}
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일 정보(이름, 리네임, 경로, 크기) 및 파일 저장
					Map<String, Object> bMap = inquiryService.saveFile(request, uploadFile);
					inquiry.setInquiryFileName((String)bMap.get("fileName"));
					inquiry.setInquiryFileRename((String)bMap.get("fileRename"));
					inquiry.setInquiryFilePath((String)bMap.get("filePath"));
					inquiry.setInquiryFileLength((long)bMap.get("fileLength"));
				}
				// 완료했으면 비즈니스 로직 태우기
				System.out.println(inquiry.toString());
				int result = inquiryService.updateInquiry(inquiry);
				if(result > 0) {
			        mv.setViewName("/inquiry/list");
				}
			} else {
				mv.addObject("msg", "로그인 정보가 존재하지 않습니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("/common/errorPage");
			}
			}
		 
		}catch (Exception e) {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/inquiry/insert.tp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
}
