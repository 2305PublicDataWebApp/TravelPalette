package com.semi.travelpalette.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.KakaoService;
import com.semi.travelpalette.user.store.UserStore;

@Transactional
@Service
public class KakaoServiceImpl implements KakaoService{
	
	@Autowired
	private SqlSession session;	
	@Autowired
	private UserStore uStore;

	@Override
	public String getToken(String code) throws Exception {
		String access_Token = "";
		
		//EndPoint URL = API가 서버에서 자원에 접근할 수 있도록 하는 URL
		final String requestUrl = "https://kauth.kakao.com/oauth/token";
		
		//토큰을 요청할 URL 객체 생성
		URL url = new URL(requestUrl);

		//HTTP 연결 설정
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setDoOutput(true);

		//서버로 요청 보내기
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=285ffb5126eb1037de78602651c709a9");
		sb.append("&redirect_uri=http://127.0.0.1:8888/user/kakao-login.tp");
		sb.append("&code=" + code);
		bw.write(sb.toString());
		bw.flush();

		//서버의 응답 데이터 가져옴
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		//result에 토큰이 포함된 응답데이터를 한줄씩 저장
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		//JSON 데이터를 파싱하기 위한 JsonParser 
		JsonParser parser = new JsonParser();
		//값 추출을 위해 파싱한 데이터를 JsonElement로 변환
		JsonElement element = parser.parse(result);

		//element에서 access_token 값을 얻어옴
		access_Token = element.getAsJsonObject().get("access_token").getAsString();

		br.close();
		bw.close();

		return access_Token;
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) throws Exception{
		Map<String, Object> userInfo = new HashMap<>();
		
		final String requestUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(requestUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", "Bearer " + access_token);
		
		BufferedReader bf = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		while ((line = bf.readLine()) != null) {
            result +=line;
        }
		
		JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	
        //콘솔창 확인 후 필요한 정보 추출
        System.out.println("----------properties"+properties);
        System.out.println("----------kakao_account"+kakao_account);
        
//        String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
        String userNickname = properties.getAsJsonObject().get("nickname").getAsString();
        String userEmail = kakao_account.getAsJsonObject().get("email").getAsString();
        
        String userGender = "private";
        
        if (kakao_account != null && kakao_account.getAsJsonObject().has("gender")) {
            userGender = kakao_account.getAsJsonObject().get("gender").getAsString();
        }
        
//        String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
        
        System.out.println();
        
        userInfo.put("userNickname", userNickname);
        userInfo.put("userEmail", userEmail);
        userInfo.put("userGender", userGender);
        
        
        User user = uStore.selectKakaoUser( userEmail);
        if(user == null) {
//        //DB 저장
        	User kakaoUser = new User(userEmail, userNickname, userNickname, userGender, userEmail);
//        	User2 kakaouser = new User2(userEmail);
//        	UserInfo kakaoUserInfo = new UserInfo(userNickname, userNickname, userGender, userEmail);
        	this.kakaoInsert(kakaoUser);
        }
        
        
        return userInfo;
	}
	
	
	private void kakaoInsert(User kakaoUser) {
		uStore.kakaoUserInsert( kakaoUser);
		uStore.kakaoUserInfoInsert( kakaoUser);
	}
	
	
//	   // 카카오 계정 탈퇴 메소드
//    public static boolean deleteKakaoAccount(String kakaoAccessToken) {
//        // 카카오 API 엔드포인트 URL
//        String apiUrl = "https://kapi.kakao.com/v1/user/unlink";
//
//        // HTTP 요청 헤더 설정
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("Authorization", "Bearer " + kakaoAccessToken);
//
//        // HTTP 요청 엔티티 설정
//        HttpEntity<String> requestEntity = new HttpEntity<>(headers);
//
//        // RestTemplate을 사용하여 DELETE 요청 보내기
//        RestTemplate restTemplate = new RestTemplate();
//        ResponseEntity<String> responseEntity = restTemplate.exchange(
//                apiUrl, HttpMethod.DELETE, requestEntity, String.class);
//
//        // 응답 처리
//        if (responseEntity.getStatusCode() == HttpStatus.NO_CONTENT) {
//            System.out.println("카카오 계정 탈퇴 성공");
//            return true;
//        } else {
//            System.out.println("카카오 계정 탈퇴 실패");
//            System.out.println("응답 코드: " + responseEntity.getStatusCodeValue());
//            System.out.println("응답 본문: " + responseEntity.getBody());
//            return false;
//        }
//    }
//
//    public static void main(String[] args) {
//        String kakaoAccessToken = "YOUR_KAKAO_ACCESS_TOKEN";
//        boolean result = deleteKakaoAccount(kakaoAccessToken);
//
//        // 탈퇴 결과에 따른 처리
//        if (result) {
//            // 성공적으로 탈퇴했을 때의 처리
//        } else {
//            // 탈퇴에 실패했을 때의 처리
//        }
//    }
//	
	
	
	
	
//	@Override
//	public List<Object> getUserInfo(String access_token) throws Exception{
//		List<Object> list = new ArrayList<Object>();
//		
//		final String requestUrl = "https://kapi.kakao.com/v2/user/me";
//		
//		URL url = new URL(requestUrl);
//		HttpURLConnection con = (HttpURLConnection) url.openConnection();
//		con.setRequestMethod("GET");
//		con.setRequestProperty("Authorization", "Bearer " + access_token);
//		
//		BufferedReader bf = new BufferedReader(new InputStreamReader(con.getInputStream()));
//		String line = "";
//		String result = "";
//		
//		while ((line = bf.readLine()) != null) {
//			result +=line;
//		}
//		
//		JsonParser parser = new JsonParser();
//		JsonElement element = parser.parse(result);
//		
//		JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//		
//		//콘솔창 확인 후 필요한 정보 추출
//		System.out.println("----------properties"+properties);
//		System.out.println("----------kakao_account"+kakao_account);
//		
////        String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
//		String userNinkname = properties.getAsJsonObject().get("nickname").getAsString();
//		String userEmail = kakao_account.getAsJsonObject().get("email").getAsString();
//		String userGender = kakao_account.getAsJsonObject().get("gender").getAsString();
////        String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
//		
////        list.add(thumbnail_image);
//		list.add(userNinkname);
//		list.add(userEmail);
//		list.add(userGender);
////        list.add(birthday);
//		
//		
//		User user = uStore.selectKakaoUser(session, userEmail);
//		if(user == null) {
////        //DB 저장
//			User kakaouser = new User(userEmail, userNinkname, userNinkname, userGender, userEmail);
//			uStore.kakaoUserInsert(session, kakaouser);
//			uStore.kakaoUserInfoInser(session, kakaouser);
//		}
//		
//		
//		return list;
//	}
	
	
}
