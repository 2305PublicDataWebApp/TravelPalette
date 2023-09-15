package com.semi.travelpalette.travel.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.store.TravelStore;

@Repository
public class TravelStoreLogic implements TravelStore{

	@Override
	public List<Travel> travelAllListByNew(SqlSession session, PageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Travel> tList = session.selectList("TravelMapper.travelAllListByNew", null, rowBounds);
		return tList;
	}

	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("TravelMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public Travel selectTravelByNo(SqlSession session, int travelNo) {
		Travel travel = session.selectOne("TravelMapper.selectTravelByNo", travelNo);
		return travel;
	}

	@Override
	public int insertTravel(SqlSession session, Travel travel) {
		int result = session.insert("TravelMapper.insertTravel", travel);
		return result;
	}


}
