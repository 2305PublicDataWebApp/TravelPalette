package com.semi.travelpalette.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService cService;
	
	@RequestMapping(value="/qList.tp", method=RequestMethod.GET)
	public ModelAndView goMovieTimePage(ModelAndView mv
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer curruntPage
			, @RequestParam(value= "boardType", required = false, defaultValue="Q&ABoard") String boardType) {
		
		try {
//			int totalCount = cService.getListCount();
//			PageInfo pInfo = this.getPageInfo(curruntPage, totalCount);
			List<Community> cList = cService.selectCommunityList(boardType);

			if (cList.size() > 0) {
				mv.addObject("cList", cList);
				mv.setViewName("questionList");
				return mv;
			} else {
				mv.addObject("msg", "리스트 불러오기에 실패하였습니다.");
				mv.addObject("url", "/");
				mv.setViewName("common/errorPage");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			mv.setViewName("/");
			return mv;
		}
	}
}
