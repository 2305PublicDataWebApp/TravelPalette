package com.semi.travelpalette.community.service;

import java.util.List;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.community.domain.Community;

public interface CommunityService {

    /**
     * 게시판별로 리스트 가져오기 Service
     * @param pInfo
     * @return
     */
    List<Community> selectCommunityList(PageInfo pInfo);

    /**
     * 게시판 별 게시물 총 갯수 불러오기 Service 
     * @param boardType
     * @return
     */
    int getListCountByBoardType(String boardType);

    /**
     * 게시물 상세보기 Service
     * @param community
     * @return
     */
    Community selectOneByClass(Community community);

    /**
     * 게시물 등록 Service
     * @param community
     * @return
     */
    int insertBoard(Community community);

    /**
     * 게시물 수정 Service
     * @param community
     * @return
     */
    int updateBoard(Community community);
    
    /**
     * 게시물 삭제 Service
     * @param community
     * @return
     */
    int deleteBoard(Community community);

    /**
     * max 게시물 번호 불러오기 Service
     * @return
     */
	int selectMaxNo();

	/**
	 * 게시물 조회수 증가 Service
	 * @param community
	 * @return
	 */
	int updateViewCount(Community community);

	/**
	 * 게시물 좋아요 여부 확인
	 * @param like
	 * @return
	 */
	Like selectLikeByClass(Like like);

}
