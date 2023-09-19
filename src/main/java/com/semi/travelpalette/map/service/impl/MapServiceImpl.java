package com.semi.travelpalette.map.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.map.service.MapService;
import com.semi.travelpalette.map.store.MapStore;
import com.semi.travelpalette.travel.domain.Travel;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MapStore mStore;

	@Override
	public List<Travel> showTravelMap() {
		List<Travel> tList = mStore.showTravelMap(sqlSession);
		return tList;
	}
}
