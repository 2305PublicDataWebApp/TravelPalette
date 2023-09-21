package com.semi.travelpalette.admin.service;

import java.util.List;

import com.semi.travelpalette.admin.domain.Response;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.inquiry.domain.Inquiry;
import com.semi.travelpalette.user.domain.User;

public interface AdminService {

	int getTotalCount();

	List<User> showUserList(EventPageInfo pageInfo);

	int getInquiryTotalCount();

	List<Inquiry> showInquiryList(EventPageInfo pageInfo);

	Inquiry selectOneInquiry(int inquiryNo);

	Response selectOneResponse(int inquiryNo);

	int insertResponse(Response response);

	int changeInquiryStatus(int inquiryNo);

	int modifyResponse(Response response);

}
