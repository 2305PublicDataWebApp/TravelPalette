<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/login.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
    <body>
        <div class="flex">
            <p>로그인</p>
            <div class="loginBox">
            	<form name="loginForm" action="/user/login.tp" method="post">
	                <div class="inputDiv">
	                    <!-- <label for="">아이디</label> -->
	                    <input type="text" class="input" name="userId" id="userId" placeholder="아이디를 입력해주세요">
	                </div>
	                <div class="inputDiv">
	                    <!-- <label for="">비밀번호</label> -->
	                    <input type="password" class="input" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요">
	                </div>
	                <div class="link">
	                    <a href="#">가입하기</a>
	                    <a href="#">아이디 찾기</a>
	                    <a href="#">비밀번호 찾기</a>
	                </div>
	                <span id="failMsg" style="display: none; text-align: center;">
	    				로그인에 실패했습니다. 올바른 아이디와 비밀번호를 입력해주세요.
					</span>
	                <div class="btnBox">
	                    <button type="button" class="btn btn-info loginBtn" onclick="loginBtn()">로그인</button>
	                </div>
            	</form>
                    <div id="or">
                        <div class="w-line"></div><p>또는</p><div class="w-line"></div>
                    </div>
                    <button onclick="kakao();" class="btn btn-warning loginBtn">카카오 로그인/회원가입</a></button>
                </div>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script>
            function loginBtn() {
                let userId = document.querySelector("#userId").value;
                let userPw = document.querySelector("#userPw").value;
                if(userId == '' || userPw == ''){
                    alert("아이디와 비밀번호를 모두 입력해야 합니다");
                } 
                // AJAX 요청 보내기
                $.ajax({
                    type: "POST", // 또는 "GET"에 맞게 변경
                    url: "/user/login.tp", // 로그인 처리를 하는 URL로 변경
                    data: {
                        userId: userId,
                        userPw: userPw
                    },
                    success: function (data) {
                        if (data.success) {
                            // 로그인 성공 시 리다이렉트 또는 다음 동작 수행
                            window.location.href = "/index.jsp";
                        } else {
//                         	document.getElementById('failMsg').iusernnerHTML = '아이디와 비밀번호를 확인해주세요';
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