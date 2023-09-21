<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>아이디 찾기</title>
        <link rel="stylesheet" href="../resources/css/user/userInfo.css">
        <link rel="stylesheet" href="../resources/css/user/common.css">        
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
        <main>
	        <div class="container">
	                <p class="d-flex justify-content-center pageTitle">아이디 찾기</p>
	            <div>
	                <div id="container">
	                    <div class="w-line"></div>
                        <div class="infoBox">
                            <label for="">이름</label>
                            <input type="text" name="userName" id="userName" class="input" placeholder="이름을 입력해주세요">
                        </div>
                        <div class="infoBox">
                            <label for="">이메일</label>
                            <input type="text" name="userEmail" id="userEmail" class="input" placeholder="이메일을 입력해주세요">
                        </div>
                        <span id="idCheckMsg" class="alertMsg" style="display: none;">입력하신 정보를 확인해주세요</span>
                        <button id="infoBtn" onclick="findId()" class="btn btn-info">아이디 찾기</button>
                    </div>
                </div>
	        </div>
        </main>       
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
    	function findId() {
            const userName = $('#userName').val();
            const userEmail = $('#userEmail').val();
            const idCheckMsg = $('#idCheckMsg');
            
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
	                    const idCheckMsg = $('#idCheckMsg'); // HTML 요소를 선택합니다.
	                    idCheckMsg.show();
	                }
	            });
            } else {
            	alert("모든 정보를 입력하셔야 합니다.");
            }
        }
    	</script>
    	</body>
</html>