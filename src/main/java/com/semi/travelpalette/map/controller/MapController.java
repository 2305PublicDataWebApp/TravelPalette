package com.semi.travelpalette.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.map.service.MapService;
import com.semi.travelpalette.travel.domain.Travel;

@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Autowired
	private MapService mService;
	
	@RequestMapping(value="/view.tp", method=RequestMethod.GET)
	public ModelAndView showMap(ModelAndView mv) {
		try {
			List<Travel> tList = mService.showTravelMap();
			if(tList.size() > 0) {
				mv.addObject("tList", tList);
				mv.setViewName("map/map");
			} else {
				mv.addObject("msg", "[서비스실패] 목록을 조회할 수 없습니다.");
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
