package com.semi.travelpalette.travel.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelFile;

public interface TravelStore {


	/**
	 * 여행정보 등록 Store
	 * @param sqlSession
	 * @param travel
	 * @return
	 */
	int insertTravel(SqlSession session, Travel travel);

	/**
	 * 여행 첨부파일 등록 Store
	 * @param session
	 * @param travelFile
	 * @return
	 */
	int insertTravelFile(SqlSession session, TravelFile travelFile);

	/**
	 * 여행정보 수정 Store
	 * @param session
	 * @param travel
	 * @return
	 */
	int updateTravel(SqlSession session, Travel travel);

	/**
	 * 조회수 증가 Store
	 * @param session
	 * @param travelNo
	 */
	void updateViewCount(SqlSession session, int travelNo);

	/**
	 * 여행정보 삭제 Store
	 * @param session
	 * @param travelNo
	 * @return
	 */
	int deleteByNo(SqlSession session, Integer travelNo);

	/**
	 * 첨부파일 삭제 Store
	 * @param session
	 * @param travelFile
	 * @return
	 */
	int deleteFileByNo(SqlSession session, TravelFile travelFile);

	/**
	 * 여행정보 상세조회 Store
	 * @param sqlSession
	 * @param travelNo
	 * @return
	 */
	Travel selectTravelByNo(SqlSession session, int travelNo);

	/**
	 * 첨부파일 리스트 Store
	 * @param session 
	 * @param travelNo
	 * @return
	 */
	List<TravelFile> selectTravelFileByNo(SqlSession session, int travelNo);

	/**
	 * 시퀀스 조회 Store
	 * @param session
	 * @return
	 */
	int selectSeq(SqlSession session);


	/**
	 * 여행정보 정렬 Store
	 * @param session
	 * @param sortMap
	 * @return
	 */
	List<Travel> travelSortList(SqlSession session, Map<String, Object> sortMap);

	/**
	 * 전체 레코드 개수 Store
	 * @param sqlSession
	 * @return
	 */
	int getTotalCount(SqlSession sqlSession);

}
