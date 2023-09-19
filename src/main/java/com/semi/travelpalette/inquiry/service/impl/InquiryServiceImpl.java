package com.semi.travelpalette.inquiry.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	

}
