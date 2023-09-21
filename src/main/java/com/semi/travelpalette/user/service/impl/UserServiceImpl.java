package com.semi.travelpalette.user.service.impl;

import com.semi.travelpalette.user.domain.UserMypageDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.travelpalette.common.domain.Like;
import com.semi.travelpalette.inquiry.domain.PageInfo;
import com.semi.travelpalette.user.domain.User;
import com.semi.travelpalette.user.service.UserService;
import com.semi.travelpalette.user.store.UserStore;

import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserStore userStore;

    @Override
    public int insertUser(User user) {

        int result = userStore.insertUser(user);
        int userInfoResult = userStore.insertUserInfo(user);
        int insertResult = result + userInfoResult;
        if (insertResult > 2 && insertResult < 2) {
            throw new RuntimeException("회원가입이 제대로 처리되지 않습니다.");
        }
        return insertResult;
    }


    @Override
    public int insertUserInfo(User user) {
        int result = userStore.insertUserInfo(user);
        return result;
    }

    @Transactional(readOnly = true)
    @Override
    public User checkUserId(String userId) {
        User idCheck = userStore.selectOneId(userId);
        return idCheck;
    }

    @Override
    public User checkUserNickname(String userNickname) {
        User nicknameCheck = userStore.selectOneNickname(userNickname);
        return nicknameCheck;
    }

    @Override
    public User checkUserEmail(String userEmail) {
        User emailCheck = userStore.selectOneEmail(userEmail);
        return emailCheck;
    }

    @Override
    public User loginUser(User user) {
        User login = userStore.selectUserLogin(user);
        return login;
    }

    @Override
    public User selectUserAllInfo(int userNo) {
        User user = userStore.selectUser(userNo);
        User userInfo = userStore.selectUserInfo(userNo);
        User result = new User(user.getUserNo(), user.getUserId(), user.getUserPw(), user.getPlatformType(), user.getUserCreateDate()
                , user.getUserDeleteDate(), user.getUserStatus(), user.getAdminCheck(), userInfo.getUserName(), userInfo.getUserNickname()
                , userInfo.getUserGender(), userInfo.getUserEmail(), userInfo.getUserTel(), userInfo.getUserEmailStatus(), userInfo.getUserSmsStatus());
        return result;
    }


    @Override
    public void updateUserNormal(User userInfo) {
        int result = userStore.updateUserNormal(userInfo);
        int userInfoResult = userStore.updateUserInfoNormal(userInfo);

        if ((result + userInfoResult) > 2 && (result + userInfoResult) < 2) {
            System.out.println(result + userInfoResult);
            System.out.println("실패??");
            throw new RuntimeException("회원 정보 수정이 제대로 처리되지 않습니다.");
        }
    }


    @Override
    public int deleteUser(int userNo) {
        // USER_TBL 수정
        int userResult = userStore.deleteUser(userNo);
        // USER_INFO_TBL 삭제
        int userInfoResult = userStore.deleteUserInfo(userNo);

        int result = userResult + userInfoResult;
        if (result > 2 && result < 2) {
            throw new RuntimeException("회원 삭제가 제대로 처리되지 않습니다.");
        } else {
            return result;

        }
    }

    @Override
    public List<UserMypageDto> selectUserActivity(final String userId) {
        return this.userStore.selectUserActivity(userId);
    }


	@Override
	public int selectLikeCount(final String userId) {
		return this.userStore.selectLikeCount(userId);
	}
	

	@Override
	public List<Like> selectLikes(PageInfo pInfo) {
		return this.userStore.selectLikes(pInfo);
	}

	@Override
	public User selectFindId(User findId) {
		return this.userStore.selectFindId(findId);
	}

	@Override
	public String displayId(String userId) {
	    String prefix = userId.substring(0, 2);
	    String suffix = userId.substring(userId.length() - 2);

	    // '*'로 대체된 중간 부분
	    StringBuilder maskedMiddle = new StringBuilder();
	    for (int i = 2; i < userId.length() - 2; i++) {
	        maskedMiddle.append("*");
	    }

	    // '*'로 대체된 userId 생성
	    return prefix + maskedMiddle.toString() + suffix;
	}

	@Override
	public User selectFindPw(User findPw) {
		return this.userStore.selectFindPW(findPw);
	}

	
	
	
	
	
	
	
	// 페이지 관련 메소드
	public PageInfo getPageInfo(Integer currentPage, String inquiryWriter, int totalCount) {
		PageInfo pi = null;
		int recordnaviCountPage = 10;	// 한 페이지에 보여줄 게시물(전체 게시물의 값이 필요)
		int naviCountPerPage = 5;	// 한 페이지에 보여줄 페이지의 개수(currentPage의 값이 필요)
		int naviTotalCount;		// 범위의 총 갯수(currentPage의 값이 필요)
		int startNavi;
		int endNavi;
		
		// (int) 강제 형변환, (double) 자동 형변환
		// 네비게이터의 총 갯수 = 총 게시물 / 한 페이지당 보여지는 게시물 + 0.9
		naviTotalCount = (int)((double)totalCount/recordnaviCountPage+0.9);
													// +0.9하면 알아서 반올림
		// currentPage값이 1~5일 때 startNavi가 1로 고정되도록 구해주는 식
		startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage -1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최대값보다 커질 수 있음
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, inquiryWriter, recordnaviCountPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}



	@Override
	public User selectUserNo(String userEmail) {
		return this.userStore.selectUserNo(userEmail);
	}


	@Override
	public int updateNewPw(User updateInfo) {
		return this.userStore.updateNewPw(updateInfo);
	}


	@Override
	public Like selectLike(String likeNo) {
		return this.userStore.selectLike(likeNo);
	}


	@Override
	public User selectKakaoUserNo(String userNickname) {
		return this.userStore.selectKakaoUserNo(userNickname);
	}


	@Override
	public User selectKakaoUserInfo(int userNo) {
		return this.userStore.selectKakaoUserInfo(userNo);
	}


	@Override
	public User selectKakaoEmailCheck(String userId) {
		return this.userStore.selectKakaoEmailCheck(userId);
	}






}
