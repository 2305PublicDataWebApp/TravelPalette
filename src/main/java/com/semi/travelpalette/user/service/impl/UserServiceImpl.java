package com.semi.travelpalette.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.UserService;
import com.semi.travelpalette.user.store.UserStore;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;
	
	
	@Override
	public void insertUser(User user) {
		
		int result = uStore.insertUser(session, user);
		int userInfoResult =  uStore.insertUserInfo(session, user);
		if(result + userInfoResult < 3 ) {
			throw new RuntimeException("회원가입이 제대로 처리되지 않습니다.");
		}
		
	}

	
	@Override
	public int insertUserInfo(User user) {
		int result = uStore.insertUserInfo(session, user);
		return result;
	}
	
	@Transactional(readOnly = true)
	@Override
	public User checkUserId(String userId) {
		User idCheck = uStore.selectOneId(session, userId);
		return idCheck;
	}

	@Override
	public User checkUserNickname(String userNickname) {
		User nicknameCheck = uStore.selectOneNickname(session, userNickname);
		return nicknameCheck;
	}

	@Override
	public User checkUserEmail(String userEmail) {
		User emailCheck = uStore.selectOneEmail(session, userEmail);
		return emailCheck;
	}

	@Override
	public User loginUser(User user) {
		User login = uStore.selectUserLogin(session, user);
		return login;
	}

	@Override
	public User selectUserInfo(int userNo) {
		User loginInfo = uStore.selectUserInfo(session, userNo);
		return loginInfo;
	}


	@Override
	public void updateUserNormal(User userInfo) {
		int result = uStore.updateUserNormal(session, userInfo);
		int userInfoResult =  uStore.updateUserInfoNormal(session, userInfo);
		if(result + userInfoResult <3 ) {
			throw new RuntimeException("회원 정보 수정이 제대로 처리되지 않습니다.");
		}
	}

	

	
}
