package com.semi.travelpalette.travel.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelPageInfo;
import com.semi.travelpalette.travel.service.TravelService;
import com.semi.travelpalette.travel.store.TravelStore;

@Service
public class TravelServiceImpl implements TravelService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private TravelStore tStore;
	
	@Override
	public List<Travel> travelAllListByNew(TravelPageInfo pageInfo) {
		List<Travel> tList = tStore.travelAllListByNew(sqlSession, pageInfo);
		return tList;
	}

	@Override
	public int getTotalCount() {
		int totalCount = tStore.getTotalCount(sqlSession);
		return totalCount;
	}

	@Override
	public Travel selectTravelByNo(int travelNo) {
		Travel travel = tStore.selectTravelByNo(sqlSession, travelNo);
		return travel;
	}

	@Override
	public int insertTravel(Travel travel) {
		int result = tStore.insertTravel(sqlSession, travel);
		return result;
	}
	
	
}
