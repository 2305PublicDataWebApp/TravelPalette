package com.semi.travelpalette.community.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.community.domain.Community;

public interface CommunityStore {

    /**
     * 게시판별로 리스트 가져오기 Store
     * @param pInfo
     * @return
     */
    List<Community> selectCommunityList(SqlSession session, PageInfo pInfo);

    /**
     * 게시판 별 게시물 갯수 불러오기 Store
     * @param boardType
     * @return
     */
    int getListCountByBoardType(SqlSession session, String boardType);

    /**
     * 게시물 상세보기 Store
     * @param session
     * @param community
     * @return
     */
    Community selectOneByClass(SqlSession session, Community community);

    /**
     * 게시물 등록 Store
     * @param session
     * @param community
     * @return
     */
    int insertBoard(SqlSession session, Community community);
    
    /**
     * 게시물 수정 Store
     * @param session
     * @param community
     * @return
     */
    int updateBoard(SqlSession session, Community community);

    /**
     * 게시물 삭제 Store
     * @param session
     * @param community
     * @return
     */
    int deleteBoard(SqlSession session, Community community);

    /**
     * 게시물 max 번호 불러오기 Store
     * @param session
     * @return
     */
	int selectMaxNo(SqlSession session);

	/**
	 * 게시물 조회수 증가 Store
	 * @param session
	 * @param community
	 * @return
	 */
	int updateViewCount(SqlSession session, Community community);

	/**
	 * 게시물 좋아요 여부 확인 Store
	 * @param session
	 * @param like
	 * @return
	 */
	Like selectLikeByClass(SqlSession session, Like like);

	/** 
	 * 게시물 좋아요 누르기 Store
	 * @param session
	 * @param like
	 * @return
	 */
	int insertLike(SqlSession session, Like like);

	/**
	 * 게시물 좋아요 개수 수정하기 Store
	 * @param session
	 * @param cOne
	 * @return
	 */
	int updateLikeNo(SqlSession session, Community cOne);

	/**
	 * 게시물 좋아요 취소하기 Store
	 * @param session
	 * @param like
	 * @return
	 */
	int deleteLike(SqlSession session, Like like);

}