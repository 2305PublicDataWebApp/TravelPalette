package com.semi.travelpalette.user.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.user.domain.User;

public interface UserStore {

	/**
	 * 카카오 회원 가입 정보 저장
	 * @param session
	 * @param kakaouser
	 * @return
	 */
	public int kakaoUserInsert(SqlSession session, User kakaouser);

	/**
	 * 카카오 회원 가입 상세 정보 저장
	 * @param session
	 * @param kakaouser
	 * @return
	 */
	public int kakaoUserInfoInser(SqlSession session, User kakaouser);

	/**
	 * 일반 회원 가입 정보 저장 Store
	 * @param session
	 * @param user
	 * @return
	 */
	public int insertUser(SqlSession session, User user);

	/**
	 * 일반 회원 가입 상세 정보 저장 Store
	 * @param session
	 * @param user
	 * @return
	 */
	public int insertUserInfo(SqlSession session, User user);

}
