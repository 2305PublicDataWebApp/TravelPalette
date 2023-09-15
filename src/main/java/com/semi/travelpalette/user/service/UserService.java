package com.semi.travelpalette.user.service;

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


	
}
