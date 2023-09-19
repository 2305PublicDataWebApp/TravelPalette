<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>이벤트 게시판 작성</title>
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
        <main>
	        <h1>이벤트 게시판 작성</h1>
	        <form action="/event/insert.tp" method="post" enctype="multipart/form-data">
	            <ul>
	                <li>
	                    <label for="eventTitle"><h4>제목</h4></label>
	                    <input type="text" name="eventTitle" id="eventTitle">
	                </li>
	                <li>
	                    <label for="eventStartDate"><h4>이벤트 시작날짜</h4></label>
	                    <input type="date" name="eventStartDate" id="eventStartDate">
	                </li>
	                <li>
	                    <label for="eventEndDate"><h4>이벤트 종료날짜</h4></label>
	                    <input type="date" name="eventEndDate" id="eventEndDate">
	                </li>
	                <li>
	                    <label for="eventPrecautions"><h4>이벤트 유의사항</h4></label>
	                    <textarea rows="4" cols="50" id="eventPrecautions" name="eventPrecautions"></textarea>
	                </li>
	                <li>
	                    <label for="eventInquiries"><h4>이벤트 문의</h4></label>
	                    <textarea rows="4" cols="50" id="eventInquiries" name="eventInquiries"></textarea>
	                </li>
					<li>
						<label>첨부파일</label>
						<!-- String으로 받을 수 없고 변환 작업이 필요 -->
						<input type="file" name="uploadFile">
					</li>
	            </ul>
	            <div class="button-container">
	                <input type="submit" value="등록">
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