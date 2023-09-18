package com.semi.travelpalette.map.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.map.service.MapService;
import com.semi.travelpalette.map.store.MapStore;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MapStore mStore;
}
