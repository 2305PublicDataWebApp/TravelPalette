package com.semi.travelpalette.community.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

}