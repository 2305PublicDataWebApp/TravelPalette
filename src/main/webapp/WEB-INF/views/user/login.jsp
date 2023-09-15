<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/login.css">
	</head>
    <body>
        <div class="flex">
            <p>로그인</p>
            <div class="loginBox">
                <div class="inputBox">
                    <!-- <label for="">아이디</label> -->
                    <input type="text" class="input" name="userId" id="userId" placeholder="아이디를 입력해주세요">
                </div>
                <div>
                    <!-- <label for="">비밀번호</label> -->
                    <input type="password" class="input" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="link">
                    <a href="#">가입하기</a>
                    <a href="#">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                </div>
                <div class="btnBox">
                    <button class="btn btn-info loginBtn" onclick="loginBtn()">로그인</button>
                    <div id="or">
                        <div class="w-line"></div><p>또는</p><div class="w-line"></div>
                    </div>
                    <button onclick="kakao();" class="btn btn-warning loginBtn">카카오 로그인/회원가입</a></button>
                </div>
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
            }
            
            function kakao() {
            	const clientId = '285ffb5126eb1037de78602651c709a9';	// 자바스크립트 키
            	const redirectUrl ='http://127.0.0.1:8888/user/kakao-login.tp';	// redirectUtl 
            	location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id='+clientId+'&redirect_uri='+redirectUrl;
            }
        </script>
    </body>
</html>