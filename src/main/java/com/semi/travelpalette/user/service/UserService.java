package com.semi.travelpalette.user.service;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.domain.UserMypageDto;

import java.util.List;

public interface UserService {

	/**
	 * 일반 회원가입 정보 저장 Service
	 * @param user
	 * @return
	 */
	void insertUser(User user);

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
	 * 유저 번호로 유저에 대한 모든 정보 select
	 * @param userNo
	 * @return
	 */
	User selectUserAllInfo(int userNo);

	/**
	 * 일반 회원 정보 수정
	 * @param userInfo
	 */
	void updateUserNormal(User userInfo);

	/**
	 * 유저 탈퇴
	 * (USER_TBL : USER_STATUE -> 'N', DELETE_DATE -> DEFAULT)
	 * (USER_INFO_TBL : DELETE USER_INFO_TBL WHERE USER_ID=#{userId }
	 * @param userNo
	 * @return
	 */
	int deleteUser(int userNo);

	List<UserMypageDto> selectUserActivity(String userId);


//	int kakaoUserInsert(User kakaouser);
//
//	int kakaoUserInfoInser(User kakaouser);


	
}
