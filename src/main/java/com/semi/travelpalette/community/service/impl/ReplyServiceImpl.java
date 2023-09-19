package com.semi.travelpalette.community.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.domain.Reply;
import com.semi.travelpalette.community.service.ReplyService;
import com.semi.travelpalette.community.store.ReplyStore;

@Transactional
@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReply(Reply reply) {
		int result = rStore.insertReply(session, reply);
		return result;
	}

	@Override
	public List<Reply> selectReplyList(Community cOne) {
		List<Reply> rList = rStore.selectReplyList(session, cOne);
		return rList;
	}

	@Override
	public int deleteReply(Reply reply) {
		int result = rStore.deleteReply(session, reply);
		return result;
	}

	@Override
	public int modifyReply(Reply reply) {
		int result = rStore.modifyReply(session, reply);
		return result;
	}

	@Override
	public int countLikeByMap(Map<String, Object> paramMap) {
		int result = rStore.countLikeByMap(session, paramMap);
		return result;
	}

	@Override
	public int insertReplyLike(Like like) {
		int result = rStore.insertReplyLike(session, like);
		return result;
	}

	@Override
	public int deleteReplyLike(Like like) {
		int result = rStore.deleteReplyLike(session, like);
		return result;
	}

}
