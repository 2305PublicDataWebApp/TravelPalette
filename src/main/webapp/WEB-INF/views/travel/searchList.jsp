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
        <link rel="stylesheet" href="../resources/css/travel/searchList.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <main>      	
           <div class="ListTitle">
           	<c:if test="${userId eq 'admin' }">
				<button style="float: right" onClick="travelRegGo();">관리자글등록</button><br>
           	</c:if>
               <span class="searchTitle">검색결과</span><span class="searchTitle searchColor">#${searchKeyword}</span>
               <br>
           </div>
           <div class="totalCheck" style="font-size: 20px;">
               <b>총<span class="searchColor">${totalCount }</span>건</b>
               <ul style="float: right;">
                   <li><a href="/travel/search.tp?order=latest&searchKeyword=${searchKeyword}">최신순</a></li>
   				<li><a href="/travel/search.tp?order=views&searchKeyword=${searchKeyword}">조회순</a></li>
   				<li><a href="/travel/search.tp?order=popular&searchKeyword=${searchKeyword}">인기순</a></li>
               </ul>
           </div>
           <!-- 리스트출력 -->
           <div class="list">
               <ul>
               <c:forEach items="${sList}" var="search" >
                   <li>
                       <div class="photo" style="background-image: url('../resources/tUploadFiles/${search.travelFileRename}'); background-size: cover;">
                           <a href="/travel/detail.tp?travelNo=${search.travelNo }"></a>
                       </div>
                       <div class="area" style="font-family: 'SUITE-Regular';">
                           <div class="areaTitle"><a href="/travel/detail.tp?travelNo=${search.travelNo }">${search.travelName }</a></div>
                           <div class="areaAddr">${search.travelAddr }</div>
                           <div class="areaTag">
                           	<c:set var="tagsString" value="${search.travelTags}" />
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
           <div class="navi">
               <ul>
                <li>
                	<c:if test="${searchPInfo ne null }">
                		<c:if test="${searchPInfo.startNavi != 1 }">
                			<c:url var="pageUrl" value="/travel/search.tp">
                				<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
                				<c:param name="page" value="${searchPInfo.startNavi -1 }"></c:param>
                			</c:url>
                			<a href="${pageUrl }">이전</a>
                		</c:if>
                 	<c:forEach begin="${searchPInfo.startNavi}" end="${searchPInfo.endNavi}" var="p">
                 		<c:url var="pageUrl" value="/travel/search.tp">
                 			<c:param name="page" value="${p }"></c:param>
                				<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
                 		</c:url>
                 		<a href="${pageUrl }">${p }</a>
                 	</c:forEach>
                 	<c:if test="${searchPInfo.endNavi != searchPInfo.naviTotalCount }">
                 		<c:url var="pageUrl" value="/travel/search.tp">
                				<c:param name="searchKeyword" value="${searchKeyword}"></c:param>
                 			<c:param name="page" value="${searchPInfo.endNavi +1 }"></c:param>
                 		</c:url>
                 		<a href="${pageUrl }">다음</a>
                 	</c:if>
                	</c:if>
                </li>
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
