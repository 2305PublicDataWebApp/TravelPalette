package com.semi.travelpalette.event.controller;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.event.service.EventService;

@Controller
@RequestMapping(value="/event")
public class EventController {

	@Autowired
	private EventService eService;
	
	@RequestMapping(value="/insert.tp", method=RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("event/write");
		return mv;
	}

	@RequestMapping(value = "/insert.tp", method = RequestMethod.POST)
	public ModelAndView insertEvent(
	        ModelAndView mv,
	        @ModelAttribute Event event,
	        @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
	        @RequestParam("eventStartDate") @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date eventStartDate,
	        @RequestParam("eventEndDate") @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date eventEndDate,
	        HttpServletRequest request) {
	
	    try {
	        event.setEventStartDate(new java.sql.Date(eventStartDate.getTime()));
	        event.setEventEndDate(new java.sql.Date(eventEndDate.getTime()));
	
	        if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
	        	// 파일 정보(이름, 리네임, 경로, 크기) 및 파일 저장
	            Map<String, Object> eMap = this.saveFile(request, uploadFile);
	            event.setEventFileName((String) eMap.get("fileName"));
	            event.setEventFileRename((String) eMap.get("fileRename"));
	            event.setEventFilePath((String) eMap.get("filePath"));
	            event.setEventFileLength((long) eMap.get("fileLength"));
	        }
	        int result = eService.insertEvent(event);
	        if (result > 0) {
	            mv.addObject("msg", "이벤트가 등록되었습니다.");
	            mv.addObject("url", "/event/list.tp");
	            mv.setViewName("common/successPage");
	        } else {
	            mv.addObject("msg", "[서비스실패] 이벤트가 등록되지 않았습니다.");
	            mv.addObject("url", "/event/insert.tp");
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
	
	@RequestMapping(value="/modify.tp", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("eventNo") int eventNo) {
		try {
			Event event = eService.selectEventByNo(eventNo);
			if(event != null) {
				mv.addObject("event", event);
				mv.setViewName("event/modify");
			} else {
				mv.addObject("msg", "[서비스실패] 이벤트 수정페이지 이동에 실패하였습니다.");
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

	@RequestMapping(value="/modify.tp", method=RequestMethod.POST)
	public ModelAndView updateEvent(
	        ModelAndView mv,
	        @ModelAttribute Event event,
	        @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
	        @RequestParam("eventStartDate") @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date eventStartDate,
	        @RequestParam("eventEndDate") @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date eventEndDate,
	        HttpServletRequest request) {
		try {
	        event.setEventStartDate(new java.sql.Date(eventStartDate.getTime()));
	        event.setEventEndDate(new java.sql.Date(eventEndDate.getTime()));
			
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 수정
				// 1. 대체, 삭제 후 등록
				// 기존 업로드 된 파일 존재 여부 체크 후 있으면 기존 파일 삭제
				String fileName = event.getEventFileRename();
				if(event.getEventFileName() != null) {
					// 있으면 기존 파일 삭제
					this.deleteFile(request, fileName);
				}
				// 없으면 새로 업로드 하려는 파일 저장
				Map<String, Object> infoMap = this.saveFile(request, uploadFile);
				
				// DB에 저장하기 위해 event에 데이터를 Set하는 부분임.
				String eventfileName = (String)infoMap.get("fileName");
				event.setEventFileName(eventfileName);
				String eventfileRename = (String)infoMap.get("fileRename");
				event.setEventFileRename(eventfileRename);
				event.setEventFilePath((String)infoMap.get("filePath"));
				event.setEventFileLength((long)infoMap.get("fileLength"));
			}
			int result = eService.updateEvent(event);
			if(result > 0) {
				mv.addObject("msg", "이벤트가 수정되었습니다.");
	            mv.addObject("url", "/event/detail.tp?eventNo=" + event.getEventNo());
	            mv.setViewName("common/successPage");
			}else {
	            mv.addObject("msg", "[서비스실패] 이벤트가 수정되지 않았습니다.");
	            mv.addObject("url", "/event/insert.tp");
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
	public ModelAndView deleteEvent(ModelAndView mv
			, @RequestParam(value="eventNo") int eventNo) {
		try {
			int result = eService.deleteByNo(eventNo);
			if(result > 0) {
				mv.addObject("msg", "이벤트가 삭제되었습니다");
				mv.addObject("url", "/event/list.tp");
				mv.setViewName("common/successPage");
			} else {
				mv.addObject("msg", "[서비스실패] 이벤트 삭제가 완료되지 않았습니다.");
				mv.addObject("url", "/event/detail.tp?eventNo="+eventNo);
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
	public ModelAndView showAllList(
			ModelAndView mv
			, @RequestParam(value = "eventCondition", required=false) String eventCondition
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			System.out.println(eventCondition);
			int totalCount = eService.getTotalCount(eventCondition);
			EventPageInfo pageInfo = getPageInfo(currentPage, totalCount);
			List<Event> eList = eService.eventAllListByNew(pageInfo, eventCondition);
			if(eList.size() > 0) {
				mv.addObject("eventCondition", eventCondition);
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("eList", eList);
				mv.setViewName("event/list");
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
	
//	@RequestMapping(value="/list.tp", method=RequestMethod.GET)
//	public ModelAndView showIngEventList(
//			ModelAndView mv
//			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
//		try {
//			int totalCount = eService.getTotalCount();
//			EventPageInfo pageInfo = getPageInfo(currentPage, totalCount);
//			List<Event> eList = eService.eventAllListByNew(pageInfo);
//			if(eList.size() > 0) {
//				mv.addObject("pageInfo", pageInfo);
//				mv.addObject("totalCount", totalCount);
//				mv.addObject("eList", eList);
//				mv.setViewName("event/list");
//			} else {
//				mv.addObject("msg", "[서비스실패] 목록을 조회할 수 없습니다.");
//				mv.setViewName("common/errorPage");
//			}	
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("error", e.getMessage());
//			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
	

	@RequestMapping(value="detail.tp", method=RequestMethod.GET)
	public ModelAndView eventDetail (
			ModelAndView mv
			, @RequestParam(value="eventNo") int eventNo) {
		try {
			Event event = eService.selectEventByNo(eventNo);
			if(event != null) {
				mv.addObject("event", event);
				mv.setViewName("event/detail");
			} else {
				mv.addObject("msg", "[서비스실패] 이벤트를 조회할 수 없습니다..");
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


	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		HashMap<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장 경로
		String savePath = root + "\\euploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// ********************** 파일 저장 **********************
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		// ====================== 파일 크기 ======================
		long fileLength = uploadFile.getSize();
		// 파일 이름, 경로, 크기를 넘겨주기위해 Map에 정보를 저장한 후 return 함
				// 왜 return 하는 가? DB에 저장하기 위해서 필요한 정보니까
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/euploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}

	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delfilepath = root + "\\euploadFiles\\" + fileName;
		File file = new File(delfilepath);
		if(file.exists()) {
			file.delete();
		}
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
}
