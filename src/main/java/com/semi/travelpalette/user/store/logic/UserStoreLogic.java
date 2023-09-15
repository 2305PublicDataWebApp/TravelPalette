package com.semi.travelpalette.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int kakaoUserInsert(SqlSession session, User kakaouser) {
		int user = session.insert("UserMapper.kakaoUserInsert", kakaouser);
		return user;
	}

	@Override
	public int kakaoUserInfoInser(SqlSession session, User kakaouser) {
		int user = session.insert("UserMapper.kakaoUserInfoInsert", kakaouser);
		return user;
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

}
