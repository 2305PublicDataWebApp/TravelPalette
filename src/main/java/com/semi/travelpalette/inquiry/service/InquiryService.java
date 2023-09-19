package com.semi.travelpalette.inquiry.service;

import java.util.List;

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

}
