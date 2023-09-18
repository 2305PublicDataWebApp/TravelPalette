package com.semi.travelpalette.travel.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Review;
import com.semi.travelpalette.travel.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}


	@Override
	public int getReviewTotalCount(SqlSession session, Integer travelNo) {
		int reviewTotalCount = session.selectOne("ReviewMapper.getReviewTotalCount", travelNo);
		return reviewTotalCount;
	}


	@Override
	public List<Review> selectReviewByTNo(SqlSession session, Map<String, Object> reviewMap) {
		PageInfo pageInfo = (PageInfo)reviewMap.get("pageInfo");
		int travelNo = (int)reviewMap.get("travelNo");
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReviewByTNo", travelNo, rowBounds);
		return rList;
	}


	@Override
	public Review selectMyReview(SqlSession session, Review review) {
		Review myReview = session.selectOne("ReviewMapper.selectMyReview", review);
		return myReview;
	}


	@Override
	public int deleteReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.deleteReview", review);
		return result;
	}


	
}
