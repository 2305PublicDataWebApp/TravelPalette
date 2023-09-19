package com.semi.travelpalette.user.store;

import com.semi.travelpalette.user.domain.UserMypageDto;
import org.apache.ibatis.session.SqlSession;

import com.semi.travelpalette.user.domain.User;

import java.util.List;

public interface UserStore {

    /**
     * 카카오 회원 가입 정보 저장
     *
     * @param session
     * @param kakaoUser
     * @return
     */
    public int kakaoUserInsert(User kakaoUser);

    /**
     * 카카오 회원 가입 상세 정보 저장
     *
     * @param session
     * @param kakaoUser
     * @return
     */
    int kakaoUserInfoInsert(User kakaoUser);

    /**
     * 일반 회원 가입 정보 저장 Store
     *
     * @param session
     * @param user
     * @return
     */
    int insertUser(User user);

    /**
     * 일반 회원 가입 상세 정보 저장 Store
     *
     * @param session
     * @param user
     * @return
     */
    int insertUserInfo(User user);

    /**
     * 아이디 검색 Store
     *
     * @param session
     * @param userId
     * @return
     */
    User selectOneId(String userId);

    /**
     * 닉네임 중복 확인 Store
     *
     * @param session
     * @param userNickname
     * @return
     */
    User selectOneNickname(String userNickname);

    /**
     * 이메일 중복 확인 Store
     *
     * @param session
     * @param userEmail
     * @return
     */
    User selectOneEmail(String userEmail);

    /**
     * 로그인 Store
     *
     * @param session
     * @param user
     * @return
     */
    User selectUserLogin(User user);


    /**
     * email로 카카오 정보가 저장 되어있는지 확인하기
     *
     * @param session
     * @param userEmail
     * @return
     */
    User selectKakaoUser(String userEmail);
//
//	 int kakaoUserInfoInsert(  User kakaouser);

    /**
     * 유저 번호로 닉네임 검색
     *
     * @param session
     * @param userNo
     * @return
     */
    User selectUserInfo(int userNo);

    /**
     * 일반 회원 정보 수정
     *
     * @param session
     * @param userInfo
     * @return
     */
    int updateUserNormal(User userInfo);

    /**
     * 일반 회원 상세 정보 수정
     *
     * @param session
     * @param userInfo
     * @return
     */
    int updateUserInfoNormal(User userInfo);

    /**
     * 유저 번호로 유저 정보 조회(모든 정보를 가져오는 메소드 내에 있음)
     *
     * @param session
     * @param userNo
     * @return
     */
    User selectUser(int userNo);

    /**
     * 유저 번호로 유저 테이블 수정
     *
     * @param session
     * @param userNo
     * @return
     */
    int deleteUser(int userNo);

    /**
     * 유저 번호로 유저 상세 정보 삭제
     *
     * @param session
     * @param userNo
     * @return
     */
    int deleteUserInfo(int userNo);

    List<UserMypageDto> selectUserActivity(String userId);


//	public int kakaoUserInsert(  User kakaouser);
//
//	public int kakaoUserInfoInser(  User kakaouser);

}
