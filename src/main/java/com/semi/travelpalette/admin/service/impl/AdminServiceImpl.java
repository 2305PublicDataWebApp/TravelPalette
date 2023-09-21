package com.semi.travelpalette.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.admin.service.AdminService;
import com.semi.travelpalette.admin.store.AdminStore;
import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.user.domain.User;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AdminStore aStore;
	
	@Override
	public int getTotalCount() {
		int totalCount = aStore.getTotalCount(sqlSession);
		return totalCount;
	}

	@Override
	public List<User> showUserList(EventPageInfo pageInfo) {
		List<User> aList = aStore.eventAllListByNew(sqlSession, pageInfo);
		return aList;
	}

	@Override
	public int getInquiryTotalCount() {
		int totalCount = aStore.getInquiryTotalCount(sqlSession);
		return totalCount;
	}

	@Override
	public List<Inquiry> showInquiryList(EventPageInfo pageInfo) {
		List<Inquiry> aList = aStore.showInquiryList(sqlSession, pageInfo);
		return aList;
	}

	@Override
	public Inquiry selectOneInquiry(int inquiryNo) {
		Inquiry inquiry = aStore.selectOneInquiry(sqlSession, inquiryNo);
		return inquiry;
	}

	@Override
	public Response selectOneResponse(int inquiryNo) {
		Response response = aStore.selectOneResponse(sqlSession, inquiryNo);
		return response;
	}

	@Override
	public int insertResponse(Response response) {
		int result = aStore.insertResponse(sqlSession, response);
		return result;
	}

	@Override
	public int changeInquiryStatus(int inquiryNo) {
		int result = aStore.changeInquiryStatus(sqlSession, inquiryNo);
		return result;
	}

	@Override
	public int modifyResponse(Response response) {
		int result = aStore.modifyResponse(sqlSession, response);
		return result;
	}

}
