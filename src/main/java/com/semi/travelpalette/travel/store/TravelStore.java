package com.semi.travelpalette.travel.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;

public interface TravelStore {

	/**
	 * 등록최신순 조회 Store
	 * @param sqlSession
	 * @param tInfo 
	 * @return
	 */
	List<Travel> travelAllListByNew(SqlSession session, PageInfo pageInfo);

	/**
	 * 전체 레코드 개수 Store
	 * @param sqlSession
	 * @return
	 */
	int getTotalCount(SqlSession sqlSession);

	/**
	 * 여행정보 상세조회 Store
	 * @param sqlSession
	 * @param travelNo
	 * @return
	 */
	Travel selectTravelByNo(SqlSession session, int travelNo);

	/**
	 * 여행정보 등록 Store
	 * @param sqlSession
	 * @param travel
	 * @return
	 */
	int insertTravel(SqlSession session, Travel travel);

}
