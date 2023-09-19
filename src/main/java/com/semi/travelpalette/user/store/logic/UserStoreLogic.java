package com.semi.travelpalette.user.store.logic;

import com.semi.travelpalette.user.domain.UserMypageDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.store.UserStore;

import java.util.List;

@Repository
public class UserStoreLogic implements UserStore {

    @Autowired
    private SqlSession session;

    @Override
    public int kakaoUserInsert(User kakaoUser) {
        int user = session.insert("UserMapper.kakaoUserInsert", kakaoUser);
        return user;
    }

    @Override
    public int kakaoUserInfoInsert(User kakaoUser) {
        int user = session.insert("UserMapper.kakaoUserInfoInsert", kakaoUser);
        return user;
    }

    @Override
    public int insertUser(User user) {
        int result = session.insert("UserMapper.insertUser", user);
        return result;
    }

    @Override
    public int insertUserInfo(User user) {
        int result = session.insert("UserMapper.insertUserInfo", user);
        return result;
    }

    @Override
    public User selectOneId(String userId) {
        User idCheck = session.selectOne("UserMapper.selectUSerOneId", userId);
        return idCheck;
    }

    @Override
    public User selectOneNickname(String userNickname) {
        User nickNameCheck = session.selectOne("UserMapper.selectUserOneNickname", userNickname);
        return nickNameCheck;
    }

    @Override
    public User selectOneEmail(String userEmail) {
        User emailCheck = session.selectOne("UserMapper.selectUserOneEmail", userEmail);
        return emailCheck;
    }

    @Override
    public User selectUserLogin(User user) {
        User login = session.selectOne("UserMapper.selectUserLogin", user);
        return login;
    }

    @Override
    public User selectKakaoUser(String userEmail) {
        User kakao = session.selectOne("UserMapper.selectKakaoUser", userEmail);
        return kakao;
    }

    @Override
    public User selectUserInfo(int userNo) {
        User loginInfo = session.selectOne("UserMapper.selectUserInfo", userNo);
        return loginInfo;
    }

    @Override
    public int updateUserNormal(User userInfo) {
        int result = session.update("UserMapper.updateUserNormal", userInfo);
        return result;
    }

    @Override
    public int updateUserInfoNormal(User userInfo) {
        int result = session.update("UserMapper.updateUserInfoNormal", userInfo);
        return result;
    }

    @Override
    public User selectUser(int userNo) {
        User user = session.selectOne("UserMapper.selectUser", userNo);
        return user;
    }

    @Override
    public int deleteUser(int userNo) {
        int result = session.update("UserMapper.deleteUser", userNo);
        return result;
    }

    @Override
    public int deleteUserInfo(int userNo) {
        int result = session.delete("UserMapper.deleteUserInfo", userNo);
        return result;
    }

    @Override
    public List<UserMypageDto> selectUserActivity(final String userId) {
        return session.selectList( "UserMapper.selectUserActivity",userId);
    }
}
