package com.semi.travelpalette.community.store.logic;

import java.util.List;

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
        int result = session.delete("CommunityMapper.updateBoard", community);
        return result;
    }
    
    @Override
    public int deleteBoard(SqlSession session, Community community) {
        int result = session.delete("CommunityMapper.deleteBoard", community);
        return result;
    }

	@Override
	public int selectMaxNo(SqlSession session) {
		int maxNo = session.selectOne("CommunityMapper.selectMaxNo");
        return maxNo;
	}

	@Override
	public int updateViewCount(SqlSession session, Community community) {
		int result = session.delete("CommunityMapper.updateViewCount", community);
        return result;
	}

	@Override
	public Like selectLikeByClass(SqlSession session, Like like) {
		Like cLike = session.selectOne("LikeMapper.selectLikeByClass", like);
		return cLike;
	}

}
