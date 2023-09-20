package com.semi.travelpalette.community.service;

import java.util.List;
import java.util.Map;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.domain.Reply;

public interface ReplyService {

	/**
	 * 댓글 등록 Service
	 * @param reply
	 * @return
	 */
	int insertReply(Reply reply);

	/**
	 * 게시판 게시물 별 댓글 리스트 불러오기 Service
	 * @param cOne
	 * @return
	 */
	List<Reply> selectReplyList(Community cOne);
	
	/**
	 * 게시판 게시물 별 좋아요 한 사람들 리스트 불러오기 Service
	 * @param cOne
	 * @return
	 */
	List<Reply> selectReplyLikeList(Community cOne);

	/**
	 * 댓글 수정하기 Service
	 * @param reply
	 * @return
	 */
	int modifyReply(Reply reply);
	
	/** 
	 * 댓글 삭제하기 Service
	 * @param reply
	 * @return
	 */
	int deleteReply(Reply reply);

	/**
	 * 댓글 당 좋아요 개수 불러오기 Service
	 * @param setReply
	 * @return
	 */
	int countLikeByMap(Reply setReply);

	/**
	 * 댓글 좋아요 누르기 Service
	 * @param like
	 * @return
	 */
	int insertReplyLike(Like like);
	
	/**
	 * 댓글 좋아요 취소 Service
	 * @param like
	 * @return
	 */
	int deleteReplyLike(Like like);

	/**
	 * 로그인 한 아이디가 해당 댓글에 좋아요를 눌렀는 지 체크 Service
	 * @param setReply
	 * @return
	 */
	Like selectLikeByReply(Reply setReply);

	

}
