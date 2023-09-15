<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>여행리스트</title>
        <link rel="stylesheet" href="../resources/css/travel/list.css" />
        <link rel="stylesheet" href="../resources/css/travel/header.css" />
        <link rel="stylesheet" href="../resources/css/travel/nav.css" />
        <link rel="stylesheet" href="../resources/css/travel/footer.css" />
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <main>
            <div class="leftBox">
                <div class="ListTitle">
                    <span style="font-size: 24px; font-weight: bold">#전체</span>

	                    <button style="float: right" onClick="travelRegGo();">관리자글등록</button>
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
                    <c:forEach items="${tList}" var="travel" >
                        <li>
                            <div class="photo">
                                <a href="/travel/detail.tp?travelNo=${travel.travelNo }"></a>
                            </div>
                            <div class="area">
                                <div class="areaTitle"><a href="/travel/detail.tp?travelNo=${travel.travelNo }">${travel.travelName }</a></div>
                                <p>${travel.travelAddr }</p>
                                <div class="areaTag">
                                	<c:set var="tagsString" value="${travel.travelTags}" />
    								<c:set var="tagsArray" value="${fn:split(tagsString, ',')}" />
								    <c:forEach var="tag" items="${tagsArray}">
	                                    <span>${tag}</span>
								    </c:forEach>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="navi">
                    <ul>
	                    <li>
                    		<c:if test="${pageInfo.startNavi != 1 }">
                    			<c:url var="pageUrl" value="/travel/list.tp">
                    				<c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
                    			</c:url>
                    			<a href="${pageUrl }">이전</a>
                    		</c:if>
	                    	<c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
	                    		<c:url var="pageUrl" value="/travel/list.tp">
	                    			<c:param name="page" value="${p }"></c:param>
	                    		</c:url>
	                    		<a href="${pageUrl }">${p }</a>
	                    	</c:forEach>
	                    	<c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
	                    		<c:url var="pageUrl" value="/travel/list.tp">
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
                    <span style="font-size: 24px; font-weight: bold">지역</span>
                    <button style="float: right">새고</button>
                    <ul>
                        <li><a href="#">#전체</a></li>
                        <li><a href="#">#서울</a></li>
                        <li><a href="#">#부산</a></li>
                        <li><a href="#">#대구</a></li>
                        <li><a href="#">#인천</a></li>
                        <li><a href="#">#광주</a></li>
                        <li><a href="#">#대전</a></li>
                        <li><a href="#">#울산</a></li>
                        <li><a href="#">#세종</a></li>
                        <li><a href="#">#경기</a></li>
                        <li><a href="#">#강원</a></li>
                        <li><a href="#">#충북</a></li>
                        <li><a href="#">#충남</a></li>
                        <li><a href="#">#경북</a></li>
                        <li><a href="#">#경남</a></li>
                        <li><a href="#">#전북</a></li>
                        <li><a href="#">#전남</a></li>
                        <li><a href="#">#제주</a></li>
                    </ul>
                </div>
                <div class="selectTag">
                    <span style="font-size: 24px; font-weight: bold">테마</span>
                    <button style="float: right">새고</button>
                    <ul>
                        <li><a href="#">#전체</a></li>
                        <li><a href="#">#스포츠</a></li>
                        <li><a href="#">#동물</a></li>
                        <li><a href="#">#캠핑</a></li>
                        <li><a href="#">#한옥체험</a></li>
                        <li><a href="#">#문화시설</a></li>
                        <li><a href="#">#럭셔리</a></li>
                        <li><a href="#">#테마파크</a></li>
                        <li><a href="#">#실내여행지</a></li>
                        <li><a href="#">#유적지</a></li>
                        <li><a href="#">#쇼핑</a></li>
                        <li><a href="#">#자연여행</a></li>
                        <li><a href="#">#관광지</a></li>
                    </ul>
                </div>
            </div>
        </main>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
		<script>
			function travelRegGo() {
				location.href = "/travel/insert.tp";
            }
		</script>
    </body>
</html>
