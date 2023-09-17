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
	public List<Event> eventAllListByNew(SqlSession sqlSession, EventPageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Event> tList = sqlSession.selectList("EventMapper.eventAllListByNew", null, rowBounds);
		return tList;
	}

	@Override
	public int getTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("EventMapper.getTotalCount");
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
}
