<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>이벤트 상세</title>
		<link rel="stylesheet" href="../resources/css/event/eventfont.css">
		<link rel="stylesheet" href="../resources/css/event/eventdetail.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	</head>
	
	<body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <!-- 메인 -->
        <main>
			<div class="eventContent">
               	<c:if test="${userId eq 'admin' }">
                	<ul style="float: right">
						<li><button id="modifyButton" type="button">수정하기</button></li>
						<li><button id="deleteButton" type="button">삭제하기</button></li>
                	</ul>
				</c:if>
				<h1>${event.eventTitle }</h1><br>
				<c:if test="${!empty event.eventFileName }">
					<img alt="첨부파일" src="../resources/euploadFiles/${event.eventFileRename }"  style="width: 1000px; height: auto;">
				</c:if>
				<c:if test="${empty event.eventFileName }">더미 데이터라 사진이 없습니당!!</c:if>
				<c:if test="${!empty event.eventInquiries }">
					<div class="eventAdd">
						<table>
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td>이벤트 문의</td>
								<td>${event.eventInquiries }</td>
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test="${!empty event.eventPrecautions }">
					<div class="eventAdd">
						<table>
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td>이벤트 유의사항</td>
								<td>${event.eventPrecautions }</td>
							</tr>
						</table>
					</div>
				</c:if><br>
			</div>
        </main>
        
		<!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        
        <script>
        	<jsp:include page="/include/navjs.jsp"></jsp:include>
        	
        	// 수정하기
        	document.getElementById("modifyButton").addEventListener("click", function() {
            	if(confirm("게시물을 수정하시겠습니까?")){            		
                	location.href= "/event/modify.tp?eventNo=${event.eventNo }";
            	}
            });
        	
        	
        	// 삭제하기
        	document.getElementById("deleteButton").addEventListener("click", function() {
            	if(confirm("게시물을 삭제하시겠습니까?")){            		
                	location.href= "/event/delete.tp?eventNo=${event.eventNo}";
            	}
            });
        	
        	
        </script>
<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script> -->
	</body>
</html>