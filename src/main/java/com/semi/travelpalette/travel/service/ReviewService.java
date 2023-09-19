package com.semi.travelpalette.travel.service;

import java.util.List;
import java.util.Map;

import com.semi.travelpalette.travel.domain.Review;

public interface ReviewService {

	/**
	 * 리뷰등록 Service
	 * @param review
	 * @return
	 */
	int insertReview(Review review);

	/**
	 * 전체 리뷰수 by travelNo Service  
	 * @param travelNo 
	 * @return
	 */
	int getReviewTotalCount(Integer travelNo);

	/**
	 * 리뷰 전체 목록 조회 by travelNo Service
	 * @param reviewMap
	 * @return
	 */
	List<Review> selectReviewByTNo(Map<String, Object> reviewMap);

	/**
	 * 리뷰 조회 by userNickname Service
	 * @param review
	 * @return
	 */
	Review selectMyReview(Review review);

	/**
	 * 리뷰삭제 Service
	 * @param review
	 * @return
	 */
	int deleteReview(Review review);
	
}
