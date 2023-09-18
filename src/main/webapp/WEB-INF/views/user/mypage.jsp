<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
       <title>마이페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/mypage.css">
    </head>
    <body>
        <div class="container">
            <p>My Page</p>
            <div class="w-line"></div>
            <div class="flex">
                <div id="left">
                    <span class="fs-3">${sessionScope.userNickname }<br>환영합니다</span>
                    <p>${sessionScope.userNickname }</p>
                    <br>
                    <br>
                    <c:if test="${sessionScope.platformType == 'normal'}">
	                    <li><a href="/user/userNormalPw.tp" onclick="userModify();">회원 정보 수정</a></li>
                    </c:if>
                    <c:if test="${sessionScope.platformType == 'kakao'}">
	                    <li><a href="#" onclick="userModify();">회원 정보 수정</a></li>
                    </c:if>
                   	<li><a href="#"> 활동 내역 관리</a></li>
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="#">회원 탈퇴</a></li>
                </div>
                <div class="h-line"></div>
                <div id="right">
                    <p>최근 활동 내역</p>
                    <table class="table table-bordered text-center">
                        <thead class="table-light">
                            <tr>
                                <th>작성일</th>
                                <th>구분</th>
                                <th>내용</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr>
                                <td>2023-08-07</td>
                                <td>좋아용</td>
                                <td>굿</td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="fs-6">최근 활동 내역은 최신순으로 10개까지만 표시됩니다</p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script type="text/javascript">
        	function userModify() {
        		if()
        		
        	}
        
        </script>
    </body>
</html>