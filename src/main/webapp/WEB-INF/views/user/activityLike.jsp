<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>나의 좋아요</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/user/delete.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
        <div class="container">
            <p>활동 내역 관리</p>
            <div class="w-line"></div>
            <div class="flex">
                <div id="left">
                    <span class="fs-3">${sessionScope.userNickname }님 <br>환영합니다</span>
                    <br>
                    <br>
                    <li><a href="/user/activityLike.tp">나의 좋아요</a></li>
                    <li><a href="/user/activityReview.tp">나의 리뷰</a></li>
                    <li><a href="/user/activityWrite.tp">내가 쓴 글</a></li>
                    <li><a href="/user/activityReply.tp">내가 쓴 댓글</a></li>
                </div>
                <div class="h-line"></div>
                <div id="right">
                    <p>나의 좋아요</p>
                    <table class="table table-bordered text-center ">
                        <thead class="table-light">
                            <tr>
                                <th>좋아요한 글</th>
                                <th>좋아요 삭제</th>
                            </tr>
                        </thead>
                        
                        
                        <tbody class="table-group-divider">
							<c:forEach items="${like}" var="item">
	                        <tr id="sample">
	<%-- 						    <c:out value="${item.inquiryCreateDate.toString()}" /> --%>
	                            <td><a href="/community/detail.tp?boardType=${item.boardType }&iboardNo=${item.boardNo }">${item.boardTitle }</a></td>
	                            <td>
								    <a href="/dislike.tp?boardNo=${item.boardNo }&boardType=${item.boardType }&userId=${item.userId }"><p>X</p></a>
	                            </td>
	                            <td><a href="javascript:void(0)" onclick="deleteCheck(${item.likeNo} )">X</a></td>
	                        </tr>
							</c:forEach>                        
                        </tbody>
	                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
	                    <ul class="pagination">
	                    <!-- 이전 -->
	                    <c:if test="${pInfo.startNavi != 1 }">
	                    	<c:url var="prevUrl" value="/inquiry/list.tp">
								<c:param name="page" value="${pInfo.startNavi - 1 }"></c:param>	                        
		                        <li class="page-item"><a class="page-link" href="${prevUrl }"><</a></li>
	                    	</c:url>
	                    </c:if>
						<!-- 페이지 네비 -->
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/inquiry/list.tp?userId=${userId }">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a class="page-link" href="${pageUrl }">${p }</a>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${pInfo.startNavi != 1 }">
							<c:url var="nextUrl" value="/inquiry/list.tp">
								<c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
							</c:url>
							<a href="${nextUrl }">></a>
						</c:if>
	                </nav>
                </div>
            </div>
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
        
            function deleteCheck(likeNo) {

                // AJAX 요청 보내기
                $.ajax({
                    type: "POST",
                    url: "/user/likeDelete.tp",
                    data: {
                    	ilkeNo: ilkeNo
                    },
                    success: function (data) {
                        if (data.success) {
        					if (confirm("정말 삭제하시겠습니까?")) {
        						const boardType = data.boardType;
        		                const boardNo = data.boardNo;
				                $.ajax({
				                    method: "POST",
				                    url: "/community/dislike.tp",
				                    data: {
				                    	likeNo: likeNo,
				                        boardType: boardType,
				                        boardNo: boardNo
				                    },
				                    success: function (data) {
				                        if (data.success) {
				                            location.reload();
				                        } else {
				                        	alert("좋아요 취소를 실패하였습니다.");
				                        }
				                    },
				                    error: function () {
				                    	console.error("서버 요청에 실패했습니다. 상태 코드: " + status);
				                        console.error("에러 내용: " + error);
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