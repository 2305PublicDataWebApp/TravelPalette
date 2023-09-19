package com.semi.travelpalette.travel.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.travelpalette.travel.domain.Review;
import com.semi.travelpalette.travel.service.ReviewService;
import com.semi.travelpalette.travel.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ReviewStore rStore;
	
	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}

	@Override
	public int getReviewTotalCount(Integer travelNo) {
		int reviewTotalCount = rStore.getReviewTotalCount(session, travelNo);
		return reviewTotalCount;
	}

	@Override
	public List<Review> selectReviewByTNo(Map<String, Object> reviewMap) {
		List<Review> rList = rStore.selectReviewByTNo(session, reviewMap);
		return rList;
	}

	@Override
	public Review selectMyReview(Review review) {
		Review myReview = rStore.selectMyReview(session, review);
		return myReview;
	}

	@Override
	public int deleteReview(Review review) {
		int result = rStore.deleteReview(session, review);
		return result;
	}




	
	

	
	
}
