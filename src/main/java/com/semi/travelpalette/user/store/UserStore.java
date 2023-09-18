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
	public int kakaoUserInsert(SqlSession session, User kakaoUser);

	/**
	 * 카카오 회원 가입 상세 정보 저장
	 * @param session
	 * @param kakaoUserInfo
	 * @return
	 */
	public int kakaoUserInfoInsert(SqlSession session, User kakaoUser);

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

	/**
	 * 아이디 검색 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	public User selectOneId(SqlSession session, String userId);

	/**
	 * 닉네임 중복 확인 Store
	 * @param session
	 * @param userNickname
	 * @return
	 */
	public User selectOneNickname(SqlSession session, String userNickname);

	/**
	 * 이메일 중복 확인 Store
	 * @param session
	 * @param userEmail
	 * @return
	 */
	public User selectOneEmail(SqlSession session, String userEmail);

	/**
	 * 로그인 Store
	 * @param session
	 * @param user
	 * @return
	 */
	public User selectUserLogin(SqlSession session, User user);



	/**
	 * email로 카카오 정보가 저장 되어있는지 확인하기
	 * @param session 
	 * @param userEmail
	 * @return
	 */
	public User selectKakaoUser(SqlSession session, String userEmail);
//
//	public int kakaoUserInfoInsert(SqlSession session, User kakaouser);

	/**
	 * 유저 번호로 닉네임 검색
	 * @param session
	 * @param userNo
	 * @return
	 */
	public User selectUserInfo(SqlSession session, int userNo);

	/**
	 * 일반 회원 정보 수정
	 * @param session
	 * @param userInfo
	 * @return
	 */
	public int updateUserNormal(SqlSession session, User userInfo);

	/**
	 * 일반 회원 상세 정보 수정
	 * @param session
	 * @param userInfo
	 * @return
	 */
	public int updateUserInfoNormal(SqlSession session, User userInfo);




//	public int kakaoUserInsert(SqlSession session, User kakaouser);
//
//	public int kakaoUserInfoInser(SqlSession session, User kakaouser);

}
