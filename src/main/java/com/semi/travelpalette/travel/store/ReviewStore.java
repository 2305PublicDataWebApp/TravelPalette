package com.semi.travelpalette.travel.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.travel.domain.Review;

public interface ReviewStore {

	/**
	 * 리뷰등록 Store
	 * @param session
	 * @param review
	 * @return
	 */
	int insertReview(SqlSession session, Review review);

	/**
	 * 리뷰 전체 목록 조회 by travelNo Store
	 * @param session
	 * @param reviewMap
	 * @return
	 */
	List<Review> selectReviewByTNo(SqlSession session, Map<String, Object> reviewMap);

	/**
	 * 전체 리뷰수 by travelNo Store
	 * @param session
	 * @param travelNo
	 * @return
	 */
	int getReviewTotalCount(SqlSession session, Integer travelNo);

	/**
	 * 리뷰 조회 by userNickname Store
	 * @param session
	 * @param review
	 * @return
	 */
	Review selectMyReview(SqlSession session, Review review);

	/**
	 * 리뷰삭제 Store
	 * @param session
	 * @param review
	 * @return
	 */
	int deleteReview(SqlSession session, Review review);


}
