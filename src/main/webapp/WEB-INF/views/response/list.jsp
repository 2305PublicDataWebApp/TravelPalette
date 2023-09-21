<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>회원 문의 내역 목록</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/inquiryList.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<link rel="stylesheet" href="../resources/css/admin/responseList.css">
		</head>
		
	<body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>   
           	
        <div class="container">
            <h1 style="text-align: center; margin-top: 50px;">회원 문의 내역 목록</h1>
            <div class="w-line"></div>
                <table class="table table-bordered text-center">
                    <thead class="table-light">
                        <tr>
                        	<th>아이디</th>
                            <th>문의일</th>
                            <th>제목</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
						<c:forEach items="${inqList}" var="item">
	                        <tr id="sample">
	                        	<td>${item.userId }</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${item.inquiryCreateDate}" />
								</td>
	                            <td><a href="/admin/responsedetail.tp?inquiryNo=${item.inquiryNo }">${item.inquiryTitle }</a></td>
	                            <td>
									<c:if test='${item.inquiryResponse.toString() eq "N" }'>
									    <p>X</p>
									</c:if>
									<c:if test='${item.inquiryResponse.toString() eq "Y" }'>
									    <p>답변 완료</p>
									</c:if>
	                            </td>
	                        </tr>
						</c:forEach>
                    </tbody>
                </table>
  				<div aria-label="Page navigation example">
                    <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
                   		<c:if test="${pageInfo.startNavi != 1 }">
                   			<c:url var="pageUrl" value="/admin/inquirylist.tp">
                   				<c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
                   			</c:url>
                    		<li class="page-item">
                    			<a style="color: black;" class="page-link"  href="${pageUrl }">이전</a>
                    		</li>
                   		</c:if>
                    	<c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
                    		<c:url var="pageUrl" value="/admin/inquirylist.tp">
                    			<c:param name="page" value="${p }"></c:param>
                    		</c:url>
                    		<li class="page-item">
                    			<a style="color: black;" class="page-link" href="${pageUrl }">${p }</a>
                    		</li>
                    	</c:forEach>
                    	<c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
                    		<c:url var="pageUrl" value="/admin/inquirylist.tp">
                    			<c:param name="page" value="${pageInfo.endNavi +1 }"></c:param>
                    		</c:url>
	                   		<li class="page-item">
	                    		<a style="color: black;" class="page-link"  href="${pageUrl }">다음</a>
		                    </li>
                    	</c:if>
                    </ul>
                </div>
        	</div>

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