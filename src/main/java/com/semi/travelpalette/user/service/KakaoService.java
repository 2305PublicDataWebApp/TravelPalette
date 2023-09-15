package com.semi.travelpalette.user.service;

import java.util.List;


public interface KakaoService {
	public String getToken(String code) throws Exception;

	public List<Object> getUserInfo(String access_token) throws Exception;	
}
