<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/community/detail.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 1000px;margin: 0 auto;">
	        	<form action="/community/modify.tp" method="get">
	                <div style="width: 100%;height: 135px;">
	                    <h4 style="float: left;font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">
	                        <c:if test="${community.boardType eq 'QnABoard'}">                
	                            질의문답 게시판
	                        </c:if>
	                        <c:if test="${community.boardType eq 'travelCompanion'}">                
	                            동행 구인 게시판
	                        </c:if>
	                        <c:if test="${community.boardType eq 'travelcertify'}">                
	                            여행 인증 게시판
	                        </c:if>
	                    </h4>
	                    <button id="goBackButton" style="float: right;margin: 50px 10px 0px 0px;" type="button" class="btn btn-primary">목록으로</button>
	                    <button id="goModifyButton" style="float: right;margin: 50px 10px 0px 0px;" type="button" class="btn btn-secondary">수정하기</button>
	                    <button id="deleteButton" style="float: right;margin: 50px 10px 0px 0px;" type="button" class="btn btn-dark">삭제하기</button>
	                </div>
	                <table class="table caption-top" style="padding: 0px 20px; font-family: 'SUITE-Regular'; font-size: 18px; width: 100%;">
					    <thead style="--bs-table-bg: rgba(224, 224, 224, 0.32); border: 1px solid #eee; border-bottom: 2px solid #ccc;">
					        <tr>
					            <th scope="col" style="text-align: left; width: 450px; padding-left: 20px;">
					                제목 : ${community.boardTitle}
					            </th>
					            <th scope="col" style="text-align: center; width: 150px;">작성자 : ${community.userNickname}&nbsp;</th>
					            <th scope="col" style="text-align: center; width: 170px;">
					                날짜 :
					                <fmt:formatDate pattern="20YY-MM-dd" value="${community.boardCreateDate}" />
					            </th>
					            <th scope="col" style="text-align: center; width: 150px;">조회수 : ${community.viewCount}&nbsp;</th>
					        </tr>
					    </thead>
					    <tbody style="text-align: left; height: 600px; border: 1px solid #ccc; border-bottom-left-radius: 10px;">
					        <tr>
					            <td colspan="4">
					                <c:if test="${community.boardType eq 'travelcertify'}">
					                	<c:if test="${community.boardFileName ne null}"> 
						                    <!-- 이미지를 클릭하면 모달을 열기 위한 링크 -->
						                    <div class="image-container" style="width: 300px; height: 200px; border-radius: 5px; float: left; margin: 10px; overflow: hidden;">
						                        <div class="modal-trigger" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
						                    </div>
					                	</c:if>
					                </c:if>
					                <textarea style="height: 550px; width: 100%; resize: none; border: 0px; outline: none; padding: 0px 10px;" readonly>${community.boardContent}</textarea>
					            </td>
					        </tr>
					    </tbody>
					</table>
	        	</form>
	        	<!-- 모달 창 -->
				<div id="myModal" class="modal">
				    <span class="close">&times;</span>
				    <img class="modal-content" id="modalImage">
				</div>
                <div style="width: 100%;height: 80px;border-bottom: 2px solid #ccc;">
                <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 80px;">해당 게시물이 마음에 드셨나요?</h4>
                </div>
                <div style="width: 100%;height: 130px;border-bottom: 1px solid #ccc;">
                <h4 style="float: left;;font-family: 'SUITE-Regular';font-size: 25px;padding: 20px;margin-top: 30px;">추천 버튼으로 마음을 표현해보세요 ^O^!</h4>
                <div style="float: right;padding: 10px;margin-top: 27px;">
                    <span style="float: right;font-size: 23px;font-weight: 600;margin-top: 12px;margin-left: 5px;">${community.likeNo}</span>
                    <img style="width: 40px;float: right;" src="../resources/images/community/likeoff.png" alt="">
                </div>
                </div>
                <div style="width: 100%;height: 110px;margin-top: 80px;">
                    <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">댓글 남기기</h4>
                </div>
                <div style="width: 100%;margin: 0 auto;height: 245px;border-radius: 10px;background-color: rgb(239, 239, 239);font-family: 'SUITE-Regular';">
                    <div class="form-floating" style="width: 90%;margin: 0 auto;padding-top: 1px;">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px;border: 1px solid #ccc;margin-top: 25px;resize: none;height: 150px;"></textarea>                        
                        <label for="floatingTextarea2" style="margin-top: 20px;">댓글을 입력해주세요~</label>
                    </div>
                    <button onclick="insertReplyBtn()" type="button" class="btn btn-secondary" style="float: right;margin-right: 50px;margin-top: 15px;">
                        글 등록
                    </button>
                    <div class="form-check" style="float: right;margin-right: 15px;margin-top: 21px;">
                        <input id="secretCheck" class="form-check-input" type="checkbox" value="Y" id="flexCheckDefault">
                        <label class="form-check-label" for="secretCheck">
                          비밀 댓글
                        </label>
                      </div>
                </div>
                <div style="width: 100%;height: 110px;margin-top: 80px;">
                    <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">댓글 목록</h4>
                </div>
                <c:forEach var="reply" items="${rList }" >				
	                <div style="width: 1000px;margin: 0 auto;font-family: 'SUITE-Regular';position: relative;">
	                    <div style="width: 100%;height: 200px;background-color: #FDF6F0;border-bottom: 2px solid #eedecf;">
	                        <div style="float: left;padding: 20px;padding-left:50px;">
	                            <h4 style="float: left;font-weight: 600;">${reply.userNickname }</h4>
	                            <p style="float: left;padding: 5px;padding-left: 8px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replyCreateDate }"/>
								</p>
		                        <div style="width: 150px;height: 30px;float: left;margin-left: 10px;">
		                        	<c:if test=""></c:if>
		                            <img style="width: 26px;height: 25px;float: left;" src="../resources/images/community/likeoff.png" alt="">
		                            <span style="float: left;font-size: 17px;font-weight: 600;margin-top: 4px;margin-left: 4px;">${reply.likeNo }</span>
		                        </div>
	                            <div style="width: 900px;height: 100px;background-color: #FCECDD;float: left;padding: 10px;border-radius: 10px;">
	                                <p>${reply.replyContent }.</p>
	                            </div>
								<a href="javascript:void(0);" onclick="showModifyForm(this);"
								style="position: absolute;top: 24px;right:135px;">수정하기</a>
								<a href="javascript:void(0);" onclick="deleteReply(event);" data-reply-no="${reply.replyNo}"
								style="position: absolute;top: 24px;right: 65px;">삭제하기</a>
	                        </div>
	                    </div>
	                </div>
	                <div style="display:none;width: 100%;margin: 0 auto;height: 200px;background-color: rgb(239, 239, 239);font-family: 'SUITE-Regular';border-bottom: 2px solid #d8dee3;">
	                    <div class="form-floating" style="width: 90%;margin: 0 auto;padding-top: 1px;">
	                        <textarea name="replyContent" class="form-control" placeholder="Leave a comment here" style="height: 115px;border: 1px solid #ccc;margin-top: 25px;resize: none;">${reply.replyContent}</textarea>                        
	                        <label for="floatingTextarea2" style="margin-top: 22px;">댓글을 입력해주세요~</label>
	                    </div>
	                    <button onclick="modifyBack(this);" type="button" class="btn btn-secondary" style="float: right;margin-right: 50px;margin-top: 10px;">
	                        취소
	                    </button>
	                    <button type="button" onclick="modifyReply(this);" class="btn btn-secondary" style="float: right;margin-right: 10px;margin-top: 10px;">
	                        수정 완료
	                    </button>
	                    <input type="hidden" value="${reply.replyNo }">
	                    <div class="form-check" style="float: right;margin-right: 15px;margin-top: 16px;">
	                        <input name="replySecretType" class="form-check-input" type="checkbox" value="Y" ${reply.replySecretType.toString() eq 'Y' ? 'checked' : ''}>
	                        <label class="form-check-label">
	                          비밀 댓글
	                        </label>
	                     </div>
	                </div>
				</c:forEach>
            </div>
            <div style="width: 100%;height: 100px;"></div>
        </main>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
        	<jsp:include page="/include/navjs.jsp"></jsp:include>
            
	        document.getElementById("goBackButton").addEventListener("click", function() {
	            location.href = "/community/certify.tp"
	        });
            document.getElementById("deleteButton").addEventListener("click", function() {
            	if(confirm("게시물을 삭제하시겠습니까?")){            		
                	location.href= "/community/delete.tp?boardType=${community.boardType}&boardNo=${community.boardNo}";
            	}
            });
            
            if("${community.boardType}" === "travelcertify"){            	
	            // 이미지 모달 기능
	            // 이미지를 클릭하면 모달 열기
				const modalTrigger = document.querySelector('.modal-trigger');
				const modal = document.getElementById('myModal');
				const modalImage = document.getElementById('modalImage');
				const closeModal = document.querySelector('.close');
				
				modalTrigger.addEventListener('click', () => {
				    modal.style.display = 'block';
				    modalImage.src = modalTrigger.style.backgroundImage.replace('url("', '').replace('")', '');
				});
				
				// 모달 닫기
				closeModal.addEventListener('click', () => {
				    modal.style.display = 'none';
				});
				
				// 모달 외부를 클릭하면 모달 닫기
				window.addEventListener('click', (event) => {
				    if (event.target == modal) {
				        modal.style.display = 'none';
				    }
				});
            }
            //댓글 등록 ajax
           	var boardNo = "${community.boardNo}";
           	var boardType = "${community.boardType}";
            function insertReplyBtn() {
                var replyContent = document.getElementById('floatingTextarea2').value;
                // 값의 길이를 확인하고 5보다 작으면 경고창을 띄웁니다.
                if (replyContent.length < 5) {
                  alert('댓글 내용은 5자 이상 작성하셔야 합니다.');
                }
                // 체크되었는지 여부를 확인합니다.
                var replySecretType = document.getElementById('secretCheck').checked ? 'Y' : 'N';
                // AJAX 요청 보내기
                $.ajax({
                    type: "POST", // 또는 "GET"에 맞게 변경
                    url: "/reply/add.tp", // 로그인 처리를 하는 URL로 변경
                    data: {
                    	boardNo: boardNo,
                    	boardType: boardType,
                    	replyContent: replyContent,
                    	replySecretType: replySecretType
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("댓글 작성을 성공하였습니다.");
                            location.reload();
                        } else {
                        	alert("댓글 작성을 실패하였습니다.");
                        }
                    },
                    error: function () {
                    	console.error("서버 요청에 실패했습니다. 상태 코드: " + status);
                        console.error("에러 내용: " + error);
                    }
                });                
                
            }
            
            function showModifyForm(obj){
				obj.parentElement.parentElement.parentElement.nextElementSibling.style.display="";
			}
            function modifyBack(obj){
            	obj.parentElement.style.display="none";
            }
            
            function modifyReply(obj){
            	if(confirm("댓글을 수정하시겠습니까?")){
            		
            	}else{
            		return;
            	}
            	var replyNo = obj.nextElementSibling.value;
            	var replyContent = obj.previousElementSibling.previousElementSibling.children[0].value;
                // 값의 길이를 확인하고 5보다 작으면 경고창을 띄웁니다.
                if (replyContent.length < 5) {
                  alert('댓글 내용은 5자 이상 작성하셔야 합니다.');
                }
                // 체크되었는지 여부를 확인합니다.
                var replySecretType = obj.nextElementSibling.nextElementSibling.children[0].checked ? 'Y' : 'N';
            	$.ajax({
                    type: "POST", // 또는 "GET"에 맞게 변경
                    url: "/reply/modify.tp", // 로그인 처리를 하는 URL로 변경
                    data: {
                    	replyNo: replyNo,
                    	boardNo: boardNo,
                    	boardType: boardType,
                    	replyContent: replyContent,
                    	replySecretType: replySecretType
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("댓글 수정을 완료하였습니다.");
                            location.reload();
                        } else {
                        	alert("댓글 수정을 실패하였습니다.");
                        }
                    },
                    error: function () {
                    	console.error("서버 요청에 실패했습니다. 상태 코드: " + status);
                        console.error("에러 내용: " + error);
                    }
                });  
            }
            
            function deleteReply(event) {
			    var button = event.target; // 클릭된 버튼 요소
			    var replyNo = button.getAttribute("data-reply-no");

			    if (confirm("리뷰를 삭제하시겠습니까?")) {
			        location.href = "/reply/delete.tp?replyNo=" + replyNo + "&boardNo=" + boardNo+ "&boardType=" + boardType;
			    }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>