package com.semi.travelpalette.community.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.store.CommunityStore;

@Repository
public class CommunityStoreLogic implements CommunityStore{

    @Override
    public List<Community> selectCommunityList(SqlSession session, PageInfo pInfo) {
        
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        List<Community> cList = session.selectList("CommunityMapper.selectListByBoardType", pInfo ,rowBounds);
        return cList;
    }

    @Override
    public int getListCountByBoardType(SqlSession session, String boardType) {
        int count = session.selectOne("CommunityMapper.getListCountByBoardType", boardType);
        return count;
    }

    @Override
    public Community selectOneByClass(SqlSession session, Community community) {
        Community cOne = session.selectOne("CommunityMapper.selectOneByClass", community);
        return cOne;
    }

    @Override
    public int insertBoard(SqlSession session, Community community) {
        int result = session.insert("CommunityMapper.insertBoard", community);
        return result;
    }

    @Override
    public int updateBoard(SqlSession session, Community community) {
        int result = session.update("CommunityMapper.updateBoard", community);
        return result;
    }
    
    @Override
    public int deleteBoard(SqlSession session, Community community) {
        int result = session.update("CommunityMapper.deleteBoard", community);
        return result;
    }

	@Override
	public int selectMaxNo(SqlSession session) {
		int maxNo = session.selectOne("CommunityMapper.selectMaxNo");
        return maxNo;
	}

	@Override
	public int updateViewCount(SqlSession session, Community community) {
		int result = session.update("CommunityMapper.updateViewCount", community);
        return result;
	}

	@Override
	public Like selectLikeByClass(SqlSession session, Like like) {
		Like cLike = session.selectOne("LikeMapper.selectLikeByClass", like);
		return cLike;
	}

	@Override
	public int insertLike(SqlSession session, Like like) {
		int result = session.insert("LikeMapper.insertLike", like);
        return result;
	}

	@Override
	public int updateLikeNo(SqlSession session, Community cOne) {
		int result = session.update("CommunityMapper.updateLikeNo", cOne);
        return result;
	}

	@Override
	public int deleteLike(SqlSession session, Like like) {
		int result = session.delete("LikeMapper.deleteLike", like);
        return result;
	}

	@Override
	public int getSearchListCount(SqlSession session, Map<String, String> paraMap) {
		int result = session.selectOne("CommunityMapper.getSearchListCount", paraMap);
		return result;
	}

	@Override
	public List<Community> searchListByKeyword(SqlSession session, Map<String, String> paraMap, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage(); // 가져오는 행의 갯수
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Community> cList = session.selectList("CommunityMapper.searchListByKeyword", paraMap, rowBounds);
		return cList;
	}

	@Override
	public List<Community> selectSortList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        
        List<Community> cList = session.selectList("CommunityMapper.selectSortList", pInfo ,rowBounds);
        return cList;
	}

}
