package com.semi.travelpalette.travel.controller;

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
	
}
