package com.semi.travelpalette.event.service;

import java.util.List;

import com.semi.travelpalette.event.domain.Event;
import com.semi.travelpalette.event.domain.EventPageInfo;

public interface EventService {

	int insertEvent(Event event);

	int getTotalCount();

	List<Event> eventAllListByNew(EventPageInfo pageInfo);

	Event selectEventByNo(int eventNo);

}
