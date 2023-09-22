package com.semi.travelpalette.inquiry.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.inquiry.domain.PageInfo;

public interface InquiryStore {


	/**
	 * 세션에 저장된 아이디로 문의 내역 불러오기
	 * @param session 
	 * @param pInfo
	 * @return
	 */
	List<Inquiry> selectInquiryList(PageInfo pInfo);

	/**
	 * 유저가 작성한 게시글 총 갯수 구해오기
	 * @param session 
	 * @param userId
	 * @return
	 */
	int selectInquiryListCount(String userId);

	/**
	 * 문의사항 디테일 
	 * @param session
	 * @param inquiryInfo
	 * @return
	 */
	Inquiry selectOneInquiryPost(Inquiry inquiryInfo);

	/**
	 * 문의사항 삭제
	 * @param session
	 * @param inquiryInfo
	 * @return
	 */
	int deleteInquiry(Inquiry inquiryInfo);

	/**
	 * 문의사항 등록
	 * @param session
	 * @param inquiry
	 * @return
	 */
	int insertInquiry(Inquiry inquiry);

	/**
	 * 문의사항 수정
	 * @param session
	 * @param inquiry
	 * @return
	 */
	int updateInquiry(Inquiry inquiry);

	Response selectInquiryResponse(Integer inquiryNo);

}
