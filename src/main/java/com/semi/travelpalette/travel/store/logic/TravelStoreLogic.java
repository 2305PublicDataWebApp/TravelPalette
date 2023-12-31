package com.semi.travelpalette.travel.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelFile;
import com.semi.travelpalette.travel.store.TravelStore;

@Repository
public class TravelStoreLogic implements TravelStore{

	@Override
	public int insertTravel(SqlSession session, Travel travel) {
		int result = session.insert("TravelMapper.insertTravel", travel);
		return result;
	}


	@Override
	public int insertTravelFile(SqlSession session, TravelFile travelFile) {
		int result = session.insert("TravelFileMapper.insertTravelFile", travelFile);
		return result;
	}


	@Override
	public int updateTravel(SqlSession session, Travel travel) {
		int result = session.update("TravelMapper.updateTravel", travel);
		return result;
	}


	@Override
	public void updateViewCount(SqlSession session, int travelNo) {
		session.update("TravelMapper.updateViewCount", travelNo);
	}


	@Override
	public int deleteByNo(SqlSession session, Integer travelNo) {
		int result = session.update("TravelMapper.deleteByNo", travelNo);
		return result;
	}


	@Override
	public int deleteFileByNo(SqlSession session, TravelFile travelFile) {
		int result = session.delete("TravelFileMapper.deleteFileByNo", travelFile);
		return result;
	}


	@Override
	public Travel selectTravelByNo(SqlSession session, int travelNo) {
		Travel travel = session.selectOne("TravelMapper.selectTravelByNo", travelNo);
		return travel;
	}

	@Override
	public List<TravelFile> selectTravelFileByNo(SqlSession session, int travelNo) {
		List<TravelFile> travelFiles = session.selectList("TravelFileMapper.selectTravelFileByNo", travelNo);
		return travelFiles;
	}


	@Override
	public int selectSeq(SqlSession session) {
		int tNo = session.selectOne("TravelMapper.selectSeq");
		return tNo;
	}

	@Override
	public List<Travel> travelSortList(SqlSession session, Map<String, Object> sortMap) {
		PageInfo pageInfo = (PageInfo)sortMap.get("pageInfo");
		String order = (String)sortMap.get("order");
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Travel> tList = session.selectList("TravelMapper.sortTravelList", order, rowBounds);
		return tList;
	}


	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("TravelMapper.getTotalCount");
		return totalCount;
	}


	@Override
	public int searchListCount(SqlSession session, String searchKeyword) {
		int searchListCount = session.selectOne("TravelMapper.searchListCount", searchKeyword);
		return searchListCount;
	}


	@Override
	public List<Travel> searchListByKeyword(SqlSession session, PageInfo searchPInfo, Map<String, Object> searchMap) {
		int limit = searchPInfo.getRecordCountPerPage();
		int offset = (searchPInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Travel> searchList = session.selectList("TravelMapper.searchListByKeyword", searchMap, rowBounds);
		return searchList;
	}









}
