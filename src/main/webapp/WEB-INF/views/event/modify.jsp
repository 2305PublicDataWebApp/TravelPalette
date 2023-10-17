<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>이벤트 게시판 수정</title>
        <link rel="stylesheet" href="../resources/css/event/enroll.css">
        <link rel="stylesheet" href="../resources/css/event/eventfont.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <!-- 메인 -->
        <main class="eventContent">
	        <h1>이벤트 게시판 수정</h1>
	        <form action="/event/modify.tp" method="post" enctype="multipart/form-data">
	   			<!-- 수정할 때, 리다이렉트 될 때 사용 -->
				<input type="hidden" name="eventNo" value="${event.eventNo }">
				<!-- 기존 업로드 파일 체크할 때 사용 -->
				<input type="hidden" name="eventFileName" 		value="${event.eventFileName }">
				<input type="hidden" name="eventFileRename" 	value="${event.eventFileRename }">
				<input type="hidden" name="eventFilePath" 		value="${event.eventFilePath }">
				<input type="hidden" name="eventFileLength" 	value="${event.eventFileLength }">
	            <ul>
	                <li>
	                    <label for="eventTitle"><h4>제목</h4></label><br>
	                    <input type="text" name="eventTitle" id="eventTitle" value="${event.eventTitle}" >
	                </li>
	                <li>
	                    <label for="eventStartDate"><h4>이벤트 시작날짜 : </h4></label>&nbsp;
	                    <input type="date" name="eventStartDate" id="eventStartDate" value="${event.eventStartDate}">
	                </li>
	                <li>
	                    <label for="eventEndDate"><h4>이벤트 종료날짜 : </h4></label>&nbsp;
	                    <input type="date" name="eventEndDate" id="eventEndDate" value="${event.eventEndDate }">
	                </li>
	                <li>
	                    <label for="eventPrecautions"><h4>이벤트 유의사항</h4></label>
	                    <textarea rows="4" cols="50" id="eventPrecautions" name="eventPrecautions">${event.eventPrecautions }</textarea>
	                </li>
	                <li>
	                    <label for="eventInquiries"><h4>이벤트 문의</h4></label>
	                    <textarea rows="4" cols="50" id="eventInquiries" name="eventInquiries">${event.eventInquiries }</textarea>
	                </li>
   	                <li>
	                    <label for="eventMoveUrl"><h4>연결페이지</h4></label><br>
	                    <input type="text" name="eventMoveUrl" id="eventMoveUrl" value="${event.eventMoveUrl }">
	                </li>
					<li>
						<label>첨부파일</label>
						<!-- String으로 받을 수 없고 변환 작업이 필요 -->
						<c:if test="${!empty event.eventFileName }">
							<img alt="첨부파일" src="../resources/euploadFiles/${event.eventFileRename }">
							<a href="../resources/nuploadFiles/${event.eventFileRename }" download>${event.eventFileName }</a>
						</c:if>
						<input type="file" name="uploadFile">
					</li>
	            </ul>
	            <div class="button-container">
	                <input type="submit" value="수정">
	                <input type="reset" value="초기화">
	            </div>
	        </form>
	        </main>
        
		<!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        
        <script>
        	<jsp:include page="/include/navjs.jsp"></jsp:include>
        </script>
    </body>
</html>