<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 찾기</title>
        <link rel="stylesheet" href="../resources/css/user/userInfo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <p class="d-flex justify-content-center">아이디 찾기</p>
                <div id="container">
                    <div class="w-line"></div>
                        <div class="infoBox">
                            <label for="">이름</label>
                            <input type="text" name="userName" id="userName" class="input" placeholder="아이디를 입력해주세요">
                        </div>
                        <div class="infoBox">
                            <label for="">이메일</label>
                            <input type="text" name="userEmail" id="userEmail" class="input" placeholder="이메일을 입력해주세요">
                        </div>
                        <button onclick="findId()" class="btn btn-info">아이디 찾기</button>
                    </div>
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
    	function findId() {
            const userName = $('#userName').val();
            const userEmail = $('#userEmail').val();
            
            if(userName != '' || userEmail != '') {
            	
	            // AJAX 요청 보내기
	            $.ajax({
	                url: '/user/findId.tp', // 서버 요청 URL
	                method: 'POST',
	                data: { userName: userName,
	                		userEmail : userEmail}, // 요청 파라미터
	                dataType: 'json', // 응답 데이터 형식
	                success: function (response) {
	                	const userId = response.userId;
	                	const url = response.url + "?userId=" + userId;
						location.href = url;
	                },
	                error: function () {
	                    alert('입력하신 정보를 확인해주세요.');
	                }
	            });
            } else {
            	alert("모든 정보를 입력하셔야 합니다.");
            }
        }
    	</script>
    	</body>
</html>