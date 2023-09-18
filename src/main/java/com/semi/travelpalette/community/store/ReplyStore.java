package com.semi.travelpalette.community.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.community.domain.Reply;

public interface ReplyStore {

	/**
	 * 댓글 등록 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession session, Reply reply);

}
