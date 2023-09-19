package com.semi.travelpalette.community.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.domain.Reply;

public interface ReplyStore {

	/**
	 * 댓글 등록 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession session, Reply reply);

	/**
	 * 게시판 게시물 별 댓글 리스트 불러오기 Store
	 * @param session
	 * @param cOne
	 * @return
	 */
	List<Reply> selectReplyList(SqlSession session, Community cOne);

	/**
	 * 댓글 삭제하기 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int deleteReply(SqlSession session, Reply reply);

	/**
	 * 댓글 수정하기 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int modifyReply(SqlSession session, Reply reply);

}
