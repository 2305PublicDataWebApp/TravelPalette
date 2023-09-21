<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원 정보 찾기 결과</title>
        <link rel="stylesheet" href="../resources/css/user/userInfoResult.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </head>
    <style>

    </style>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>          
        <div class="container">
            <div>
                <div id="container">
                    <!-- <div class="infoBox">? -->
                    <c:if test="${userId ne null }">
                        <p class="resultTitle msg">아이디 찾기 결과</p>
	                    <div class="w-line"></div>
                        <div class="infoBox">
                            <p clss="successMsg msg">아이디 찾기에 성공했습니다.</p><br/>
                            <p class="infoMsg msg">아이디 : <span class="infoData">${userId }</span></p>
                        </div>
                        <a href="/user/login.tp"><button class="btn btn-info">로그인 페이지로 이동</button></a>
                    </c:if>
                    <c:if test="${mailSend ne null }">
                        <p>비밀번호 찾기</p>
                        <div class="infoBox">
                            <label for="">아이디</label>
                            <input type="text" name="" id="" class="input" placeholder="아이디를 입력해주세요">
                        </div>
                        <div class="infoBox">
                            <label for="">이메일</label>
                            <input type="password" name="" id="" class="input" placeholder="이메일을 입력해주세요">
                        </div>
                        <button class="btn btn-info">비밀번호 찾기</button>
                    </c:if>
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