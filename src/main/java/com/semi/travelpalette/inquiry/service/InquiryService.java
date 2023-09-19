package com.semi.travelpalette.inquiry.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.inquiry.domain.PageInfo;

public interface InquiryService {

	/**
	 * 세션에 저장된 아이디로 문의 내역 불러오기
	 * @param pInfo
	 * @return
	 */
	List<Inquiry> selectInquiryList(PageInfo pInfo);

	/**
	 * 유저가 작성한 게시물 갯수 구해오기
	 * @param userId
	 * @return
	 */
	int selectInquiryListCount(String userId);

	/**
	 * 페이지 인포 메소드
	 * @param currentPage
	 * @param userId
	 * @param totalCount
	 * @return
	 */
	PageInfo getPageInfo(Integer currentPage, String userId, int totalCount);

	/**
	 * 문의사항 디테일 이동
	 * @param inquiryInfo
	 * @return
	 */
	Inquiry selectOneInquiryPost(Inquiry inquiryInfo);

	/**
	 * 문의사항 삭제
	 * @param inquiryInfo
	 * @return
	 */
	int deleteInquiry(Inquiry inquiryInfo);

	/**
	 * 문의사항 작성
	 * @param inquiry
	 * @return
	 */
	int insertInquiry(Inquiry inquiry);

	/**
	 * 첨부 파일 저장 메소드
	 * @param request
	 * @param uploadFile
	 * @return
	 * @throws IOException 
	 * @throws Exception 
	 */
	Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException;

	/**
	 * 삭제 메소드
	 * @param fileRename
	 * @param request
	 */
	void deleteFile(String fileRename, HttpServletRequest request);

	/**
	 * 문의사항 수정
	 * @param inquiry
	 * @return
	 */
	int updateInquiry(Inquiry inquiry);

}
