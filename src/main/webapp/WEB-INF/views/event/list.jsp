<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">	
		<title>이벤트 리스트</title>
		<link rel="stylesheet" href="../resources/css/event/eventlist.css" />
		<link rel="stylesheet" href="../resources/css/event/eventfont.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	</head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp" />
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp" />
        
        <!-- 메인 -->
        <main>
            <div class="leftBox">
                <div class="ListTitle">
                    <span style="font-size: 24px; font-weight: bold">#전체</span>

	                    <button style="float: right" onClick="eventRegGo();">관리자글등록</button>
                </div>
                <div class="totalCheck">
                    <b>총<span id="totalCount">${totalCount }</span>건</b>
                    <ul style="float: right">
                        <li>최신순</li>
                        <li>인기순</li>
                        <li>조회순</li>
                    </ul>
                </div>
                <!-- 리스트출력 -->
                <div class="list">
                    <ul>
                    <c:forEach items="${eList}" var="event" >
                        <li>
                            <div class="photo">
                                <a href="/event/detail.tp?eventNo=${event.eventNo }">
                           			<c:if test="${!empty event.eventFileName }">
										<img alt="첨부파일" src="../resources/euploadFiles/${event.eventFileRename }"  style="max-width: 100%; height: auto;">
									</c:if>
                                </a>
                            </div>
                            <div class="area">
                                <div class="areaTitle"><a href="/event/detail.tp?eventNo=${event.eventNo }">${event.eventTitle }</a></div>
                                <p>${event.eventStartDate } ~ ${event.eventEndDate }</p>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="navi">
                    <ul>
	                    <li>
                    		<c:if test="${pageInfo.startNavi != 1 }">
                    			<c:url var="pageUrl" value="/event/list.tp">
                    				<c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
                    			</c:url>
                    			<a href="${pageUrl }">이전</a>
                    		</c:if>
	                    	<c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
	                    		<c:url var="pageUrl" value="/event/list.tp">
	                    			<c:param name="page" value="${p }"></c:param>
	                    		</c:url>
	                    		<a href="${pageUrl }">${p }</a>
	                    	</c:forEach>
	                    	<c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
	                    		<c:url var="pageUrl" value="/event/list.tp">
	                    			<c:param name="page" value="${pageInfo.endNavi +1 }"></c:param>
	                    		</c:url>
	                    		<a href="${pageUrl }">다음</a>
	                    	</c:if>
	                    </li>
                    </ul>
                </div>
            </div>
            <div class="rightBox">
                <div class="selectTag">
                    <button style="float: right">새고</button>
                    <ul>
                        <li>
                 			<c:url var="eventUrl" value="/event/list.tp">
                   				<c:param name="eventCondition" value="IngEvent"></c:param>
                   			</c:url>
                   			<a href="${eventUrl }">#진행중인 이벤트</a>
                       	</li><br>
                        <li>
							<c:url var="eventUrl" value="/event/list.tp">
								<c:param name="eventCondition" value="EndEvent"></c:param>
							</c:url>
	              			<a href="${eventUrl }">#종료된 이벤트</a>
                        </li>
                    </ul>
                </div>
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
    </body>
</html>