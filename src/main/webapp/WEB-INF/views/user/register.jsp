<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
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
	        <div class="registerContainer">
	            <p class="pageTitle">회원가입</p>
	            <div class="pHead">
	                <span class="redSpan">*</span><span class="pageTitleMsg">은 필수 입력 정보입니다</span>
	            </div>
	            <div class="w-line"></div>
	            <div id="container">
	                <div class="flex">
	                	<form name="registerForm" action="/user/register.tp"  method="post">
		                    <div class="inputDiv">
		                        <label for="userId">아이디<span class="redSpan">*</span></label>
		                        <input type="text" name="userId" id="userId" class="input" onchange="regIdCheck()"placeholder="5~15글자의 영어 소문자, 숫자만 입력">
		                        <button id="idCheckBtn" type="button" onclick="idCheck();" class="btn btn-light btn-sm checkBtn">중복 확인</button>
		                    </div>
		                    <span id="idCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv">
		                        <label for="userPw">비밀번호<span class="redSpan">*</span></label>
		                        <input type="password" name="userPw" id="userPw" class="input" onchange="pwCheck();" placeholder="영어, 숫자, 특수문자를 반드시 포함해 8~20글자">
		                    </div>
		                    <span id="pwCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv">
		                        <label for="userPwCheck">비밀번호 확인<span class="redSpan">*</span></label>
		                        <input type="password" name="userPwCheck" id="userPwCheck" class="input" onchange="pwCheck();" placeholder="입력 가능한 특수문자(~, !, @, #, $, %, ^)">
		                    </div>
		                    <span id="pwCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv">
		                        <label for="userName">이름<span class="redSpan">*</span></label>
		                        <input type="text" name="userName" id="userName" class="input" onchange="regNameCheck()" placeholder="이름은 2~10글자만 입력할 수 있습니다">
		                    </div>
		                    <span id="nameCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv">
		                        <label for="userNickcname">닉네임<span class="redSpan">*</span></label>
		                        <input type="text" name="userNickname" id="userNickname" class="input" onchange="regNicknameCheck()" placeholder="닉네임을 입력해주세요">
		                        <button onclick="nicknameCheck();" type="button" class="btn btn-light btn-sm checkBtn">중복 확인</button>
		                    </div>
		                    <span id="nicknameCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv">
		                        <label for="userEmail">이메일<span class="redSpan">*</span></label>
		                        <input type="text" name="userEmail" id="userEmail" class="input" placeholder="이메일을 입력해주세요">
		                        <button type="button" id="mailClickBtn" class="btn btn-light btn-sm checkBtn" onclick="emailCheck();">이메일 인증</button>
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
			                        <button type="button" class="btn btn-light btn-sm checkBtn" onclick="checkEmailCode();">인증번호 확인</button>
			                    </div>
			                    <span id="emailCodeCheckMsg" class="guideMsg"></span>
		                    </div>
		                    <div id="genderBox" class="inputDiv">
		                        <label for="">성별</label>
		                        <div id="genderRadio">
		                            <input type="radio" class="form-check-input" name="userGender" id="gnederM" value="male"><label class="form-check-label" for="genderM">남자</label>
		                            <input type="radio" class="form-check-input" name="userGender" id="gnederF" value="female"><label class="form-check-label" for="genderM">여자</label>
		                        </div>
		                    </div>
		                    <div class="inputDiv">
		                        <label for="userTel">전화번호</label>
		                        <input type="text" name="userTel" id="userTel" class="input" placeholder="전화번호를 입력해주세요">
		                    </div>
		                    <span id="telCheckMsg" class="guideMsg"></span>
		                    <div class="inputDiv" style="display: flex; align-items: center;">
		                        <label for="">SMS/메일<br>수신 여부</label>
		                        <div id="checkDiv">
		                        
		                            <input type="checkbox" name="userEmailStatus" class="form-check-input" value="Y" id="mail"><label class="form-check-label" for="mail">메일</label>
		                            <input type="checkbox" name="userSmsStatus" class="form-check-input" value="Y" id="SMS"><label class="form-check-label" for="SMS">SMS</label>
		                        </div>
		                    </div>
		                    <div class="registerBox">
		                        <button type="button" id="registerBtn" onclick="registerCheck();" class="btn btn-info"
		                        		style="color:white; width: 200px; height: 45px;"
		                        >회원가입</button>
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

	     // 아이디 중복 검사
	        function idCheck() {
	            const userId = $('#userId').val(); // jQuery를 사용하여 입력값 가져오기
	            
	            if(userId != '') {
	            	
	            	if (/^[a-zA-Z0-9]{5,15}$/.test(userId)) {
		            // AJAX 요청 보내기
		            $.ajax({
		                url: '/user/idCheck.tp', // 서버 요청 URL
		                method: 'GET',
		                data: { userId: userId }, // 요청 파라미터
		                dataType: 'json', // 응답 데이터 형식
		                success: function (response) {
		                    // 서버 응답 처리
		                    if (response.isDuplicate) {
		                        alert('이미 사용 중인 아이디입니다.');
		                    } else {
		                        alert('사용 가능한 아이디입니다.');
		                        document.getElementById('idCheckMsg').innerHTML = '사용 가능한 아이디입니다';
		                        document.getElementById('idCheckMsg').style.color = 'blue';
		                    }
		                },
		                error: function () {
		                    alert('서버 요청에 실패했습니다.');
		                }
		            });
	            } else {
	            	alert('아이디는 5글자 이상, 15글자 이하의 영문 대소문자와 숫자만 허용합니다.');
	            }
	            } else {
	            	alert("아이디를 입력해주세요.");
	            }
	        }
	     
	     
	     // 닉네임 중복 검사
	        function nicknameCheck() {
	            const userNickname = $('#userNickname').val(); // jQuery를 사용하여 입력값 가져오기
	
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
//         // 아이디 중복 검사
// 		function idCheck() {
// 		    const userId = document.getElementById('userId').value;

// 		    // XMLHttpRequest 객체 생성
// 		    const xhr = new XMLHttpRequest();
		
// 		    // 서버로 요청을 보낼 URL 설정
// 		    const url = '/user/checkId.tp'; // 실제 서버 요청 URL로 변경해야 함
		
// 		    // GET 요청을 보낼 경우
// 		    xhr.open('GET', url + '?userId=' + userId, true);
		
// 		    // 요청이 완료될 때 실행될 콜백 함수
// 		    xhr.onload = function() {
// 		        if (xhr.status === 200) {
// 		            const response = JSON.parse(xhr.responseText);

// 		            // 서버에서 받은 응답을 확인하여 중복 여부 처리
// 		            if (response.isDuplicate) {
// 		                alert('이미 사용 중인 아이디입니다.');
// 		            } else {
// 		                alert('사용 가능한 아이디입니다.');
// 		            }
// 		        } else {
// 		            alert('서버 요청에 실패했습니다.');
// 		        }
// 		    };
		
// 		    // 요청 보내기
// 		    xhr.send();
// 		}        
        
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
        
        // 유효성 체크 함수
        // 아이디 유효성 체크 
//         function regIdCheck() {
//             let userId = document.querySelector("#userId").value;
//             var regId = /^[a-zA-Z0-9]{5,15}$/;
//  	      // 아이디
//             if(!regId.test(userId)){
//                 document.getElementById('idCheckMsg').innerHTML = '아이디는 4글자 이상, 20글자 이하의 영문, 숫자로된 것만 허용합니다.';
//                 document.getElementById('idCheckMsg').style.color = 'red';
// //                 document.getElementById('idCheckButton').disabled = true; // 중복 검사 버튼 비활성화
//                 return false;
//             }else{
//                 document.getElementById('idCheckMsg').innerHTML = '';
//                 document.getElementById('idCheckButton').disabled = false; // 중복 검사 버튼 활성화
//             }            
//         }
        
        function regIdCheck() {
            let userId = document.querySelector("#userId").value;
            var regId = /^[a-zA-Z0-9]{5,15}$/;

            // 중복 검사 버튼 요소 가져오기
            let idCheckButton = document.getElementById('idCheckButton');

            // 아이디 유효성 검사
            if (!regId.test(userId)) {
                document.getElementById('idCheckMsg').innerHTML = '아이디는 5글자 이상, 15글자 이하의 영문 대소문자와 숫자만 허용합니다.';
                document.getElementById('idCheckMsg').style.color = 'red';
                if (idCheckButton) {
                    idCheckButton.disabled = true; // 중복 검사 버튼 비활성화
                }
                return false;
            } else {
                document.getElementById('idCheckMsg').innerHTML = '';
                if (idCheckButton) {
                    idCheckButton.disabled = false; // 중복 검사 버튼 활성화
                }
            }
        }

        
        // 비밀번호 유효성 체크
        function regPwCheck() {
            let userPw = document.querySelector("#userPw").value;
            let userPwCheck = document.querySelector("#userPwCheck").value;
            var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^_.])[A-Za-z\~!@#$%^\d]{6,20}$/;
 	      // 비밀번호
            if(!regPw.test(userPw)){
                const msg = '비밀번호는 6글자 이상, 16글자 이하의 영문, 숫자, 특수문자만 허용하며 반드시 하나 이상을 포함해야 합니다.'
                document.getElementById('pwCheckMsg').innerHTML = msg;
                document.getElementById('pwCheckMsg').style.color = 'red';
                return false;
            }else{
                document.getElementById('pwCheckMsg').innerHTML = '';
            }            

        }
        // 이름 유효성 체크
        function regNameCheck() {
            let userName = document.querySelector("#userName").value;
            var regName = /^[가-힣a-zA-Z]{2,10}$/;  
 	      // 이름
            if(!regName.test(userName)){
                document.getElementById('nameCheckMsg').innerHTML = '이름은 2글자 이상, 10글자 이하만 허용합니다.';
                document.getElementById('nameCheckMsg').style.color = 'red';
                return false;
            }else{
                document.getElementById('nameCheckMsg').innerHTML = '';
            }                      
        }

        // 닉네임 유효성 체크
        function regNicknameCheck() {
            let userNickname = document.querySelector("#userNickname").value;
            var regNickname = /^[가-힣a-zA-Z0-9]{2,20}$/
            // 닉네임
            if(!regNickname.test(userNickname)){
                document.getElementById('nicknameCheckMsg').innerHTML = '닉네임은 2글자 이상, 20글자 이하만 허용합니다.';
                document.getElementById('nicknameCheckMsg').style.color = 'red';
                return false;
            }else{
                document.getElementById('nicknameCheckMsg').innerHTML = '';
            }            
        }
        
        function regPhoneCheck() {
            let userTel = document.querySelector("#userTel").value;
            var regPhone = /^\d{11}$/;
            // 전화번호
            if(!regPhone.test(userTel)){
                document.getElementById('telCheckMsg').innerHTML = '전화번호는 11글자의 숫자만 허용합니다.';
                document.getElementById('telCheckMsg').style.color = 'red';
                return false;
            }else{
                document.getElementById('telCheckMsg').innerHTML = '';
            }
        }

        function regCheck() {
            
            /*
 		    * <정규표현식으로 유효성 체크(아이디, 비밀번호, 이름)>
            * 아이디 : 5글자 이상, 15글자 이하, 영문, 숫자만 허용
            * 비밀번호 : 6글자 이상, 16글자 이하, 영문, 숫자, 특수문자(~, !, @, #, $, %, ^, _, .)만, 적어도 하나 이상의 영문, 숫자, 특수문자 포함
            * 이름 : 2글자 이상, 15글자 이하 
            * 전화번호 11글자
            */            
 	      // 정규표현식과 입력받은 값을 비교해서 허용하지 않으면 메시지 출력, 허용되면 메시지 사라짐
        }
        
//         // 이메일 인증을 위한 함수
//         $('#mailClickBtn').click(function() {
//     		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
//     		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
//     		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
    		
//     		$.ajax({
//     			type : 'get',
//     			url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
//     			success : function (data) {
//     				console.log("data : " +  data);
//     				checkInput.attr('disabled',false);
//     				code =data;
//     				alert('인증번호가 전송되었습니다.')
//     			}			
//     		}); // end ajax
//     	}); // end send eamil
    	
//     	function emailCheck() {
//     		const email = document.querySelector("#userEmail").value;
// 			const emailCodeDiv = document.getElementById('emailCodeDiv');
    		
//     		if(email != '') {
// 	    		document.getElementById('mailClickBtn').addEventListener('click', function() {
// 	    			// "인증번호 보내기" 버튼을 클릭하면 버튼을 비활성화
// 	    	        document.getElementById('mailClickBtn').disabled = true;    
	    			
// 	    			const email = document.getElementById('userEmail').value;
// 	    		    console.log('이메일: ' + email);
// 	    		    const checkInput = document.querySelectorAll('.mail-check-input');
// 	    		    // XMLHttpRequest 객체 생성
// 	    		    // XMLHttpRequest : 객체를 사용하여 서버에 동기 또는 비동기식 요청을 보낼 수 있음, 요청에 대한 응답 정보를 웹에 로드할 수 있음
// 	    		    const xhr = new XMLHttpRequest();
	
// 	    		    // .open() : 요청에 필요한 정보 설정
// 	    		    xhr.open('GET', '/user/mailCheck.tp?userEmail=' + email, true);
// 	    		    // 여기까지 성공!!!!!!!!!!!!!!!!!!!
// 	    		    // 요청 실패 해결해야 함
	    		    
<%-- 	    		    const authCode = <%= code %>; --%>
	    		    
// 	    		    if(authCode != null) {
// 	    		    	alert('인증번호가 전송되었습니다.');
// 		    			// 버튼 누르면 인증번호 입력 div flex로
// 						 emailCodeDiv.style.opacity = '1';
// 						 emailCodeDiv.style.display = 'flex';
// 	    		    } else {
// 	    		    	alert('인증번호 전송이 실패되었습니다. 이메일을 확인해주세요.');
// 	    	        document.getElementById('mailClickBtn').disabled = false;    
// 						 emailCodeDiv.style.display = 'none';
	    		    	
// 			        }
	    		    
// 	    		    // Set up a callback function for when the request completes
// 	    		    xhr.onload = function() {
// 	    		    	// 200 HTTP 응답 코드(OK)
// 	    		        if (xhr.status === 200) {
// 	    		            const data = xhr.responseText;
// 	    		            console.log('data: ' + data);
// 	    		            checkInput.forEach(function(input) {
// 	    		                input.disabled = false;
// 	    		            });
// 	    		            const code = data;
// 	    		            alert('인증번호가 전송되었습니다.');
// 	    		        } else {
// 	    		            console.error('요청 실패');
// 	    		        }
// 	    		    };
// 	    		    // Send the request
// 	    		    xhr.send();
// 	    		});    		
    			
//     		}else {
//     			alert("이메일을 입력해주세요.")
//     		}
//     	}

		// AJAX로
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
		 		    			document.getElementById('mailClickBtn').disabled = true;    
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
		            	alert('인증번호가 전송되었습니다.');
 		    			// 버튼 누르면 인증번호 입력 div flex로
 		    			document.getElementById('mailClickBtn').disabled = true;    
 						 emailCodeDiv.style.opacity = '1';
 						 emailCodeDiv.style.display = 'flex';
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

         function registerCheck() {
             let userId = document.querySelector("#userId").value;
             let userPw = document.querySelector("#userPw").value;
             let userPwCheck = document.querySelector("#userPwCheck").value;
             let userName = document.querySelector("#userName").value;
             let userNickname = document.querySelector("#userNickname").value;
             let userEmail = document.querySelector("#userEmail").value;
             let emailCodeCheckMsg = document.querySelector("#emailCodeCheckMsg");
             let idCheckMsg = document.querySelector("#idCheckMsg");
             let nickcnameCheckMsg = document.querySelector("#nicknameCheckMsg");
             
             
             
             if(userId == '' || userPw == '' || userPwCheck == '' || userName == '' || userNickname =='' || userEmail =='' ){
                alert("필수 정보는 모두 입력해야 합니다.");
   				return false;
		   } else if (idCheckMsg.style.color !== "blue") {
			   alert("아이디 중복 검사를 완료해야 합니다.")
		   } else if (nickcnameCheckMsg.style.color !== "blue") {
			   alert("닉네임 중복 검사를 완료해야 합니다.")
		   } else if (emailCodeCheckMsg.style.color !== "blue") {
		        alert("이메일 인증을 완료해야 합니다.");
		        return false;
		    } else {
		    	document.registerForm.submit();
		    }
	   }            
        </script>
    </body>
</html>