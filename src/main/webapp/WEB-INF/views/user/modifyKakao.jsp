<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>회원 정보 수정</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    	<link rel="stylesheet" href="../resources/css/user/modify.css">
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>          
        <div class="container">
            <p>회원 정보 수정</p>
            <div class="pHead">
                <span class="redSpan">*</span><span>은 필수 입력 정보입니다</span>
            </div>
            <div class="w-line"></div>
            <div id="container">
                <div class="flex">
                    <div>
                        <label for="">비밀번호<span class="redSpan">*</span></label>
                        <input type="password" name="" id="" class="input" placeholder="영어, 숫자, 특수문자를 반드시 포함해 8~20글자">
                    </div>
                    <div>
                        <label for="">비밀번호 확인<span class="redSpan">*</span></label>
                        <input type="password" name="" id="" class="input" placeholder="입력 가능한 특수문자(~, !, @, #, $, %, ^)">
                    </div>
                    <div>
                        <label for="">닉네임<span class="redSpan">*</span></label>
                        <input type="text" name="" id="" class="input" placeholder="닉네임을 입력해주세요">
                        <button class="btn btn-light btn-sm">중복 확인</button>
                    </div>
                    <div>
                        <label for="">이메일<span class="redSpan">*</span></label>
                        <input type="text" name="" id="" class="input" placeholder="닉네임을 입력해주세요">
                        <button class="btn btn-light btn-sm">이메일 인증</button>
                    </div>
                    <div>
                        <label for=""></label>
                        <input type="text" name="" id="mailCheck" placeholder="인증번호를 입력해주세요">
                        <button class="btn btn-light btn-sm">인증번호 확인</button>
                    </div>
                    <div>
                        <label for="">전화번호</label>
                        <input type="text" name="" id="" class="input" placeholder="전화번호를 입력해주세요">
                    </div>
                    <div style="display: flex; align-items: center;">
                        <label for="">SMS/메일<br>수신 여부</label>
                        <div id="checkDiv">
                            <input type="checkbox" class="form-check-input" id="SMS"><label class="form-check-label" for="SMS">SMS</label>
                            <input type="checkbox" class="form-check-input" id="mail"><label class="form-check-label" for="mail">메일</label>
                        </div>
                    </div>
                    <div class="registerBox">
                        <button id="registerBtn" class="btn btn-info">회원 정보 수정</button>
                    </div>
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