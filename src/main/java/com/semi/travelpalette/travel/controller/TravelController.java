package com.semi.travelpalette.travel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Review;
import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelFile;
import com.semi.travelpalette.travel.service.ReviewService;
import com.semi.travelpalette.travel.service.TravelService;

@Controller
@RequestMapping(value="/travel")
public class TravelController {

	@Autowired
	private TravelService tService;
	
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value="/insert.tp", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {
		mv.setViewName("travel/write");
		return mv;
	}
	
	@RequestMapping(value="/insert.tp", method=RequestMethod.POST)
	public ModelAndView insertTravel(
			ModelAndView mv
			, @ModelAttribute Travel travel
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request) {
		try {
			int result = tService.insertTravel(travel, uploadFiles, request);
			
			if(result > 0) {
				mv.addObject("msg", "여행정보가 등록되었습니다.");
				mv.addObject("url", "/travel/list.tp");
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 여행정보가 등록되지 않았습니다.");
				mv.addObject("url", "/travel/insert.tp");
				mv.setViewName("common/errorPage");
			}	
		} 
		catch (Exception e) {
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/modify.tp", method=RequestMethod.GET)
	public ModelAndView showModifyForm(
			ModelAndView mv
			, @RequestParam(value="travelNo") Integer travelNo) {
		try {
			Travel tOne = tService.selectTravelByNo(travelNo);
			List<TravelFile> travelFiles = tService.selectTravelFileByNo(tOne.getTravelNo());
			mv.addObject("travel", tOne);
			mv.addObject("travelFiles", travelFiles);
			mv.setViewName("travel/modify");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/modify.tp", method=RequestMethod.POST)
	public ModelAndView modifyTravel(
			ModelAndView mv
			, @ModelAttribute Travel travel
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request) {
		try {
			int result = tService.updateTravel(travel, uploadFiles, request);
			if(result > 0) {
				mv.addObject("travel", travel);
				mv.addObject("msg", "여행정보가 수정되었습니다.");
				mv.addObject("url", "/travel/detail.tp?travelNo="+travel.getTravelNo());
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 여행정보가 수정되지 않았습니다.");
				mv.addObject("url", "/travel/modify.tp?travelNo="+travel.getTravelNo());
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
	
	@RequestMapping(value="/delete.tp", method=RequestMethod.GET)
	public ModelAndView deleteTravel(
			ModelAndView mv
			, @RequestParam(value="travelNo") Integer travelNo) {
		try {
			int result = tService.deleteByNo(travelNo);
			if(result > 0) {
				mv.addObject("msg", "여행정보가 삭제되었습니다");
				mv.addObject("url", "/travel/list.tp");
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 삭제가 완료되지 않았습니다.");
				mv.addObject("url", "/travel/detail.tp?travelNo="+travelNo);
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
	
	@RequestMapping(value="/deleteFile.tp", method=RequestMethod.GET)
	public ModelAndView deleteFile(
			ModelAndView mv
			, @RequestParam(value="travelFileNo") Integer travelFileNo
			, @RequestParam(value="travelNo") Integer travelNo) {
		try {
			TravelFile travelFile = new TravelFile(travelNo, travelFileNo);
			int result = tService.deleteFileByNo(travelFile);
			if(result > 0) {
				mv.addObject("msg", "파일삭제가 완료되었습니다");
				mv.addObject("url", "/travel/modify.tp?travelNo="+travelNo);
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 파일삭제가 완료되지 않았습니다.");
				mv.addObject("url", "/travel/modify.tp?travelNo="+travelNo);
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
	
	
	@RequestMapping(value="/detail.tp", method=RequestMethod.GET)
	public ModelAndView travelDetail (
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="travelNo") Integer travelNo
			, @RequestParam(value = "page", required=false, defaultValue="1") Integer currentPage) {
		try {
			Travel travel = tService.selectTravelByNo(travelNo);
			if (travel != null) {
				List<TravelFile> travelFiles = tService.selectTravelFileByNo(travel.getTravelNo());
				//조회수 증가
				tService.updateViewCount(travelNo);
				
//				 String userNickname = (String) session.getAttribute("userNickname");
//				 if(userNickname != null && userNickname != "") {
//					 //닉네임과 여행지번호로 리뷰조회
//					 Review review = new Review(userNickname, travelNo);
//					 Review	myReview = rService.selectMyReview(review);
//					 if(myReview != null) {
//						 mv.addObject("myReview", myReview);
//					 }
//				 }
				 
				//리뷰목록 페이징
				int totalCount = rService.getReviewTotalCount(travelNo);
				int recordCountPerPage = 5;
				int naviCountPerPage = 5;
				PageInfo pageInfo = this.getPageInfo(currentPage, totalCount, recordCountPerPage, naviCountPerPage);
				
				//페이징정보와 여행지번호 맵으로 묶기
				Map<String, Object> reviewMap = new HashMap<String, Object>();
				reviewMap.put("pageInfo", pageInfo);
				reviewMap.put("travelNo", travelNo);
				
				//전체리뷰 조회
				List<Review> rList = rService.selectReviewByTNo(reviewMap);
				if(!rList.isEmpty()) { 
					mv.addObject("reviewPageInfo", pageInfo);					
					mv.addObject("review", rList);					
				}
				mv.addObject("travel", travel);
				mv.addObject("travelFiles", travelFiles);
				mv.setViewName("travel/detail");				
			} else {
				mv.addObject("msg", "[서비스실패] 여행정보를 조회할 수 없습니다.");
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

	@RequestMapping(value="/list.tp", method=RequestMethod.GET)
	public ModelAndView sortList(
			ModelAndView mv
			, @RequestParam(value = "order", required=false) String order
			, @RequestParam(value = "page", required=false, defaultValue="1") Integer currentPage
			, @RequestParam(value = "region", required = false) String selectedLocation
			, @RequestParam(value = "keyword", required = false) String selectedKeyword) {
		try {
			int totalCount = tService.getTotalCount();
			int recordCountPerPage = 10;
			int naviCountPerPage = 5;
			PageInfo pageInfo = this.getPageInfo(currentPage, totalCount, recordCountPerPage, naviCountPerPage);
			
			//페이징객체와 order(정렬키워드)를 map에 담아서 전달
			Map<String, Object> sortMap = new HashMap<String, Object>();
			sortMap.put("pageInfo", pageInfo);
			sortMap.put("order", order);
			
			// 검색 필터 적용 여부를 확인
	        boolean applyFilter = false;
	        
	        if (selectedLocation != null && !selectedLocation.isEmpty()) {
	            sortMap.put("selectedLocation", selectedLocation);
	            applyFilter = true;
	        }
	        
	        if (selectedKeyword != null && !selectedKeyword.isEmpty()) {
	            sortMap.put("selectedKeyword", selectedKeyword);
	            applyFilter = true;
	        }
	        
	        List<Travel> tList;
	        
	        if (applyFilter) {
	            // 검색 필터가 적용되면 해당 필터로 목록을 가져옴
	            tList = tService.travelSortList(sortMap);
	        } else {
	            // 검색 필터가 적용되지 않으면 모든 목록을 가져옴
	            tList = tService.travelSortList(sortMap);
	        }
	        
			System.out.println("******************selectedLocation :" + selectedLocation);
			System.out.println("******************selectedKeyword :" + selectedKeyword);
			//List<Travel> tList = tService.travelSortList(sortMap);				


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

	private PageInfo getPageInfo(Integer currentPage, int totalCount, int recordCountPerPage, int naviCountPerPage) {
		//네비게이터 필요변수 : recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi
		//고정변수를 파라미터로 받아서 처리
		//int recordCountPerPage = 10;
		//int naviCountPerPage = 5;
		//계산변수
		int naviTotalCount = (int)((double)totalCount / recordCountPerPage + 0.9);
		int startNavi = (((int)((double)currentPage / naviCountPerPage + 0.9)) -1) * naviCountPerPage +1 ;
		int endNavi = startNavi + naviCountPerPage -1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pageInfo = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pageInfo;
	}
}

