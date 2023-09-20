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
        <link rel="stylesheet" href="../resources/css/community/travelcertify.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 100%; height: 135px;">
                <h2 style="font-family: 'TmoneyRoundWindExtraBold'; font-size: 28px; padding: 20px; margin-top: 30px; float: left;">여행 인증 게시판</h2>
                <form action="/community/searchcertify.tp" method="get">
                	<div class="input-group" style="width: 600px;float: right;margin-top: 90px;">
                		<input type="hidden" name="boardType" value="${pInfo.boardType }">
	                    <select name="searchCondition" class="form-select" aria-label="Default select example" style="margin-right: 8px;border: 1px solid #adb5bd;">
	                        <option value="all" <c:if test="${paraMap.searchCondition eq 'all'}">selected</c:if>>전체</option>
	                        <option value="title" <c:if test="${paraMap.searchCondition eq 'title'}">selected</c:if>>제목</option>
	                        <option value="nickName" <c:if test="${paraMap.searchCondition eq 'nickName'}">selected</c:if>>닉네임</option>
	                      </select>
	                    <input name="searchKeyword" style="width: 200px;border: 1px solid #adb5bd;" class="form-control me-2" type="search" 
	                    placeholder="검색어를 입력해주세요." aria-label="Search" value="${paraMap.searchKeyword}">
	                    <button class="btn btn-outline-success" style="border-bottom-right-radius: 5px;border-top-right-radius: 5px;z-index: 1;width: 80px;" type="submit" >Search</button>
                	</div>
               	</form>
                <div style="width: 100%;float: left;border-top: 1px solid #ccc;margin-top: 15px;padding: 10px 0px">
                    <p style="float:left;font-size: 18px;margin: 0;padding: 5px;font-weight: 600;font-family: 'SUITE-Regular';letter-spacing: 2px;padding-left: 15px;"># ${pInfo.totalCount }건</p>
                    <button id="goInsertBoardPage" type="button" style="float: right;" class="btn btn-primary">글 등록</button>
<!--                     <p style="margin: 0;padding: 7px 13px 0px 8px;margin-left: 3px;float: right;"> -->
<%--                         <c:if test="${sortType eq 'no' }"> --%>
<!--                     		<a href="/community/certify.tp" style="text-decoration:underline;">최신순 </a>| -->
<!--                	        	<a href="/community/certify.tp?sortType=likeDESC">추천순</a> -->
<%--                     	</c:if> --%>
<%--                	        <c:if test="${sortType ne 'no' }"> --%>
<!--                	        	<a href="/community/certify.tp">최신순 </a>| -->
<!-- 	                        <a href="/community/certify.tp?sortType=likeDESC" style="text-decoration:underline;">추천순</a>  -->
<%--                     	</c:if> --%>
<!--                     </p> -->
                </div>
            </div>
            <table class="table" style="text-align: center;margin:0;margin-top: 5px;">
                <thead>
                  <tr class="table" style="border-bottom: 2px solid #ccc;">
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="community" items="${cList}" varStatus="i">
                        <tr>
		                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
		                        <div class="card" style="width: 200px;height: 120px;overflow: hidden">
		                    		<div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
		                        </div>
		                    </td >
		                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
	                            <c:url var="detailUrl" value="/community/detail.tp">
	                                <c:param name="boardNo" value="${community.boardNo }"></c:param>
	                                <c:param name="boardType" value="${community.boardType }"></c:param>
	                            </c:url>
		                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">
		                            <a href="${detailUrl}">${community.boardTitle}</a>
		                        </h4> 
		                        <br>
		                        닉네임 : ${community.userNickname }<br>
		                        작성날짜 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${community.boardCreateDate }" />
		                    </td>
		                    <td style="width: 100px;">
		                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
		                        <div>
		                            <span style="font-size: 20px;font-weight: 600;">${community.likeNo }</span>
		                        </div>
		                    </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        	<div aria-label="Page navigation example">
                <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
                    <c:if test="${pInfo.startNavi ne 1}">
                        <c:url var="bPageUrl" value="/community/searchcertify.tp">
                        	<c:param name="searchCondition" value="${paramap.searchCondition}"></c:param>
                        	<c:param name="searchKeyword" value="${paramap.searchKeyword}"></c:param>
                        	<c:param name="boardType" value="${pInfo.boardType}"></c:param>
                            <c:param name="page" value="${pInfo.startNavi-1}"></c:param>
                        </c:url>
                        <li class="page-item">
                            <a style="color: black;" class="page-link" href="${bPageUrl}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
                        <c:url var="pageUrl" value="/community/searchcertify.tp">
                        	<c:param name="searchCondition" value="${paramap.searchCondition}"></c:param>
                        	<c:param name="searchKeyword" value="${paramap.searchKeyword}"></c:param>
                        	<c:param name="boardType" value="${pInfo.boardType}"></c:param>
                            <c:param name="page" value="${p}"></c:param>
                        </c:url>
                        <li class="page-item">
                            <a style="color: black;" class="page-link" href="${pageUrl}">${p}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount}">
                        <c:url var="nPageUrl" value="/community/searchcertify.tp">
                        	<c:param name="searchCondition" value="${paramap.searchCondition}"></c:param>
                        	<c:param name="searchKeyword" value="${paramap.searchKeyword}"></c:param>
                        	<c:param name="boardType" value="${pInfo.boardType}"></c:param>
                            <c:param name="page" value="${pInfo.endNavi+1}"></c:param>
                        </c:url>
                        <li class="page-item">
                            <a style="color: black;" class="page-link" href="${nPageUrl}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </main>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script>
        	<jsp:include page="/include/navjs.jsp"></jsp:include>
			
        	document.getElementById("goInsertBoardPage").addEventListener("click", function() {
                location.href= "/community/insert.tp";
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>