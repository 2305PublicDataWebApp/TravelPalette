package com.semi.travelpalette.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.admin.store.AdminStore;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore {

	@Override
	public int getTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("AdminMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public List<User> eventAllListByNew(SqlSession sqlSession, EventPageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> aList = sqlSession.selectList("AdminMapper.showUserList", null, rowBounds);
		return aList;
	}

	@Override
	public int getInquiryTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("AdminMapper.getInquiryCount");
		return totalCount;
	}

	@Override
	public List<Inquiry> showInquiryList(SqlSession sqlSession, EventPageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Inquiry> inqList = sqlSession.selectList("AdminMapper.showInquiryList", null, rowBounds);
		return inqList;
	}

	@Override
	public Inquiry selectOneInquiry(SqlSession sqlSession, int inquiryNo) {
		Inquiry inquiry = sqlSession.selectOne("AdminMapper.showOneInquiry", inquiryNo);
		return inquiry;
	}

	@Override
	public Response selectOneResponse(SqlSession sqlSession, int inquiryNo) {
		Response response = sqlSession.selectOne("AdminMapper.selectOneResponse", inquiryNo);
		return response;
	}

	@Override
	public int insertResponse(SqlSession sqlSession, Response response) {
		int result = sqlSession.insert("AdminMapper.insertResponse", response);
		return result;
	}

	@Override
	public int changeInquiryStatus(SqlSession sqlSession, int inquiryNo) {
		int result = sqlSession.update("AdminMapper.changeInquiryStatus", inquiryNo);
		return result;
	}

	@Override
	public int modifyResponse(SqlSession sqlSession, Response response) {
		int result = sqlSession.update("AdminMapper.modifyResponse", response);
		return result;
	}

}
