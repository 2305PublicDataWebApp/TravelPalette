package com.semi.travelpalette.community.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.common.domain.Like;
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

	/**
	 * 댓글 당 좋아요 개수 불러오기 Store
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int countLikeByMap(SqlSession session, Map<String, Object> paramMap);

	/**
	 * 댓글 좋아요 누르기 Store
	 * @param session
	 * @param like
	 * @return
	 */
	int insertReplyLike(SqlSession session, Like like);

	/**
	 * 댓글 좋아요 취소 Store
	 * @param session
	 * @param like
	 * @return
	 */
	int deleteReplyLike(SqlSession session, Like like);

}
