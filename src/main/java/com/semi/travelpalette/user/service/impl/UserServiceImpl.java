package com.semi.travelpalette.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.UserService;
import com.semi.travelpalette.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public int insertUserInfo(User user) {
		int result = uStore.insertUserInfo(session, user);
		return result;
	}

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
	public User selectUserNickname(int userNo) {
		User loginInfo = uStore.selectUserNickname(session, userNo);
		return loginInfo;
	}

//	@Override
//	public int kakaoUserInsert(User kakaoUser) {
//		int result = uStore.kakaoUserInsert(session, kakaoUser);
//		return result;
//	}

//	@Override
//	public int kakaoUserInfoInsert(User kakaouser) {
//		int result = uStore.kakaoUserInfoInsert(session, kakaouser);
//		return result;
//	}

	

	
}
