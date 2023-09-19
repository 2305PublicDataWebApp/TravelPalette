package com.semi.travelpalette.travel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.travel.domain.Review;
import com.semi.travelpalette.travel.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService rSerivce;
	
	@RequestMapping(value="/insert.tp", method = RequestMethod.POST)
	public ModelAndView insertReview(
			ModelAndView mv
			, @ModelAttribute Review review
			, @RequestParam(value="travelNo") Integer travelNo) {
		try {
			int result = rSerivce.insertReview(review);
			String url = "/travel/detail.tp?travelNo="+travelNo;
			if(result > 0) {
				mv.addObject("msg", "리뷰가 등록되었습니다.");
				mv.addObject("url", url);
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 리뷰가 등록되지 않았습니다.");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/delete.tp", method = RequestMethod.GET)
	public ModelAndView deleteReview(
			ModelAndView mv
			,@ModelAttribute Review review
			, HttpSession session) {
		String url = "";
		try {
			String loginNickname = (String)session.getAttribute("userNickname");
			String writeNickname = review.getUserNickname();
			url = "/travel/detail.tp?travelNo="+review.getTravelNo();
			if(loginNickname != null && loginNickname.equals(writeNickname)) {
				int result = rSerivce.deleteReview(review);
				if(result > 0) {
					mv.addObject("msg", "리뷰가 삭제되었습니다.");
					mv.setViewName("redirect:"+url);
				} else {
					mv.addObject("msg", "리뷰 삭제가 완료되지 않았습니다.");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "자신의 댓글만 삭제할 수 있습니다.");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("url", "/travel/list.tp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
