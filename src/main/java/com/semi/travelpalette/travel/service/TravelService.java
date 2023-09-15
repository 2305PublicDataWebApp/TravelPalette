package com.semi.travelpalette.travel.service;

import java.util.List;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;

public interface TravelService {

	/**
	 * 등록최신순 조회 Service
	 * @param tInfo 
	 * @return
	 */
	List<Travel> travelAllListByNew(PageInfo pageInfo);

	/**
	 * 전체 레코드 개수 Service
	 * @return
	 */
	int getTotalCount();

	/**
	 * 여행정보 상세조회 Service
	 * @param travelNo
	 * @return
	 */
	Travel selectTravelByNo(int travelNo);

	/**
	 * 여행정보 등록 Service
	 * @param travel
	 * @return
	 */
	int insertTravel(Travel travel);

}
