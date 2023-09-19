package com.semi.travelpalette.community.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.service.CommunityService;
import com.semi.travelpalette.community.store.CommunityStore;

@Transactional
@Service
public class CommunityServiceImpl implements CommunityService{

    @Autowired
    private CommunityStore cStore;
    @Autowired
    private SqlSession session;
    
    @Override
    public List<Community> selectCommunityList(PageInfo pInfo) {
        List<Community> cList = cStore.selectCommunityList(session, pInfo);
        return cList;
    }

    @Override
    public int getListCountByBoardType(String boardType) {
        int count = cStore.getListCountByBoardType(session, boardType);
        return count;
    }

    @Override
    public Community selectOneByClass(Community community) {
        Community cOne = cStore.selectOneByClass(session, community);
        return cOne;
    }

    @Override
    public int insertBoard(Community community) {
        int result = cStore.insertBoard(session, community);
        return result;
    }
    
    @Override
    public int updateBoard(Community community) {
        int result = cStore.updateBoard(session, community);
        return result;
    }

    @Override
    public int deleteBoard(Community community) {
        int result = cStore.deleteBoard(session, community);
        return result;
    }

	@Override
	public int selectMaxNo() {
		int max = cStore.selectMaxNo(session);
		return max;
	}

	@Override
	public int updateViewCount(Community community) {
		int result = cStore.updateViewCount(session, community);
        return result;
	}

	@Override
	public Like selectLikeByClass(Like like) {
		Like clike = cStore.selectLikeByClass(session, like);
		return clike;
	}

	@Override
	public int insertLike(Like like) {
		int result = cStore.insertLike(session, like);
        return result;
	}

	@Override
	public int updateLikeNo(Community cOne) {
		int result = cStore.updateLikeNo(session, cOne);
        return result;
	}

}
