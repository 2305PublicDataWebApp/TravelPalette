package com.semi.travelpalette.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.map.service.MapService;

@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Autowired
	private MapService mService;
	
	@RequestMapping(value="/view.tp", method=RequestMethod.GET)
	public ModelAndView showMap(ModelAndView mv) {
		mv.setViewName("map/map");
		return mv;
	}

}
