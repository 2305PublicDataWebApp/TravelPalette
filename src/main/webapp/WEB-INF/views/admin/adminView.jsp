<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">	
		<title>회원 목록</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/community/questionList.css">
		
	</head>
	<body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp" />
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp" />
	
		<!-- 메인 -->
        <main>
			<h1>회원 목록</h1><br>
			<table>
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>성별</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>회원상태</th>
						<th>회원 탈퇴</th>
					</tr>
				</thead>
				<tbody>
				<!-- list데이터는 items에 넣었고 var에서 설정한 변수로 list 데이터에서
					 꺼낸 값을 사용하고 i의 값은 varStatus로 사용 -->
					<c:forEach var="admin" items="${aList}">
						<tr>
							<td>${admin.userId }</td>
							<td>${admin.userName }</td>
							<td>${admin.userNickname }</td>
							<td>${admin.userGender }</td>
							<td>${admin.userEmail }</td>
							<td>${admin.userTel }</td>
							<td>${admin.userEmailStatus }</td>
							<td><button>탈퇴</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div aria-label="Page navigation example">
			    <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
			   		<c:if test="${pageInfo.startNavi != 1 }">
			   			<c:url var="pageUrl" value="/admin/list.tp">
			   				<c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
			   			</c:url>
			    		<li class="page-item">
			    			<a style="color: black;" class="page-link"  href="${pageUrl }">이전</a>
			    		</li>
			   		</c:if>
			    	<c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
			    		<c:url var="pageUrl" value="/admin/list.tp">
			    			<c:param name="page" value="${p }"></c:param>
			    		</c:url>
			    		<li class="page-item">
			    			<a style="color: black;" class="page-link" href="${pageUrl }">${p }</a>
			    		</li>
			    	</c:forEach>
			    	<c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
			    		<c:url var="pageUrl" value="/admin/list.tp">
			    			<c:param name="page" value="${pageInfo.endNavi +1 }"></c:param>
			    		</c:url>
			    		<li class="page-item">
			     		<a style="color: black;" class="page-link"  href="${pageUrl }">다음</a>
			      </li>
			    	</c:if>
			    </ul>
			</div>
        </main>
			
		<!-- 푸터 -->
        <jsp:include page="/include/footer.jsp" />
		<script>
			<jsp:include page="/include/navjs.jsp"></jsp:include>
			function eventRegGo() {
				location.href = "/event/insert.tp";
            }
		</script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
			
	</body>
</html>