package com.semi.travelpalette.community.service;

import java.util.List;

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
	 * 게시물 삭제하기 Service
	 * @param reply
	 * @return
	 */
	int deleteReply(Reply reply);

}
