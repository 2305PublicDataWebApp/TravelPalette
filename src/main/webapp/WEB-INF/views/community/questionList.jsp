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
        <link rel="stylesheet" href="../resources/css/community/questionList.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 100%; height: 135px;">
                <h2 style="font-family: 'TmoneyRoundWindExtraBold'; font-size: 28px; padding: 20px; margin-top: 30px; float: left;">
                    <c:if test="${pInfo.boardType eq 'QnABoard'}">                
                        질의문답 게시판
                    </c:if>
                    <c:if test="${pInfo.boardType eq 'travelCompanion'}">                
                        동행 구인 게시판
                    </c:if>
                </h2>
                <div class="input-group" style="width: 600px;float: right;margin-top: 90px;">
                    <select class="form-select" aria-label="Default select example" style="margin-right: 8px;border: 1px solid #adb5bd;">
                        <option selected>전체</option>
                        <option value="1">제목</option>
                        <option value="2">닉네임</option>
                      </select>
                    <input style="width: 200px;border: 1px solid #adb5bd;" class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
                    <button class="btn btn-outline-success" style="border-bottom-right-radius: 5px;border-top-right-radius: 5px;z-index: 1;width: 80px;" type="submit" >Search</button>
                </div>
                <div style="width: 100%;float: left;border-top: 1px solid #ccc;margin-top: 15px;padding: 10px 0px">
                    <p style="float:left;font-size: 18px;margin: 0;padding: 5px;font-weight: 600;font-family: 'SUITE-Regular';letter-spacing: 2px;padding-left: 15px;">#${pInfo.totalCount }건</p>
                    <button id="goInsertBoardPage" type="button" style="float: right;width: 80px;" class="btn btn-primary">글 등록</button>
                    <p style="margin: 0;padding: 7px 13px 0px 8px;margin-left: 3px;float: right;">
                        <a href="#">최신순 </a>|
                        <a href="#">추천순</a> 
                    </p>
                </div>
            </div>
            <table class="table" style="text-align: center;margin-top: 5px;">
                <thead>
                  <tr class="table" style="border-bottom: 2px solid #ccc;--bs-table-bg: rgba(224, 224, 224, 0.32);">
                    <th scope="col">글 번호</th>
                    <th scope="col" style="width: 500px;">제목</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">작성날짜</th>
                    <th scope="col">추천수</th>
                    <th scope="col">조회수</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="community" items="${cList}" varStatus="i">
                        <tr>
                            <th scope="row">${i.count }</th>
                            <c:url var="detailUrl" value="/community/detail.tp">
                                <c:param name="boardNo" value="${community.boardNo }"></c:param>
                                <c:param name="boardType" value="${community.boardType }"></c:param>
                            </c:url>
                            <td id="tr">
                                <a href="${detailUrl}">${community.boardTitle}</a>
                            </td>
                            <td class="tr">${community.userNickname }</td>
                            <td class="tr">
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${community.boardCreateDate }" />
                            </td>
                            <td>${community.likeNo}</td>
                            <td class="tr"> 
                                <fmt:formatNumber pattern="##,###,###" value="${community.viewCount}"></fmt:formatNumber>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div aria-label="Page navigation example">
                <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
                    <c:if test="${pInfo.startNavi ne 1}">
                        <c:url var="bPageUrl" value="/community/qList.tp">
                            <c:param name="page" value="${pInfo.startNavi-1}"></c:param>
                        </c:url>
                        <li class="page-item">
                            <a style="color: black;" class="page-link" href="${bPageUrl}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
                        <c:url var="pageUrl" value="/community/qList.tp">
                            <c:param name="page" value="${p}"></c:param>
                        </c:url>
                        <li class="page-item">
                            <a style="color: black;" class="page-link" href="${pageUrl}">${p}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount}">
                        <c:url var="nPageUrl" value="/community/qList.tp">
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