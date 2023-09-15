package com.semi.travelpalette.travel.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelPageInfo;
import com.semi.travelpalette.travel.store.TravelStore;

@Repository
public class TravelStoreLogic implements TravelStore{

	@Override
	public List<Travel> travelAllListByNew(SqlSession sqlSession, TravelPageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Travel> tList = sqlSession.selectList("TravelMapper.travelAllListByNew", null, rowBounds);
		return tList;
	}

	@Override
	public int getTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("TravelMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public Travel selectTravelByNo(SqlSession sqlSession, int travelNo) {
		Travel travel = sqlSession.selectOne("TravelMapper.selectTravelByNo", travelNo);
		return travel;
	}

	@Override
	public int insertTravel(SqlSession sqlSession, Travel travel) {
		int result = sqlSession.insert("TravelMapper.insertTravel", travel);
		return result;
	}


}
