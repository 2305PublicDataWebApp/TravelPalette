package com.semi.travelpalette.event.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;

public interface EventStore {

	List<Event> eventAllListByNew(SqlSession sqlSession, EventPageInfo pageInfo, String eventCondition);

	int getTotalCount(SqlSession sqlSession, String eventCondition);

	Event selectEventByNo(SqlSession sqlSession, int eventNo);

	int insertEvent(SqlSession sqlSession, Event event);

	int updateEvent(SqlSession sqlSession, Event event);

	int deleteEvent(SqlSession sqlSession, int eventNo);

}
