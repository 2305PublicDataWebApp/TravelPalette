package com.semi.travelpalette.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.admin.service.AdminService;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.user.domain.User;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value="/list.tp", method=RequestMethod.GET)
	public ModelAndView showUserList(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
		int totalCount = aService.getTotalCount();
		EventPageInfo pageInfo = getPageInfo(currentPage, totalCount);
		List<User> aList = aService.showUserList(pageInfo);
			if(aList.size() > 0) {
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("aList", aList);
				mv.setViewName("admin/adminView");
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

	
	private EventPageInfo getPageInfo(Integer currentPage, int totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		EventPageInfo pageInfo = new EventPageInfo(naviTotalCount, currentPage, recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi);
		return pageInfo;
	}
	
	@RequestMapping(value="/inquirylist.tp", method=RequestMethod.GET)
	public ModelAndView showInquiryList (ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		int totalCount = aService.getInquiryTotalCount();
		EventPageInfo pageInfo = getPageInfo(currentPage, totalCount);
		List<Inquiry> inqList = aService.showInquiryList(pageInfo);
		try {
			if(inqList.size() > 0) {
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("inqList", inqList);
				mv.setViewName("response/list");
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
	
	@RequestMapping(value="/responsedetail.tp", method=RequestMethod.GET)
	public ModelAndView showInquiryDetail (ModelAndView mv
			, @RequestParam(value="inquiryNo") int inquiryNo) {
		Inquiry iPost = aService.selectOneInquiry(inquiryNo);
		Response rPost = aService.selectOneResponse(inquiryNo);
		try {
			if(iPost != null) {
				mv.addObject("iPost", iPost);
				mv.addObject("rPost", rPost);
				mv.setViewName("response/detail");
			} else {
				mv.addObject("msg", "[서비스실패] 문의를 조회할 수 없습니다.");
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
	
	@RequestMapping(value="/insertresponse.tp", method=RequestMethod.GET)
	public ModelAndView showInsertResponse (ModelAndView mv
			, @RequestParam(value="inquiryNo") int inquiryNo) {
		Inquiry iPost = aService.selectOneInquiry(inquiryNo);
		try {
			if(iPost != null) {
				mv.addObject("iPost", iPost);
				mv.setViewName("response/insert");
			} else {
				mv.addObject("msg", "[서비스실패] 문의를 조회할 수 없습니다.");
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
	
	@RequestMapping(value="/insertresponse.tp", method=RequestMethod.POST)
	public ModelAndView insertResponse(ModelAndView mv
			, @ModelAttribute Response response
			, @RequestParam(value="inquiryNo") int inquiryNo) {
	    try {
	        response.setInquiryNo(inquiryNo);
	        int result = aService.insertResponse(response);
	        int result2 = aService.changeInquiryStatus(inquiryNo);

	        if (result > 0 && result2 > 0) {
	            mv.addObject("msg", "문의 답변이 등록되었습니다.");
	            mv.addObject("url", "/admin/inquirylist.tp");
	            mv.setViewName("common/successPage");
	        } else {
	            mv.addObject("msg", "[서비스실패] 문의 답변 등록을 할 수 없습니다.");
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
	
	@RequestMapping(value="/modifyresponse.tp", method=RequestMethod.GET)
	public ModelAndView showModifyResponse (ModelAndView mv
			, @RequestParam(value="inquiryNo") int inquiryNo) {
		Inquiry iPost = aService.selectOneInquiry(inquiryNo);
		Response rPost = aService.selectOneResponse(inquiryNo);
		try {
			if(iPost != null) {
				mv.addObject("iPost", iPost);
				mv.addObject("rPost", rPost);
				mv.setViewName("response/modify");
			} else {
				mv.addObject("msg", "[서비스실패] 문의를 조회할 수 없습니다.");
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


	@RequestMapping(value="/modifyresponse.tp", method=RequestMethod.POST)
	public ModelAndView modifyResponse(ModelAndView mv
			, @ModelAttribute Response response
			, @RequestParam(value="inquiryNo") int inquiryNo) {
		try {
			response.setInquiryNo(inquiryNo);
			
			int result = aService.modifyResponse(response);
			
			if (result > 0) {
				mv.addObject("msg", "문의 답변이 수정되었습니다.");
				mv.addObject("url", "/admin/inquirylist.tp");
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 문의 답변 수정을 할 수 없습니다.");
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
