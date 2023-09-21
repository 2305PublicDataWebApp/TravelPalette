package com.semi.travelpalette.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.user.domain.User;

public interface AdminStore {

	int getTotalCount(SqlSession sqlSession);

	List<User> eventAllListByNew(SqlSession sqlSession, EventPageInfo pageInfo);

	int getInquiryTotalCount(SqlSession sqlSession);

	List<Inquiry> showInquiryList(SqlSession sqlSession, EventPageInfo pageInfo);

	Inquiry selectOneInquiry(SqlSession sqlSession, int inquiryNo);

	Response selectOneResponse(SqlSession sqlSession, int inquiryNo);

	int insertResponse(SqlSession sqlSession, Response response);

	int changeInquiryStatus(SqlSession sqlSession, int inquiryNo);

	int modifyResponse(SqlSession sqlSession, Response response);

}
