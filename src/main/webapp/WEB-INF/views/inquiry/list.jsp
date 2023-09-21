<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>문의 내역</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/inquiryList.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		</head>
	<body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>      	
        <div class="container">
            <p style="padding: 20px;margin-top: 20px;font-size: 30px;font-family: 'KCC-Ganpan';">1:1 문의 내역</p>
            <div class="w-line" style="margin-bottom: 30px;"></div>
            <div>
                <span style="font-family: 'SUITE-Regular';font-weight: 600;padding: 20px 10px;">${sessionScope.userNickname }님의 문의 내역입니다</span>
                <table class="table table-bordered text-center" style="margin-top: 30px;">
                    <thead class="table-light">
                        <tr>
                            <th>문의일</th>
                            <th>제목</th>
                            <th>답변여부</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider" style="font-family: 'HakgyoansimWoojuR';">
<%--                         <fmt:formatDate pattern="yyyy-MM-dd" value="${iList.inquiryCreateDate }"/> --%>
						<c:forEach items="${iList}" var="item">
                        <tr id="sample">
<%-- 						    <c:out value="${item.inquiryCreateDate.toString()}" /> --%>
							<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${item.inquiryCreateDate}" />
							</td>
                            <td><a href="/inquiry/detail.tp?inquiryNo=${item.inquiryNo }">${item.inquiryTitle }</a></td>
                            <td>
							<c:if test='${item.inquiryResponse.toString() eq "N" }'>
							    <p>X</p>
							</c:if>
							<c:if test='${item.inquiryResponse.toString() eq "Y" }'>
							    <p>답변 완료</p>
							</c:if>
                            </td>
                            <td><a href="javascript:void(0)" onclick="deleteCheck(${item.inquiryNo})">X</a></td>
                        </tr>
						</c:forEach>
                            
                    </tbody>
                </table>
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
                <div class="d-flex justify-content-end">
                    <a href="/inquiry/insert.tp"><button class="btn btn-info" style="color: white;font-weight: 600;">문의글 작성</button></a>
                </div>
            </div>
        </div>		
        <div style="width: 100%;height: 100px;"></div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
			const deleteCheck = (inquiryNo) => {
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href = "/inquiry/delete.tp?inquiryNo="+inquiryNo;
				}
			}
		</script>
    </body>
</html>