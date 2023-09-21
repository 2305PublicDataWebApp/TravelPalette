<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/css/include/nav.css">
	</head>
	<body>
		<nav>
            <div class="navContainer">
                <ul class="navMenu">
                    <li><a href="/">메인</a></li>
                    <li><a href="/event/list.tp">이벤트</a></li>
                    <li><a href="/travel/list.tp">여행정보</a></li>
                    <li><a href="/map/view.tp">여행지도</a></li>
                    <li><a href="/community/certify.tp">커뮤니티</a></li>
                    <c:if test="${userId ne 'admin'}">
	                    <li><a href="/user/mypage.tp">회원</a></li>
                    </c:if>
                    <c:if test="${userId eq 'admin'}">
	                    <li><a href="#">관리자</a></li>
                    </c:if>
                </ul>
            </div>
            <div id="navArea" class="animatedNav" style="border-top:2px solid #BA704F;" >
                <div class="menuContent">
                    <ul>
                        <li></li>
                        <li>
                            <a href="/event/list.tp">
                                진행중인 리스트<br>
                            </a>
                            <a href="/event/list.tp">
                                종료된 이벤트<br>
                            </a>
                        </li>
                        <li>
                            <a href="/travel/list.tp">
                                여행정보 게시판<br>
                            </a>
                        </li>
                        <li>
                            <a href="/map/view.tp">
                                지도 바로가기
                            </a>
                        </li>
                        <li>
                            <a href="/community/certify.tp">
                                커뮤니티 홈<br>
                            </a>
                            <a href="/community/certify.tp">
                                여행 인증 게시판<br>
                            </a>
                            <a href="/community/qList.tp">
                                질의문답 게시판<br>
                            </a>
                            <a href="/community/qList.tp?boardType=travelCompanion">
                                동행 구인 게시판
                            </a>
                        </li>
                        <li>
                        	<c:if test="${userId ne 'admin' }">
	                            <a href="/user/mypage.tp">
	                                마이페이지<br>
	                            </a>
	                            <a href="/inquiry/list.tp">
	                                1 : 1 문의사항
	                            </a>
                        	</c:if>
                        	<c:if test="${userId eq 'admin' }">
	                            <a href="#">
	                                 회원 정보<br>
	                            </a>
	                            <a href="#">
	                                회원 문의사항
	                            </a>
                        	</c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script type="text/javascript">
        
        </script>
	</body>
</html>