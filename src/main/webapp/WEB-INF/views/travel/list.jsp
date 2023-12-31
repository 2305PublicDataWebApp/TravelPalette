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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
	    				<button class="btn btn-light" style="float: right" onClick="travelRegGo();">관리자글등록</button><br>
                	</c:if>
                    <p class="searchTitle">#전체</p>
                </div>
                <div class="totalCheck" style="font-size: 20px; margin-top: 10px;">
                    <b>총<span class="searchColor">${totalCount }</span>건</b>
                    <ul style="float: right;">
                        <li><a href="/travel/list.tp?order=latest">최신순</a></li>
        				<li><a href="/travel/list.tp?order=views">조회순</a></li>
                    </ul>
                </div>
                <!-- 리스트출력 -->
                <div class="list">
                    <ul>
                    <c:forEach items="${tList}" var="travel" >
                        <li>
                            <div class="photo" style="background-image: url('../resources/tUploadFiles/${travel.travelFileRename}');">
                                <a href="/travel/detail.tp?travelNo=${travel.travelNo }"></a>
                            </div>
                            <div class="area" style="font-family: 'SUITE-Regular';">
                                <div class="areaTitle"><a href="/travel/detail.tp?travelNo=${travel.travelNo }">${travel.travelName }</a></div>
                                <div class="areaAddr">${travel.travelAddr }</div>
                                <div class="areaTag">
                                	<c:set var="tagsString" value="${travel.travelTags}" />
    								<c:set var="tagsArray" value="${fn:split(tagsString, ',')}" />
								    <c:forEach var="tag" items="${tagsArray}">
	                                    <span>#${tag}</span>
								    </c:forEach>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="rightBox">
                <div class="selectTag">
                    <span style="font-size: 24px; font-weight: bold">지역</span>
                    <ul id="regionList">
                        <li><a href="/travel/list.tp">#전체</a></li>
                    </ul>
                </div>
                <div class="selectTag">
                    <span style="font-size: 24px; font-weight: bold">테마</span>
                    <ul id="keywordList">
                        <li><a href="/travel/list.tp">#전체</a></li>
                    </ul>
                </div>
            </div>
            <div aria-label="Page navigation example">
                    <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
                    	<c:if test="${pageInfo ne null }">
                    		<c:if test="${pageInfo.startNavi != 1 }">
                    			<c:url var="pageUrl" value="/travel/list.tp">
                    				<c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
                    			</c:url>
			                    <li class="page-item">
	                    			<a style="color: black;" class="page-link" href="${pageUrl }">이전</a>
	                    		</li>
                    		</c:if>
	                    	<c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
	                    		<c:url var="pageUrl" value="/travel/list.tp">
	                    			<c:param name="page" value="${p }"></c:param>
	                    		</c:url>
	                    		<li class="page-item">
	                    			<a style="color: black;" class="page-link"  href="${pageUrl }">${p }</a>
	                    		</li>
	                    	</c:forEach>
	                    	<c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
	                    		<c:url var="pageUrl" value="/travel/list.tp">
	                    			<c:param name="page" value="${pageInfo.endNavi +1 }"></c:param>
	                    		</c:url>
	                    		<li class="page-item">
	                    			<a style="color: black;" class="page-link"  href="${pageUrl }">다음</a>
	                    		</li>
	                    	</c:if>
                    	</c:if>
                    </ul>
                </div>
        </main>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
		<script>
			<jsp:include page="/include/navjs.jsp"></jsp:include>
			
			function travelRegGo() {
				location.href = "/travel/insert.tp";
            }

		    // 지역 목록 생성
		    const regions = ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "경북", "경남", "전북", "전남", "제주"];
		    const regionList = document.getElementById("regionList");
		
		    regions.forEach(region => {
		        const listItem = document.createElement("li");
		        const link = document.createElement("a");
		        link.href = "/travel/search.tp?searchKeyword=" + encodeURIComponent(region);
		        link.textContent = "#"+region;
		        listItem.appendChild(link);
		        regionList.appendChild(listItem);
		    });
		    
		    const keywords = ["스포츠", "동물", "캠핑", "문화시설", "럭셔리", "테마파크", "실내여행지", "유적지", "쇼핑", "자연여행", "관광지"];
		    const keywordList = document.getElementById("keywordList");
		
		    keywords.forEach(keyword => {
		        const listItem = document.createElement("li");
		        const link = document.createElement("a");
		        link.href = "/travel/search.tp?searchKeyword=" + encodeURIComponent(keyword);
		        link.textContent = "#"+keyword;
		        listItem.appendChild(link);
		        keywordList.appendChild(listItem);
		    });

		    // 여행 이름을 처리하는 함수
		    function truncateTravelName() {
		        const travelNameElements = document.querySelectorAll(".areaTitle a");
		        travelNameElements.forEach(element => {
		            const originalName = element.textContent;
		            if (originalName.length > 10) {
		                element.textContent = originalName.slice(0, 30) + "...";
		            }
		        });
		    }

		    // 페이지 로드 후 실행
		    window.addEventListener("load", truncateTravelName);		
		</script>
    </body>
</html>
