package com.semi.travelpalette.user.service;

import javax.servlet.http.HttpSession;

import com.semi.travelpalette.user.domain.User;

public interface UserService {

	/**
	 * 일반 회원가입 정보 저장 Service
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	/**
	 * 일반 회원가입 상세 정보 저장 Service
	 * @param user
	 * @return
	 */
	int insertUserInfo(User user);

	/**
	 * 아이디 검색 Service
	 * @param userId
	 * @return
	 */
	User checkUserId(String userId);

	/**
	 * 닉네임 중복 확인을 위한 Service
	 * @param userNickname
	 * @return
	 */
	User checkUserNickname(String userNickname);

	/**
	 * 이메일 중복 확인 Service
	 * @param userEmail
	 * @return
	 */
	User checkUserEmail(String userEmail);

	/**
	 * 로그인 service
	 * @param user
	 * @return
	 */
	User loginUser(User user);

	/**
	 * 유저 번호로 닉네임 검색
	 * @param userNo
	 * @return
	 */
	User selectUserNickname(int userNo);

//	int kakaoUserInsert(User kakaouser);
//
//	int kakaoUserInfoInser(User kakaouser);


	
}
