package com.semi.travelpalette.event.service;

import java.util.List;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;

public interface EventService {

	int insertEvent(Event event);

	int getTotalCount(String eventCondition);

	List<Event> eventAllListByNew(EventPageInfo pageInfo, String eventCondition);

	Event selectEventByNo(int eventNo);

	int updateEvent(Event event);

	int deleteByNo(int eventNo);

}
