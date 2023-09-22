package com.semi.travelpalette.inquiry.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.inquiry.domain.PageInfo;
import com.semi.travelpalette.inquiry.service.InquiryService;
import com.semi.travelpalette.inquiry.store.InquiryStore;


@Repository
public class InquiryStoreLogic implements InquiryStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Inquiry> selectInquiryList(PageInfo pInfo) {
		String inquiryWriter = pInfo.getInquiryWriter();
		int limit = pInfo.getrecordnaviCountPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Inquiry> iList = session.selectList("InquiryMapper.selectInquiryList", inquiryWriter, rowBounds);
		return iList;	
	}

	@Override
	public int selectInquiryListCount(String userId) {
		int result = session.selectOne("InquiryMapper.selectInquiryListCount", userId);
		return result;
	}

	@Override
	public Inquiry selectOneInquiryPost(Inquiry inquiryInfo) {
		Inquiry inquiry = session.selectOne("InquiryMapper.selectOneInquiryPost", inquiryInfo);
		return inquiry;
	}

	@Override
	public int deleteInquiry(Inquiry inquiryInfo) {
		int result = session.update("InquiryMapper.deleteInquiry", inquiryInfo);
		return result;
	}

	@Override
	public int insertInquiry(Inquiry inquiry) {
		int result = session.insert("InquiryMapper.insertInquiry", inquiry);
		return result;
	}

	@Override
	public int updateInquiry(Inquiry inquiry) {
		int result = session.update("InquiryMapper.updateInquiry", inquiry);
		return result;
	}

	@Override
	public Response selectInquiryResponse(Integer inquiryNo) {
		return session.selectOne("InquiryMapper.selectInquiryResponse", inquiryNo);
	}


	
	


}
