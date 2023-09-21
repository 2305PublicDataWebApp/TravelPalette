<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>회원 탈퇴</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/delete.css">
		<link rel="stylesheet" href="../resources/css/user/common.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>         
        <main>
	        <div class="container">
	            <p class="d-flex justify-content-center pageTitle">회원 탈퇴</p>
                <div class="w-line"></div>
	            <div id="container">
	                <input type="hidden" name="userId" id="userId" value="${sessionScope.userId }">
	                <div>
	                    <label for="userPw">비밀번호</label>
	                    <input type="password" name="userPw" id="userPw" class="input" onchange="pwCheck();">
	                </div>
	                <div>
	                    <label for="userPwCheck">비밀번호 확인</label>
	                    <input type="password" name="userPwCheck" id="userPwCheck" class="input" onchange="pwCheck();">
	                </div>
	                <span id="pwCheckMsg" class="guideMsg"></span>
	                <button id="infoBtn" onclick="deleteBtn()" class="btn btn-info">회원 탈퇴</button>
	            </div>
	        </div>
        </main> 
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
        	function pwCheck() {
            	const userId = document.querySelector("#userId").value;
                let userPw = document.querySelector("#userPw").value;
                let userPwCheck = document.querySelector("#userPwCheck").value;
                
                if(userPw === '' && userPwCheck === '') {
                    window.alert('비밀번호를 입력해주세요.');
                    return false;
                }
                
                if (userPw === userPwCheck) {
                    document.getElementById('pwCheckMsg').innerHTML = '비밀번호가 일치합니다.';
                    document.getElementById('pwCheckMsg').style.color = 'blue';
                } else {
                    document.getElementById('pwCheckMsg').innerHTML = '비밀번호가 일치하지 않습니다.';
                    document.getElementById('pwCheckMsg').style.color = 'red';
                    return false;
                }
        	}
        
            function deleteBtn() {

                // AJAX 요청 보내기
                $.ajax({
                    type: "POST", // 또는 "GET"에 맞게 변경
                    url: "/user/delete.tp", // 로그인 처리를 하는 URL로 변경
                    data: {
                    	userId: userId,
                        userPw: userPw
                    },
                    success: function (data) {
                        if (data.success) {
                            // 로그인 성공 시 리다이렉트 또는 다음 동작 수행
        					if (confirm("정말 삭제하시겠습니까?")) {
			                // POST 요청을 보내는 부분
				                $.ajax({
				                    method: "POST",
				                    url: "/user/deleteExecute.tp",
				                    data: {
				                    	userId: userId
				                    },
				                    success: function (postData) {
				                        // POST 요청 성공 시 수행할 작업
				                        alert("회원 탈퇴가 완료되었습니다.");
				                        window.location.href = "/index.jsp";
				                    },
				                    error: function () {
				                        console.error("서버 요청에 실패했습니다.");
				                    }
				                });
        					}
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