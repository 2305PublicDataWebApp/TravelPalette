package com.semi.travelpalette.map.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.map.store.MapStore;
import com.semi.travelpalette.travel.domain.Travel;

@Repository
public class MapStoreLogic implements MapStore {

	@Override
	public List<Travel> showTravelMap(SqlSession sqlSession) {
		List<Travel> tList = sqlSession.selectList("TravelMapper.showTravelMap");
		return tList;
	}

}
