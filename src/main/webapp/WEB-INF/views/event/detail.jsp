<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
</head>
<body>
	<h1>게시글 상세조회</h1><br>
	<ul>
		<li>
			<label for="">글번호</label>
			<span>${event.eventNo }</span>
		</li>
		<li>
			<label for="">작성일</label>
			<span><fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventCreateDate }"/></span>
		</li>
		<li>
			<label for="">제목</label>
			<span>${event.eventTitle }</span>
		</li>
		<li>
			<label for="">첨부파일</label>
			<p>
				<c:if test="${!empty event.eventFileName }">
					<img alt="첨부파일" src="../resources/buploadFiles/${event.eventFileRename }"  style="max-width: 100%; height: auto;">
					<a href="../resources/buploadFiles/${event.eventFileRename }" download>${event.eventFileName }</a>
				</c:if>
				<c:if test="${empty event.eventFileName }">X</c:if>
			</p>
		</li>
	</ul>
	<a href="/event/list.tp">목록으로 이동</a>
</body>
</html>