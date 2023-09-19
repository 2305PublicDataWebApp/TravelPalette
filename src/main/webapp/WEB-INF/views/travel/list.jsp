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
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <main>      	
            <div class="leftBox">
                <div class="ListTitle">
                	<c:if test="${userId eq 'admin' }">
	    				<button style="float: right" onClick="travelRegGo();">관리자글등록</button><br>
                	</c:if>
                    <p style="font-size: 24px; font-weight: bold">#전체</p>
                </div>
                <div class="totalCheck">
                    <b>총<span id="totalCount">${totalCount }</span>건</b>
                    <ul style="float: right">
                        <li><a href="/travel/list.tp?order=latest">최신순</a></li>
        				<li><a href="/travel/list.tp?order=views">조회순</a></li>
        				<li><a href="/travel/list.tp?order=popular">인기순</a></li>
                    </ul>
                </div>
                <!-- 리스트출력 -->
                <div class="list">
                    <ul>
                    <c:forEach items="${tList}" var="travel" >
                        <li>
                            <div class="photo">
                            	<img src="../resources/tUploadFiles/${travel.travelFileRename}" style="width: 130px; height: 90px;">
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
	                    	<c:if test="${pageInfo ne null }">
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
	                    	</c:if>
	                    </li>
                    </ul>
                </div>
            </div>
            <div class="rightBox">
                <div class="selectTag">
                    <span style="font-size: 24px; font-weight: bold">지역</span>
                    <button style="float: right">새고</button>
                    <ul id="regionList">
                        <li><a href="#">#전체</a></li>
                    </ul>
                </div>
                <div class="selectTag">
                    <span style="font-size: 24px; font-weight: bold">테마</span>
                    <button style="float: right">새고</button>
                    <ul id="keywordList">
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
			

	    // 지역 목록 생성
	    const regions = ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "경북", "경남", "전북", "전남", "제주"];
	    const regionList = document.getElementById("regionList");
	
	    regions.forEach(region => {
	        const listItem = document.createElement("li");
	        const link = document.createElement("a");
	        link.href = "/travel/list.tp?region=" + encodeURIComponent("#" + region);
	        link.textContent = "#" + region;
	        listItem.appendChild(link);
	        regionList.appendChild(listItem);
	    });
		</script>
    </body>
</html>
