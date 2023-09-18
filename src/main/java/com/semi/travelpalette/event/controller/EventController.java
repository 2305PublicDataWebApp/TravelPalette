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
	public ModelAndView showWriteForm(ModelAndView mv) {
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
                // ���� ����(�̸�, ������, ���, ũ��) �� ���� ����
                Map<String, Object> eMap = this.saveFile(request, uploadFile);
                event.setEventFileName((String) eMap.get("fileName"));
                event.setEventFileRename((String) eMap.get("fileRename"));
                event.setEventFilePath((String) eMap.get("filePath"));
                event.setEventFileLength((long) eMap.get("fileLength"));
            }
            int result = eService.insertEvent(event);
            if (result > 0) {
                mv.addObject("msg", "�̺�Ʈ�� ��ϵǾ����ϴ�.");
                mv.addObject("url", "/event/list.tp");
                mv.setViewName("common/successPage");
            } else {
                mv.addObject("msg", "[���񽺽���] �̺�Ʈ�� ��ϵ��� �ʾҽ��ϴ�.");
                mv.addObject("url", "/event/insert.tp");
                mv.setViewName("common/errorPage");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("error", e.getMessage());
            mv.addObject("msg", "[���񽺽���] �����ڿ� ���ǹٶ��ϴ�.");
            mv.setViewName("common/errorPage");
        }
        return mv;
    }
	
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		HashMap<String, Object> fileMap = new HashMap<String, Object>();
		// resources ��� ���ϱ�
		String root = request.getSession().getServletContext().getRealPath("resources");
		// ���� ���� ���
		String savePath = root + "\\buploadFiles";
		// ���� �̸� ���ϱ�
		String fileName = uploadFile.getOriginalFilename();
		// ���� Ȯ���� ���ϱ�
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// �ð����� ���� �������ϱ�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		// ���� ���� �� ���� �����
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// ********************** ���� ���� **********************
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		// ====================== ���� ũ�� ======================
		long fileLength = uploadFile.getSize();
		// ���� �̸�, ���, ũ�⸦ �Ѱ��ֱ����� Map�� ������ ������ �� return ��
		// �� return �ϴ� ��? DB�� �����ϱ� ���ؼ� �ʿ��� �����ϱ�
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/buploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delfilepath = root + "\\nuploadFiles\\" + fileName;
		File file = new File(delfilepath);
		if(file.exists()) {
			file.delete();
		}
	}
	@RequestMapping(value="/list.tp", method=RequestMethod.GET)
	public ModelAndView showAllList(
			ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = eService.getTotalCount();
			EventPageInfo pageInfo = getPageInfo(currentPage, totalCount);
			List<Event> eList = eService.eventAllListByNew(pageInfo);
			if(eList.size() > 0) {
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("eList", eList);
				mv.setViewName("event/list");
			} else {
				mv.addObject("msg", "[���񽺽���] ����� ��ȸ�� �� �����ϴ�.");
				mv.setViewName("common/errorPage");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[���񽺽���] �����ڿ� ���ǹٶ��ϴ�.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

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
				mv.addObject("msg", "[���񽺽���] ����� ��ȸ�� �� �����ϴ�.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[���񽺽���] �����ڿ� ���ǹٶ��ϴ�.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


	private EventPageInfo getPageInfo(Integer currentPage, int totalCount) {
		//�׺������ �ʿ亯�� : recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi
		//��������
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		//��꺯��
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
