<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${title }</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/login.css">
		<link rel="stylesheet" href="../resources/css/user/common.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>          
        <div class="flex">
	        <c:if test="${sessionScope.platformType == 'normal'}">
	            <p class="pageTitle" style="margin-top: 100px;">${titleMsg }</p>
	            <div class="confirmBox">
	                <div class="inputDiv">
	                    <!-- <label for="">아이디</label> -->
	                    <input type="password" class="input" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요">
	                </div>
	                <span id="failMsg" class="msg" style="display: none; text-align: center;">
	    				비밀번호가 다릅니다.
					</span>
	                <div class="btnBox">
	                    <button type="button" class="btn btn-info loginBtn infoBtn" onclick="normalBtn()">${btnMsg }</button>
	                </div>
	            </div>
	        </c:if>
	        <c:if test="${sessionScope.platformType == 'kakao'}">
	            <p class="pageTitle">${titleMsg }</p>
	            <div class="confirmBox">
	                <div class="inputDiv">
	                    <!-- <label for="">아이디</label> -->
	                    <input type="text" class="input " name="userId" id="userId" placeholder="카카오 계정을 입력해주세요">
	                </div>
	                <span id="failMsg " class="msg" style="display: none; text-align: center;">
	    				카카오 계정을 확인해주세요.
					</span>
	                <div class="btnBox">
	                    <button type="button" class="btn btn-info loginBtn infoBtn" onclick="kakaoBtn()">${btnMsg }</button>
	                </div>
	            </div>	        
	        </c:if>
	    </div>
	    <div style="width: 100%;height: 50px;"></div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
            function normalBtn() {
                let userPw = document.querySelector("#userPw").value;
                if(userPw == ''){
                    alert("비밀번호를 입력해야 합니다");
                } 
                
                console.log("ddds");
                // AJAX 요청 보내기
                $.ajax({
                    url: "/user/userNormalPw.tp", 
                    method: "POST",
                    // 로그인 처리를 하는 URL로 변경
                    data: {
                        userPw: userPw
                    },
                    dataType : 'json',
                    success: function (response) {
                        if (response.success) {
                             location.href =  response.redirectUrl;
                        } else {
//                          	document.getElementById('failMsg').iusernnerHTML = '아이디와 비밀번호를 확인해주세요';
	                        document.getElementById('failMsg').style.color = 'red';
	                        document.getElementById('failMsg').style.display = 'block';
                        }
                    },
                    error: function () {
                        console.error("서버 요청에 실패했습니다.");
                    }
                });
                
            }
            
            function kakaoBtn() {
                let userId = document.querySelector("#userId").value;
                if(userId == ''){
                    alert("카카오 계정을 입력해야 합니다");
                } 
                console.log("ddds");
                // AJAX 요청 보내기
                $.ajax({
                    url: "/user/userKakaoEmail.tp", 
                    method: "POST",
                    // 로그인 처리를 하는 URL로 변경
                    data: {
                    	userId: userId
                    },
                    dataType : 'json',
                    success: function (response) {
                        if (response.success) {
                             location.href =  response.redirectUrl;
                        } else {
//                          	document.getElementById('failMsg').iusernnerHTML = '아이디와 비밀번호를 확인해주세요';
	                        document.getElementById('failMsg').style.color = 'red';
	                        document.getElementById('failMsg').style.display = 'block';
                        }
                    },
                    error: function () {
                        console.error("서버 요청에 실패했습니다.");
                    }
                });
                
            }

            
            function kakao() {
            	const clientId = '285ffb5126eb1037de78602651c709a9';	// 자바스크립트 키
            	const redirectUrl ='http://127.0.0.1:8888/user/kakao-login.tp';	// redirectUtl 
            	location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id='+clientId+'&redirect_uri='+redirectUrl;
            }
        </script>
    </body>
</html>