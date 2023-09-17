<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>이벤트 게시판 작성</title>
        <link rel="stylesheet" href="/resources/css/event/Enroll.css">
    </head>
    <body>
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
    </body>
</html>