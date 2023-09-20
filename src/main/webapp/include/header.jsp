<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/css/include/header.css">
	</head>
	<body>
		<header style="border-bottom: 1px solid #ccc;">
            <div class="headerContainer">
                <div style="float:left;position: relative;">
                	<a href="/">
	                    <img class="logoImg" src="../resources/images/main/pallete.png" alt="">
	                    <h1 style="width: 250px;">여행팔레트</h1>
	                    <img style="position: absolute;z-index: -1;top: -52px;width: 300px;opacity: 0.8;" src="../resources/images/main/수채화1.png" alt="">
                	</a>
                </div>
               <div style="float:right;display: flex;">
                	<form action="/travel/search.tp" method="POST">
					    <input type="text" name="searchKeyword" style="float:left;" class="searchInput" placeholder="가보고 싶은 여행지 있으신가요?">
					    <button type="submit" class="travelSearchButton">
						<img src="../resources/images/main/searchicon.png" alt="검색 아이콘" style="width:20px;float: left;padding: 14px 0px 0px 0px;"></button>
					</form>
                    <div class="searchForm">
                    	<c:if test="${empty sessionScope.userId}">
	                        <a href="/user/login.tp">
		                        <img src="../resources/images/main/user.png" alt="검색 아이콘" style="width:25px">
		                        <p>로그인</p>
		                    </a>
						</c:if>
						<c:if test="${not empty sessionScope.userId}">
							<a href="/user/logout.tp">
		                        <img src="../resources/images/main/user.png" alt="검색 아이콘" style="width:25px">
		                        <p>로그아웃</p>
		                    </a>
						</c:if>
                    </div>
                </div>
            </div>
        </header>
	</body>
</html>