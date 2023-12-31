package com.semi.travelpalette.event.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;
import com.semi.travelpalette.event.store.EventStore;

@Repository
public class EventStoreLogic implements EventStore {

	@Override
	public List<Event> eventAllListByNew(SqlSession sqlSession, EventPageInfo pageInfo, String eventCondition) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Event> eList = sqlSession.selectList("EventMapper.eventAllListByNew", eventCondition, rowBounds);
		return eList;
	}

	@Override
	public int getTotalCount(SqlSession sqlSession, String eventCondition) {
		int totalCount = sqlSession.selectOne("EventMapper.getTotalCount", eventCondition);
		return totalCount;
	}

	@Override
	public Event selectEventByNo(SqlSession sqlSession, int eventNo) {
		Event event = sqlSession.selectOne("EventMapper.selectEventByNo", eventNo);
		return event;
	}

	@Override
	public int insertEvent(SqlSession sqlSession, Event event) {
		int result = sqlSession.insert("EventMapper.insertEvent", event);
		return result;
	}

	@Override
	public int updateEvent(SqlSession sqlSession, Event event) {
		int result = sqlSession.update("EventMapper.updateEvent", event);
		return result;
	}

	@Override
	public int deleteEvent(SqlSession sqlSession, int eventNo) {
		int result = sqlSession.update("EventMapper.deleteByNo", eventNo);
		return result;
	}
}
