package com.semi.travelpalette.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

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

	

	
}
