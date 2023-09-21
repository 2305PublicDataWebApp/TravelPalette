<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>회원 정보 수정</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    	<link rel="stylesheet" href="../resources/css/user/register.css">
    	<link rel="stylesheet" href="../resources/css/user/common.css">
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>   
        <main>
	        <div class="rContainer">
	            <p class="pageTitle">회원 정보 수정</p>
	            <div class="pHead">
	                <span class="redSpan">*</span><span>은 필수 입력 정보입니다</span>
	            </div>
	            <div class="w-line"></div>
	            <div id="rContainer">
	                <div class="flex">
	                	<form id="form" name="userModifyForm" action="/user/modifyKakao.tp" method="post">
	                		<input type="hidden" name="userNo" value="${userInfo.userNo }">
		                    <div>
		                        <label for="userNickname">닉네임<span class="redSpan">*</span></label>
		                        <input type="text" name="userNickname" id="userNickname" class="input" placeholder="닉네임을 입력해주세요">
		                        <button type="button" id="nicknameBtn" onclick="nicknameCheck();" class="btn btn-light btn-sm checkBtn" >중복 확인</button>
		                    </div>
		                    <span id="nicknameCheckMsg" class="guideMsg" style="text-align: center"></span>
		                    <div>
		                        <label for="userNickname">전화번호</label>
		                        <input type="text" name="userTel" id="userTel" class="input" placeholder="전화번호를 입력해주세요">
		                    </div>
		                    <div id="genderBox" class="inputDiv">
		                        <label for="">성별</label>
		                        <div id="genderRadioK">
		                            <input type="radio" class="form-check-input" name="userGender" id="gnederM" value="male"><label class="form-check-label" for="genderM">남자</label>
		                            <input type="radio" class="form-check-input" name="userGender" id="gnederF" value="female"><label class="form-check-label" for="genderM">여자</label>
		                            <input type="radio" class="form-check-input" name="userGender" id="gnederP" value="private"><label class="form-check-label" for="genderM">비공개</label>
		                        </div>
		                    </div>	                    
			                    <div style="display: flex; align-items: center;">
			                        <label for="">SMS/메일<br>수신 여부</label>
			                        <div id="checkDiv">
			                                <input type="checkbox" name="userEmailStatus" class="form-check-input" id="SMS" <c:if test="${userInfo.userEmailStatus.toString() eq 'Y'}" >checked</c:if>><label class="form-check-label" for="SMS">SMS</label>
				                            <input type="checkbox" name="userSmsStatus" class="form-check-input" id="mail" value="Y" 
				                            <c:if test="${userInfo.userSmsStatus.toString() eq 'Y'}" >checked</c:if>
				                            ><label class="form-check-label" for="mail">메일</label>
			                        </div>
			                    </div>
		                    <div class="registerBox">
		                        <button id="userModifyBtn" type="button" onclick="modifyCheck();" class="btn btn-info">회원 정보 수정</button>
		                    </div>
	                	</form>
	                </div>
	            </div>
	        </div>
        </main>       
                <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
	     // 닉네임 중복 검사
	    const userNicknameInput = document.getElementById('userNickname');
		const nicknameBtn = document.getElementById('nicknameBtn');
	     
		userNicknameInput.addEventListener('input', function () {
		    const userNickname = userNicknameInput.value;
		    const userDbNickname = `${userInfo.userNickname}`;

		    // 유효성 검사 및 비교
		    if (userNickname !== userDbNickname) {
		        // 버튼 활성화
		        nicknameBtn.disabled = false;
		    } else {
		        // 버튼 비활성화
		        nicknameBtn.disabled = true;
		    }
		});
		
        function nicknameCheck() {
            const userNickname = $('#userNickname').val(); // jQuery를 사용하여 입력값 가져오기
            const userDbNickname = `${userInfo.userNickname}`;

            if(userNickname != '') {
            	if(/^[가-힣a-zA-Z0-9]{2,20}$/.test(userNickname)) {
		            // AJAX 요청 보내기
		            $.ajax({
		                url: '/user/nickNnameCheck.tp', // 서버 요청 URL
		                method: 'GET',
		                data: { userNickname: userNickname }, // 요청 파라미터
		                dataType: 'json', // 응답 데이터 형식w
		                success: function (response) {
		                    // 서버 응답 처리
		                    if (response.isDuplicate) {
		                        alert('이미 사용 중인 닉네임입니다.');
		                    } else {
		                        alert('사용 가능한 닉네임입니다.');
		                        document.getElementById('nicknameCheckMsg').innerHTML = '사용 가능한 닉네임입니다';
		                        document.getElementById('nicknameCheckMsg').style.color = 'blue';

		                    }
		                },
		                error: function () {
		                    alert('서버 요청에 실패했습니다.');
		                }
		            });
            	} else {
            		alert('닉네임은 2글자 이상, 20글자 이하의 영문과 한글, 숫자만 허용합니다.');
	            }
            	} else {
            		alert("닉네임을 입력해주세요.");
            	}
            	
        }
        
        
        document.getElementById('SMS').addEventListener("click" , (e)=> {
        	const checked = e.target.checked;
        	if(checked) {
        		e.target.value ="Y"
        	}else {
        		e.target.value = "N"
        	}
        	console.log(e.target.value);
        });
        
        document.getElementById('mail').addEventListener("click" , (e)=> {
        	const checked = e.target.checked;
        	if(checked) {
        		e.target.value ="Y"
        	}else {
        		e.target.value = "N"
        	}
        	console.log(e.target.value);
        	
        });
        
        function modifyCheck() {
		    let userNickname = document.querySelector("#userNickname").value;
		    let nickcnameCheckMsg = document.querySelector("#nicknameCheckMsg");

		    // 이전 값과 현재 값 비교
		    let prevUserNickname = "${userInfo.userNickname}";

		    if (userNickname == '') {
		        alert("닉네임은 반드시 입력해야 합니다.");
		        return false;
		    }

		    if (userNickname !== prevUserNickname) {
		        if (nickcnameCheckMsg.style.color === 'blue') { // 등호 두 개(===)를 사용하여 값 비교
		            isNicknameChecked = true;
		        } else {
		            alert("닉네임 중복 검사를 완료해야 합니다.");
		            return false;
		        }
		    } else {
		        // 닉네임 중복 검사가 완료되었음을 표시
		        isNicknameChecked = true;
		        nicknameCheckMsg.style.color = 'blue'; // 닉네임 중복 검사 완료 메시지 스타일 변경
		    }


		    if (isNicknameChecked) {
		        document.userModifyForm.submit();
		    }
		}   
        
    	
    	</script>
    </body>
</html>