package com.semi.travelpalette.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@RequestMapping(value="/qList.tp", method=RequestMethod.GET)
	public ModelAndView goMovieTimePage(ModelAndView mv) {
		
		mv.setViewName("community/questionList");
		return mv;
	}
}
