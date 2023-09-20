package com.semi.travelpalette.community.service;

import java.util.List;
import java.util.Map;

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
	 * 게시물 좋아요 여부 확인 Service
	 * @param like
	 * @return
	 */
	Like selectLikeByClass(Like like);

	/**
	 * 게시물 좋아요 누르기 Service
	 * @param like
	 * @return
	 */
	int insertLike(Like like);

	/**
	 * 게시물 좋아요 개수 수정하기 Service
	 * @param cOne
	 * @return
	 */
	int updateLikeNo(Community cOne);

	/**
	 * 게시물 좋아요 취소하기 Service
	 * @param like
	 * @return
	 */
	int deleteLike(Like like);

	/**
	 * 검색 게시물 총 갯수 Service
	 * @param paraMap
	 * @return
	 */
	int getSearchListCount(Map<String, String> paraMap);

	/**
	 * 검색한 게시물 리스트 불러오기 Service
	 * @param paraMap
	 * @param pInfo
	 * @return
	 */
	List<Community> searchListByKeyword(Map<String, String> paraMap, PageInfo pInfo);

	/** 
	 * 여행인증 게시판 정렬
	 * @param pInfo
	 * @return
	 */
	List<Community> selectSortList(PageInfo pInfo);

}
