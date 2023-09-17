package com.semi.travelpalette.user.store.logic;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int kakaoUserInsert(SqlSession session, User kakaoUser) {
		int user = session.insert("UserMapper.kakaoUserInsert", kakaoUser);
		return user;
	}

	@Override
	public int kakaoUserInfoInsert(SqlSession session, User kakaoUser) {
		int user = session.insert("UserMapper.kakaoUserInfoInsert", kakaoUser);
		return 0;
	}	

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int insertUserInfo(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUserInfo", user);
		return result;
	}

	@Override
	public User selectOneId(SqlSession session, String userId) {
		User idCheck = session.selectOne("UserMapper.selectUSerOneId", userId);
		return idCheck;
	}

	@Override
	public User selectOneNickname(SqlSession session, String userNickname) {
		User nickNameCheck = session.selectOne("UserMapper.selectUserOneNickname", userNickname);
		return nickNameCheck;
	}

	@Override
	public User selectOneEmail(SqlSession session, String userEmail) {
		User emailCheck = session.selectOne("UserMapper.selectUserOneEmail", userEmail);
		return emailCheck;
	}

	@Override
	public User selectUserLogin(SqlSession session, User user) {
		User login = session.selectOne("UserMapper.selectUserLogin", user);
		return login;
	}

	@Override
	public User selectKakaoUser(SqlSession session, String userEmail) {
		User kakao = session.selectOne("UserMapper.selectKakaoUser", userEmail);
		return kakao;
	}

	@Override
	public User selectUserNickname(SqlSession session, int userNo) {
		User loginInfo = session.selectOne("UserMapper.selectUserNickname", userNo);
		return loginInfo;
	}




}
