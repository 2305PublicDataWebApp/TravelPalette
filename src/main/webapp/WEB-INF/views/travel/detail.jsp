<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>상세페이지</title>
        <link rel="stylesheet" href="../resources/css/travel/detail.css" />
        <link rel="stylesheet" href="../resources/css/travel/header.css" />
        <link rel="stylesheet" href="../resources/css/travel/nav.css" />
        <link rel="stylesheet" href="../resources/css/travel/footer.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>        
        <main>
        	<c:if test="${userId eq 'admin' }">
	        	<button style="float:right" onClick="travelModifyGo(${travel.travelNo});">관리자글수정</button>
	        	<button style="float:right" onClick="travelDeleteGo(${travel.travelNo});">관리자글삭제</button>
	        </c:if>
        	<div>
	            <div>
	                <h1 style="padding: 20px">${travel.travelName}</h1>
	                <h4>${travel.travelAddr}</h4>
	                <div class="center">
	                    <div id="like"><span>💖</span><span style="padding-left:5px;]">12,345</span></div>
	                    <div id="view"><span>👀</span><span style="padding-left:5px;]">${travel.travelViewCount}</span></div>
	                </div>
	            </div>
	            <div class="menuTab fixed">
	                <ul>
	                    <li><a href="#photo">사진</a></li>
	                    <li><a href="#detailInfo">상세정보</a></li>
	                    <li><a href="#infoMap">지도</a></li>
	                    <li><a href="#review">리뷰</a></li>
	                </ul>
	            </div>
            </div>
            <div id="photo">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                    	<c:forEach var="file" items="${travelFiles}" varStatus="loop">
                			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${loop.index}" class="<c:if test='${loop.first}'>active</c:if>" aria-label="Slide ${loop.index + 1}"></button>
           				 </c:forEach>    
                    </div>
                    <div class="carousel-inner">
			            <c:forEach var="file" items="${travelFiles}" varStatus="loop">
			                <div class="carousel-item <c:if test='${loop.first}'>active</c:if>" data-bs-interval="4000">
			                    <img src="../resources/tUploadFiles/${file.travelFileRename}" class="d-block w-100" alt="<c:out value='${file.travelFileName}' />" />
			                </div>
			            </c:forEach>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>

            <div id="detailInfo">
                <h3>상세정보</h3>
                <hr />
                <p>
                	${travel.travelInfo}
                </p>
                <div id="infoList">
                    <ul>
                        <li><label>홈페이지</label><span><a href="${travel.travelUrl}" target="_blank">${travel.travelUrl}</a></span></li>
                        <li><label>주소</label><span>${travel.travelAddr}</span></li>
                        <li><label>연락처</label><span>${travel.travelTel}</span></li>
                        <li><label>이용시간</label><span>${travel.travelUsingTime}</span></li>
                        <li><label>휴일정보</label><span>${travel.travelHoliday}</span></li>
                        <li><label>주차정보</label><span>${travel.travelParking}</span></li>
                    </ul>
                </div>
                <div id="keyWord">
                	<c:set var="tagsString" value="${travel.travelTags}" />
                	<c:set var="tagArray" value="${fn:split(tagsString, ',')}" />
                	<c:forEach items="${tagArray }" var="tags" >
                		<span>${tags }</span>
                	</c:forEach>
                </div>
            </div>
            <div id="infoMap">
                <h3>지도</h3>
                <hr />
                <div>
                    <div id="map" style="width: 100%; height: 500px"></div>
                </div>
            </div>
            <div id="review">
                <h3>리뷰 평점 <span>0</span></h3>
                <hr />
               	<c:if test="${myReview eq null}">
					<form action="/review/insert.tp" method="POST" onsubmit="return confirmSubmit();">
					<input type="hidden" name="travelNo" value="${travel.travelNo}" >
					<!-- <input type="hidden" name="userNickname" value="TEST" > -->
	                    <div class="reviewRegister">
	                        <div class="starRating">
	                            <input type="radio" name="reviewRating" value="1" id="rate1" onclick="selectedRating(5);"><label for="rate1">★</label>
	                            <input type="radio" name="reviewRating" value="2" id="rate2" onclick="selectedRating(4);"><label for="rate2">★</label>
	                            <input type="radio" name="reviewRating" value="3" id="rate3" onclick="selectedRating(3);"><label for="rate3">★</label>
	                            <input type="radio" name="reviewRating" value="4" id="rate4" onclick="selectedRating(2);"><label for="rate4">★</label>
	                            <input type="radio" name="reviewRating" value="5" id="rate5" onclick="selectedRating(1);"><label for="rate5">★</label>
	                            <span id="selectedRating">0</span>
	                        </div>
	                        <div class="reviewContent">
	                        	<input type="text" name="userNickname">
	                            <textarea name="reviewContent" placeholder="리뷰를 작성해주세요."></textarea>
	                            <button type="submit">등록하기</button>
	                        </div>
	                    </div>
					</form>	
				</c:if>
               	<c:if test="${myReview ne null}">
                   <div class="myReview">
                       <div class="myStarRating">
                           <input type="radio" name="reviewRating" value="1" id="rate1" onclick="selectedRating(5);"><label for="rate1">★</label>
                           <input type="radio" name="reviewRating" value="2" id="rate2" onclick="selectedRating(4);"><label for="rate2">★</label>
                           <input type="radio" name="reviewRating" value="3" id="rate3" onclick="selectedRating(3);"><label for="rate3">★</label>
                           <input type="radio" name="reviewRating" value="4" id="rate4" onclick="selectedRating(2);"><label for="rate4">★</label>
                           <input type="radio" name="reviewRating" value="5" id="rate5" onclick="selectedRating(1);"><label for="rate5">★</label>
                           <span id="selectedRating">0</span>
                       </div>
                       <div class="myReviewContent">
                           <textarea readonly></textarea>
                           <button id="submitRating">삭제하기</button>
                       </div>
                       <div class="myReviewReg">
                           <span>2023-01-01</span>
                           <span style="padding-left: 10px;">닉네임</span>
                       </div>
                   </div>
				</c:if>
                <div class="reviewList">
                    <ul>
                    	<!-- 리뷰목록 -->
	                    <c:forEach items="${review }" var="review">
	                        <li>
	                            <div class="revStarRating">
	                                <label>
	                                	<script>
								            // JavaScript로 별의 개수를 동적으로 생성
								            var ratingValue = parseInt("${review.reviewRating}");
								            for (var i = 1; i <= 5; i++) {
								                if (i <= ratingValue) {
								                    document.write("★");
								                } else {
								                    document.write("☆");
								                }
								            }
							        	</script>
							        </label>
	                                <input type="hidden" value= "${review.reviewRating }">
	                            </div>
	                            <div class="reviewContent">
	                                <textarea>${review.reviewContent }</textarea>
	                            </div>
	                            <div class="reviewReg">
	                                <span><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewCreateDate }"/></span>
	                                <span>${review.userNickname }</span>
	                            </div>
	                        </li>      
	                    </c:forEach>	
                    </ul>
                </div>
            </div>
            <div class="reviewNav">
                <ul>
                    <c:if test="${reviewPageInfo.startNavi != 1 }">
                  			<c:url var="pageUrl" value="/travel/detail.tp">
                  				<c:param name="page" value="${reviewPageInfo.startNavi -1 }"></c:param>
                  				<c:param name="travelNo" value="${travel.travelNo}"/>
                  			</c:url>
                  			<a href="${pageUrl }">이전</a>
                  		</c:if>
                   	<c:forEach begin="${reviewPageInfo.startNavi}" end="${reviewPageInfo.endNavi}" var="p">
                   		<c:url var="pageUrl" value="/travel/detail.tp">
                   			<c:param name="page" value="${p }"></c:param>
                   			<c:param name="travelNo" value="${travel.travelNo}"/>
                   		</c:url>
                   		<a href="${pageUrl }">${p }</a>
                   	</c:forEach>
                   	<c:if test="${reviewPageInfo.endNavi != reviewPageInfo.naviTotalCount }">
                   		<c:url var="pageUrl" value="/travel/detail.tp">
                   			<c:param name="page" value="${reviewPageInfo.endNavi +1 }"></c:param>
                   			<c:param name="travelNo" value="${travel.travelNo}"/>
                   		</c:url>
                   		<a href="${pageUrl }">다음</a>
                   	</c:if>
                </ul>
            </div>
            <div class="infoLike">
                <h3>여행정보가 마음에 드시나요?</h3>
                <p>더 좋은 여행정보를 위해 소중한 평가 부탁드립니다.</p>
                <hr />
                <div class="likeDislike">
                    <div class="like">
                        <label for="infoLikBtn">😊</label><span>도움이 됐어요</span>
                        <input type="radio" id="infoLikBtn" name="like" value="infoLike"> 
                    </div>
                    <div class="like">
                        <label for="infoDislikBtn">😒</label><span>별로예요</span>
                        <input type="radio" id="infoDislikBtn" name="like" value="infoDislike"> 
                    </div>
                </div>
            </div>
        </main>
    </body>
    <!-- 푸터 -->
    <jsp:include page="/include/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d52709ffacc68e58aa4c5df1743f8ea"></script>
    <script>
        
        //지도 api
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56723, 126.98358), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);
        
		const travelNo = "${travel.travelNo}";
		
		function travelModifyGo(travelNo){
			location.href = "/travel/modify.tp?travelNo="+travelNo;
		}
		
		function travelDeleteGo(travelNo) {
			if (confirm("여행정보글을 삭제하시겠습니까?")) { 
		        location.href = "/travel/delete.tp?travelNo=" + travelNo;
		    }
		}
		
		function confirmSubmit() {
			const confirmed = confirm("리뷰를 등록하시겠습니까?");
			return confirmed;
		}
		
		function selectedRating(rating) {
			var selectedRating = rating;
			document.getElementById('selectedRating').innerText = selectedRating;
		}
		
	</script>
</html>
