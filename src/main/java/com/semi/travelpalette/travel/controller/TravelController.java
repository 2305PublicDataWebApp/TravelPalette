package com.semi.travelpalette.travel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelPageInfo;
import com.semi.travelpalette.travel.service.TravelService;

@Controller
@RequestMapping(value="/travel")
public class TravelController {

	@Autowired
	private TravelService tService;
	
	@RequestMapping(value="/insert.tp", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {
		mv.setViewName("travel/write");
		return mv;
	}
	@RequestMapping(value="/insert.tp", method=RequestMethod.POST)
	public ModelAndView insertTravel(
			ModelAndView mv
			, Travel travel) {
		try {
			int result = tService.insertTravel(travel);
			if(result > 0) {
				mv.addObject("msg", "여행정보가 등록되었습니다.");
				mv.addObject("url", "/travel/list.tp");
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 여행정보가 등록되지 않았습니다.");
				mv.addObject("url", "/travel/insert.tp");
				mv.setViewName("common/errorPage");
			}	
		} catch (Exception e) {
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/list.tp", method=RequestMethod.GET)
	public ModelAndView showAllList(
			ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = tService.getTotalCount();
			TravelPageInfo pageInfo = getPageInfo(currentPage, totalCount);
			List<Travel> tList = tService.travelAllListByNew(pageInfo);
			if(tList.size() > 0) {
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("tList", tList);
				mv.setViewName("travel/list");
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

	@RequestMapping(value="detail.tp", method=RequestMethod.GET)
	public ModelAndView travelDetail (
			ModelAndView mv
			, @RequestParam(value="travelNo") int travelNo) {
		try {
			Travel travel = tService.selectTravelByNo(travelNo);
			if(travel != null) {
				mv.addObject("travel", travel);
				mv.setViewName("travel/detail");
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
	
	
	private TravelPageInfo getPageInfo(Integer currentPage, int totalCount) {
		//네비게이터 필요변수 : recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi
		//고정변수
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		//계산변수
		int naviTotalCount = (int)((double)totalCount / recordCountPerPage + 0.9);
		int startNavi = (((int)((double)currentPage / naviCountPerPage + 0.9)) -1) * naviCountPerPage +1 ;
		int endNavi = startNavi + naviCountPerPage -1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		TravelPageInfo pageInfo = new TravelPageInfo(naviTotalCount, currentPage, recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi);
		return pageInfo;
	}
}

