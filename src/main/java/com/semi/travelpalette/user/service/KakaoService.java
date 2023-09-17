package com.semi.travelpalette.user.service;

import java.util.List;
import java.util.Map;


public interface KakaoService {
	public String getToken(String code) throws Exception;

	public Map<String, Object> getUserInfo(String access_token) throws Exception;	
}
