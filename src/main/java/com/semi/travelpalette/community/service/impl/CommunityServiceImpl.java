package com.semi.travelpalette.community.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.service.CommunityService;
import com.semi.travelpalette.community.store.CommunityStore;

public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityStore cStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Community> selectCommunityList(String boardType) {
		List<Community> cList = cStore.selectCommunityList(session, boardType);
		return cList;
	}

}
