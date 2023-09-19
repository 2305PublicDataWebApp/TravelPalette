package com.semi.travelpalette.map.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.travel.domain.Travel;

public interface MapStore {

	List<Travel> showTravelMap(SqlSession sqlSession);

}
