package com.semi.travelpalette.event.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.event.service.EventService;
import com.semi.travelpalette.event.store.EventStore;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private EventStore eStore;
	
	@Override
	public List<Event> eventAllListByNew(EventPageInfo pageInfo, String eventCondition) {
		List<Event> eList = eStore.eventAllListByNew(sqlSession, pageInfo, eventCondition);
		return eList;
	}

	@Override
	public int getTotalCount(String eventCondition) {
		int totalCount = eStore.getTotalCount(sqlSession, eventCondition);
		return totalCount;
	}

	@Override
	public Event selectEventByNo(int eventNo) {
		Event event = eStore.selectEventByNo(sqlSession, eventNo);
		return event;
	}

	@Override
	public int insertEvent(Event event) {
		int result = eStore.insertEvent(sqlSession, event);
		return result;
	}

	@Override
	public int updateEvent(Event event) {
		int result = eStore.updateEvent(sqlSession, event);
		return result;
	}

	@Override
	public int deleteByNo(int eventNo) {
		int result = eStore.deleteEvent(sqlSession, eventNo);
		return result;
	}

}
