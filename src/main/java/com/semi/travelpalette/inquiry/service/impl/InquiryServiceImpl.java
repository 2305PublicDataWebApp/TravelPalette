package com.semi.travelpalette.inquiry.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.inquiry.domain.PageInfo;
import com.semi.travelpalette.inquiry.service.InquiryService;
import com.semi.travelpalette.inquiry.store.InquiryStore;

@Transactional
@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private SqlSession session;
	@Autowired
	private InquiryStore inquiryStore;
	
	
	@Override
	public List<Inquiry> selectInquiryList(PageInfo pInfo) {
		List<Inquiry>  iList = inquiryStore.selectInquiryList(session, pInfo);
		return iList;
	}
	

	@Override
	public int selectInquiryListCount(String userId) {
		int result = inquiryStore.selectInquiryListCount(session, userId);
		return result;
	}
	

	@Override
	public Inquiry selectOneInquiryPost(Inquiry inquiryInfo) {
		Inquiry inquiry = inquiryStore.selectOneInquiryPost(session, inquiryInfo);
		return inquiry;
	}

	@Override
	public int deleteInquiry(Inquiry inquiryInfo) {
		int result = inquiryStore.deleteInquiry(session, inquiryInfo);
		return result;
	}
	
	@Override
	public int insertInquiry(Inquiry inquiry) {
		int result = inquiryStore.insertInquiry(session, inquiry);
		return result;
	}

	@Override
	public int updateInquiry(Inquiry inquiry) {
		int result = inquiryStore.updateInquiry(session, inquiry);
		return result;
	}

	
	
	// 페이지 관련 메소드
	public PageInfo getPageInfo(Integer currentPage, String inquiryWriter, int totalCount) {
		PageInfo pi = null;
		int recordnaviCountPage = 10;	// 한 페이지에 보여줄 게시물(전체 게시물의 값이 필요)
		int naviCountPerPage = 5;	// 한 페이지에 보여줄 페이지의 개수(currentPage의 값이 필요)
		int naviTotalCount;		// 범위의 총 갯수(currentPage의 값이 필요)
		int startNavi;
		int endNavi;
		
		// (int) 강제 형변환, (double) 자동 형변환
		// 네비게이터의 총 갯수 = 총 게시물 / 한 페이지당 보여지는 게시물 + 0.9
		naviTotalCount = (int)((double)totalCount/recordnaviCountPage+0.9);
													// +0.9하면 알아서 반올림
		// currentPage값이 1~5일 때 startNavi가 1로 고정되도록 구해주는 식
		startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage -1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최대값보다 커질 수 있음
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, inquiryWriter, recordnaviCountPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}

	// **************************** 파일 관련 메소드 *********************************
	
	public void deleteFile(String fileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root + "\\iuploadFiles\\" + fileRename;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
	}


	@Override
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException {
		// HashMap 사용해서 파일 저장하기
		Map<String, Object> infoMap = new HashMap<String, Object>();
		// ===================== 파일 이름 설정하기 ==========================
		String fileName = uploadFile.getOriginalFilename();
		
		// ===================== 파일 경로 ==============================
		String root = request.getSession().getServletContext().getRealPath("resources");
		/*
		 * getServletContext() : 서블릿에 관련된 모든 정보를 가짐
		 * getTealPath("resources") : resources에 대한 경로를 가지고 옴
		 */
		String saveFolder = root + "\\iuploadFiles";
		// 파일 객체 만들기
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		// ===================== 파일 리네임(시간으로) ========================
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		
		// ===================== 확장자명 구하기 =====================
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		// 설정한 파일리네임 = B(파일 구분용) + 시간으로 리네임한 이름 + . + 확장자명
		String fileRename = "I" + strResult + "." + ext;
		// 최종 저장 경로 = 저장할 폴더(resources + 저장하는 폴더 위치 + \\ + 설정한 파일리네임)
		String savePath = saveFolder + "\\" + fileRename;
		// 파일 크기 구하기
		long fileLength = uploadFile.getSize();
		// ==================== 진짜 파일 저장 =======================
		File file = new File(savePath);
		uploadFile.transferTo(file); // 예외처리 해주기
		// HashMap에 데이터 put 하기
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("filePath", savePath);
		infoMap.put("fileLength", fileLength);

		return infoMap;
	}




	

}
