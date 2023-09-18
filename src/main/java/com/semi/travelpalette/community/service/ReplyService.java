package com.semi.travelpalette.community.service;

import com.semi.travelpalette.community.domain.Reply;

public interface ReplyService {

	/**
	 * 댓글 등록 Service
	 * @param reply
	 * @return
	 */
	int insertReply(Reply reply);

}
