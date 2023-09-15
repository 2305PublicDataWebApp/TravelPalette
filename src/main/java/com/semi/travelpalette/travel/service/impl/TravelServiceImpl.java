package com.semi.travelpalette.travel.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.service.TravelService;
import com.semi.travelpalette.travel.store.TravelStore;

@Service
public class TravelServiceImpl implements TravelService{

	@Autowired
	private SqlSession session;
	@Autowired
	private TravelStore tStore;
	
	@Override
	public List<Travel> travelAllListByNew(PageInfo pageInfo) {
		List<Travel> tList = tStore.travelAllListByNew(session, pageInfo);
		return tList;
	}

	@Override
	public int getTotalCount() {
		int totalCount = tStore.getTotalCount(session);
		return totalCount;
	}

	@Override
	public Travel selectTravelByNo(int travelNo) {
		Travel travel = tStore.selectTravelByNo(session, travelNo);
		return travel;
	}

	@Override
	public int insertTravel(Travel travel) {
		int result = tStore.insertTravel(session, travel);
		return result;
	}
	
	
}
