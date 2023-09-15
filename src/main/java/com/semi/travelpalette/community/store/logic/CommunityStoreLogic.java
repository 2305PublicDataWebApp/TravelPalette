package com.semi.travelpalette.community.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.store.CommunityStore;

public class CommunityStoreLogic implements CommunityStore{

	@Override
	public List<Community> selectCommunityList(SqlSession session, String boardType) {
		List<Community> cList = session.selectList("CommunityMapper.selectCommunityList", boardType);
		return cList;
	}

}
