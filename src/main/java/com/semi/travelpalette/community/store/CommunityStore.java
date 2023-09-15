package com.semi.travelpalette.community.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.community.domain.Community;

public interface CommunityStore {

	/**
	 * 게시판별로 리스트 가져오기 Store
	 * @param boardType
	 * @return
	 */
	List<Community> selectCommunityList(SqlSession session, String boardType);

}
