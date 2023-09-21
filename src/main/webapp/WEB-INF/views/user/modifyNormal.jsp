<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>회원 정보 수정</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    	<link rel="stylesheet" href="../resources/css/user/modify.css">
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                	<form name="userModifyForm" action="/user/modifyNormal.tp" method="post">
                		<input type="hidden" name="userNo" value="${userInfo.userNo }">
	                    <div>
	                        <label for="userPw">비밀번호<span class="redSpan">*</span></label>
	                        <input type="password" name="userPw" id="userPw" class="input" onchange="pwCheck();" placeholder="영어, 숫자, 특수문자를 반드시 포함해 8~20글자">
	                    </div>
	                    <span id="pwCheckMsg" class="guideMsg"></span>
	                    <div>
	                        <label for="userPwCheck">비밀번호 확인<span class="redSpan">*</span></label>
	                        <input type="password" name="userPwCheck" id="userPwCheck" class="input" onchange="pwCheck();" placeholder="입력 가능한 특수문자(~, !, @, #, $, %, ^)">
	                    </div>
	                    <span id="pwCheckMsg" class="guideMsg"></span>
	                    <div>
	                        <label for="userNickname">닉네임<span class="redSpan">*</span></label>
	                        <input type="text" name="userNickname" id="userNickname" class="input" value="${userInfo.userNickname }" placeholder="닉네임을 입력해주세요">
	                        <button id="nicknameBtn" onclick="nicknameCheck();" type="button" class="btn btn-light btn-sm" disabled="true">중복 확인</button>
	                    </div>
	                    <span id="nicknameCheckMsg" class="guideMsg"></span>
	                    <div>
	                        <label for="userEmail">이메일<span class="redSpan">*</span></label>
	                        <input type="text" name="userEmail" id="userEmail" class="input" value="${userInfo.userEmail }" placeholder="닉네임을 입력해주세요">
	                        <button id="emailBtn" class="btn btn-light btn-sm" disabled="true">이메일 인증</button>
	                    </div>
	                    <%
  							  // 세션에서 "code" 가져오기
    							Integer code = (Integer) session.getAttribute("code");
    						%>
	                    <span id="emailCheckMsg" class="guideMsg"></span>
	                    <div id="emailCodeDiv" class="inputDiv" style="display : none">
		                    <div id="emailCheckDiv">
		                        <label for="mailCheck"></label>
		                        <input type="text" name="mailChek" id="mailCheck" placeholder="인증번호를 입력해주세요">
		                        <button type="button" class="btn btn-light btn-sm" onclick="checkEmailCode();">인증번호 확인</button>
		                    </div>
		                    <span id="emailCodeCheckMsg" class="guideMsg"></span>
	                    </div>
	                    <div>
	                        <label for="userTel">전화번호</label>
	                        <input type="text" name="userTel" id="userTel" class="input" placeholder="전화번호를 입력해주세요">
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
	                        <button type="button" id="userModifyBtn" onclick="modifyCheck();" class="btn btn-info">회원 정보 수정</button>
	                    </div>
                	</form>
                </div>
            </div>
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
    	$(function() {
//     		  var c1 = $("input[name='userEmailStatus']").is(":checked") ? "Y" : "N";
//     		  var c2 = $("input[name='userSmsStatus']").is(":checked") ? "Y" : "N";
    		  
//     		  $("#mail").val(c1);
//     		  $("#SMS").val(c2);
    		  
//     		  console.log(c1);
//     		  const mail = document.querySelector("input[name='userEmailStatus']");
//     		  const sms = document.querySelector("input[name='userSmsStatus']");
    		  
//     		  console.log(mail)
//     		  console.log(sms)
    		  
    		}); 
    	
        function pwCheck() {
            let userPw = document.querySelector("#userPw").value;
            let userPwCheck = document.querySelector("#userPwCheck").value;

            if(userPw === '' && userPwCheck === '') {
                window.alert('비밀번호를 입력해주세요.');
                return false;
            }
            if (userPw.length >= 6 && userPw.length <= 16) {
                if (userPw === userPwCheck) {
                    document.getElementById('pwCheckMsg').innerHTML = '비밀번호가 일치합니다.';
                    document.getElementById('pwCheckMsg').style.color = 'blue';
                } else {
                    document.getElementById('pwCheckMsg').innerHTML = '비밀번호가 일치하지 않습니다.';
                    document.getElementById('pwCheckMsg').style.color = 'red';
                    return false;
                }
            } else {
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pwCheckMsg').innerHTML = '';
                return false;
            }
        }
    	
    	
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
		
		
	    const userEmailInput = document.getElementById('userEmail');
		const emailBtn = document.getElementById('emailBtn');
		
		userEmailInput.addEventListener('input', function () {
		    const userEmail = userEmailInput.value;
		    const userDbEmail = `${userInfo.userEmail}`;

		    // 유효성 검사 및 비교
		    if (userEmail !== userDbEmail) {
		        // 버튼 활성화
		        emailBtn.disabled = false;
		    } else {
		        // 버튼 비활성화
		        emailBtn.disabled = true;
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
        
        
        
		function emailCheck() {
		    const email = document.getElementById('userEmail').value;
		
		    if (email !== '') {
		        $.ajax({
		            url: '/user/mailCheck.tp',
		            method: 'GET',
		            data: { userEmail: email },
		            dataType: 'json',
		            success: function(response) {
		                if (response.isDuplicate) {
		                    alert('이미 등록된 이메일입니다.');
		                } else {
           	    		    const authCode = <%= code %>;
			    		    
		 	    		    if(authCode != null) {
		 	    		    	alert('인증번호가 전송되었습니다.');
		 		    			// 버튼 누르면 인증번호 입력 div flex로
		 						 emailCodeDiv.style.opacity = '1';
		 						 emailCodeDiv.style.display = 'flex';
		                }else {
	 	    		    	alert('인증번호 전송이 실패되었습니다. 이메일을 확인해주세요.');
		 	    	        document.getElementById('mailClickBtn').disabled = false;    
		 						 emailCodeDiv.style.display = 'none';
		                }
		                }
		            },
		            error: function() {
		                alert('서버 요청에 실패했습니다.');
		            }
		        });
		    } else {
		        alert('이메일을 입력하세요.');
		    }
		}


    	// 인증번호 비교
		function checkEmailCode() {
			const email = document.querySelector("#userEmail").value;
		    const code = document.getElementById('mailCheck').value; // 사용자가 입력한 인증번호
		    const authCode = <%= code %>;
		    console.log('전송된 인증번호 : ' + authCode);
		    console.log('사용자가 입력한 인증번호: ' + code);
		    
		    // XMLHttpRequest 객체 생성
		    const xhr = new XMLHttpRequest();
		    
		    // .open() : 요청에 필요한 정보 설정
		    xhr.open('GET', '/user/checkEmailCode.tp?mailCheckCode=' + code, true);
		    
		    if(code == authCode) {
		    	alert('메일 인증이 성공하였습니다');
                document.getElementById('emailCodeCheckMsg').innerHTML = '메일 인증이 완료되었습니다.';
                document.getElementById('emailCodeCheckMsg').style.color = 'blue';
		    } else {
		    	alert('인증번호를 확인해주시기 바랍니다.');
                document.getElementById('emailCodeCheckMsg').innerHTML = '메일 인증이 완료되지 않았습니다.';
                document.getElementById('emailCodeCheckMsg').style.color = 'red';		    	
		    }
		    
		    xhr.onload = function() {
		        // 200 HTTP 응답 코드(OK)
		        if (xhr.status === 200) {
		            const data = xhr.responseText;
		            console.log('data: ' + data);
		            if (data === 'valid') {
		                alert('인증번호가 올바릅니다.');
		            } else {
		                alert('인증번호가 올바르지 않습니다.');
		            }
		        } else {
		            console.error('요청 실패');
		        }
		    };
		    
		    // Send the request
		    xhr.send();
		}    	     
 
    	
    	
		function modifyCheck() {
		    let userPw = document.querySelector("#userPw").value;
		    let userPwCheck = document.querySelector("#userPwCheck").value;
		    let userNickname = document.querySelector("#userNickname").value;
		    let userEmail = document.querySelector("#userEmail").value;
		    let emailCodeCheckMsg = document.querySelector("#emailCodeCheckMsg");
		    let idCheckMsg = document.querySelector("#idCheckMsg");
		    let nickcnameCheckMsg = document.querySelector("#nicknameCheckMsg");

		    // 이전 값과 현재 값 비교
		    let prevUserNickname = "${userInfo.userNickname}";
		    let prevUserEmail = "${userInfo.userEmail}";

		    if (userPw == '' || userPwCheck == '' || userNickname == '' || userEmail == '') {
		        alert("필수 정보는 모두 입력해야 합니다.");
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

		    if (userEmail !== prevUserEmail) {
		    	if(emailCodeCheckMsg.style.color === 'blue'){
		    		isEmailChecked = true; // 이메일 인증이 완료되었음을 표시
		    	} else {
			        alert("이메일 인증을 완료해야 합니다.");
			        return false; // 이메일 인증이 완료되지 않았으므로 폼 전송 중지
		    	}
		    } else {
		        isEmailChecked = true; // 이메일 인증이 완료되었음을 표시
		        emailCodeCheckMsg.style.color = 'blue'; // 닉네임 중복 검사 완료 메시지 스타일 변경
		    };

		    if (userPw !== userPwCheck) {
		        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		        return false;
		    }
		    

		    if (isNicknameChecked && isEmailChecked) {
		        document.userModifyForm.submit();
		    }
		}   
        
    	</script>
    </body>
</html>