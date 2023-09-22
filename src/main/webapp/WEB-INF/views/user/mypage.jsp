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
		<link rel="stylesheet" href="../resources/css/user/common.css">
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>          
        <div class="container">
            <p class="pageTitle">My Page</p>
            <div class="w-line"></div>
            <div class="flex">
                <div id="left">
                    <c:if test="${sessionScope.platformType == 'normal'}">
	                    <li><a href="/user/userNormalPw.tp" onclick="userModify();">회원 정보 수정</a></li>
                    </c:if>
                    <c:if test="${sessionScope.platformType == 'kakao'}">
	                    <li><a href="/user/userKakaoEmail.tp" onclick="userModify();">회원 정보 수정</a></li>
                    </c:if>
<!--                    	<li><a href="/user/activityLike.tp"> 활동 내역 관리</a></li> -->
                    <li><a href="/inquiry/list.tp">1:1 문의</a></li>
                    <li><a href="/user/delete.tp">회원 탈퇴</a></li>
                </div>
                <div class="h-line"></div>
                <div id="right">
                	<div id="welcome">
	                    <span id="leftNameInfo">${userNickname }님 환영합니다</span>
                	</div>
                    <p id="recentMsg">${userNickname }님의 최근 활동 내역</p>
                    <table id="table" class="table table-bordered text-center">
                        <thead class="table-light">
                            <tr>
                                <td class="th" width="25%">작성일</td>
                                <td class="th" width="25%">구분</td>
                                <td class="th" width="50%">내용</td>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach items="${userMypageActivity}" var="mypageActivity" varStatus="i" >
                            <tr>
                                <td width="10%">${mypageActivity.createdate}</td>
                                <td>${mypageActivity.type}</td>
                                <td>${mypageActivity.content}</td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                    <p id="recentMsg2">최근 활동 내역은 최신순으로 10개까지만 표시됩니다</p>
                </div>
            </div>
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
        
        </script>
    </body>
</html>