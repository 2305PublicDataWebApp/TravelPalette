package com.semi.travelpalette.community.service;

import java.util.List;

import com.semi.travelpalette.community.domain.Community;

public interface CommunityService {

	/**
	 * 게시판별로 리스트 가져오기 Service
	 * @param boardType
	 * @return
	 */
	List<Community> selectCommunityList(String boardType);

}
