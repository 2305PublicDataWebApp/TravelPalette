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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>        
        <main>
        	<c:if test="${userId eq 'admin' }">
        		<div style="height: 30px; margin-top: 20px;">
		        	<button style="float:right" onClick="travelDeleteGo(${travel.travelNo});">관리자글삭제</button>
		        	<button style="float:right; margin-right: 10px;" onClick="travelModifyGo(${travel.travelNo});">관리자글수정</button>
        		</div>
	        </c:if>
        	<div id="detailTop">
	            <div>
	                <h1 style="margin-top: 50px">${travel.travelName}</h1>
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
                        <li>
	                        <label>홈페이지</label>
	                        <c:if test="${travel.travelUrl ne null}">
	                        	<span><a href="${travel.travelUrl}" target="_blank">${travel.travelUrl}</a></span></li>
	                        </c:if>
	                        <c:if test="${travel.travelUrl eq null}"><span>없음</span></c:if>
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
                		<span style="padding-right:15px;">#${tags }</span>
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
					<input type="hidden" name="userId" value="${sessionScope.userId }" >
	                    <div class="reviewRegister">
	                        <div class="starRating">
	                            <input type="radio" name="reviewRating" value="5" id="rate1" onclick="selectedRating(5);"><label for="rate1">★</label>
	                            <input type="radio" name="reviewRating" value="4" id="rate2" onclick="selectedRating(4);"><label for="rate2">★</label>
	                            <input type="radio" name="reviewRating" value="3" id="rate3" onclick="selectedRating(3);"><label for="rate3">★</label>
	                            <input type="radio" name="reviewRating" value="2" id="rate4" onclick="selectedRating(2);"><label for="rate4">★</label>
	                            <input type="radio" name="reviewRating" value="1" id="rate5" onclick="selectedRating(1);"><label for="rate5">★</label>
	                            <span id="selectedRating">0</span>
	                        </div>
	                        <div class="reviewContent">
	                            <textarea name="reviewContent" placeholder="리뷰를 작성해주세요."></textarea>
	                            <button type="submit">등록하기</button>
	                        </div>
	                    </div>
					</form>	
				</c:if>
               	<c:if test="${myReview ne null}">
                   <div class="myReview">
                       <div class="myStarRating">
                           <span id="selectedRating">${myReview.reviewRating }</span>
                           <label>
							    <script>
							        var myRating = parseInt("${myReview.reviewRating}");
							        for (var i = 1; i <= 5; i++) {
							            if (i <= myRating) {
							                document.write('<span style="color: rgba(250, 208, 0, 0.99);">★</span>');
							            } else {
							                document.write("★");
							            }
							        }
							    </script>
							</label>
                       </div>
                       <div class="myReviewContent">
                           <textarea readonly>${myReview.reviewContent }</textarea>
                           <c:url var="delReviewUrl" value="/review/delete.tp">
								<c:param name="reviewNo" value="${myReview.reviewNo }"></c:param>
								<c:param name="userId" value="${myReview.userId }"></c:param>
								<c:param name="travelNo" value="${myReview.travelNo }"></c:param>
							</c:url>
                           <a href="javascript:void(0);" onclick="deleteReview('${delReviewUrl}');">삭제하기</a>
                       </div>
                       <div class="myReviewReg">
                           <span>${myReview.reviewCreateDate }</span>
                           <span style="padding-left: 10px;">${myReview.userId }</span>
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
	                                <span>${review.userId }</span>
	                            </div>
	                        </li>      
	                    </c:forEach>	
                    </ul>
                </div>
            </div>
            <div class="reviewNav">
                <ul>
	                <c:if test="${reviewPageInfo ne null }">
	                    <c:if test="${reviewPageInfo.startNavi != 1 }">
	                  			<c:url var="prevUrl" value="/travel/detail.tp">
	                  				<c:param name="page" value="${reviewPageInfo.startNavi -1 }"></c:param>
	                  				<c:param name="travelNo" value="${travel.travelNo}"/>
	                  			</c:url>
	                  			<a href="${prevUrl }">이전</a>
	                  		</c:if>
	                   	<c:forEach begin="${reviewPageInfo.startNavi}" end="${reviewPageInfo.endNavi}" var="p">
	                   		<c:url var="pageUrl" value="/travel/detail.tp">
	                   			<c:param name="page" value="${p }"></c:param>
	                   			<c:param name="travelNo" value="${travel.travelNo}"/>
	                   		</c:url>
	                   		<a href="${pageUrl }">${p }</a>
	                   	</c:forEach>
	                   	<c:if test="${reviewPageInfo.endNavi != reviewPageInfo.naviTotalCount }">
	                   		<c:url var="nextUrl" value="/travel/detail.tp">
	                   			<c:param name="page" value="${reviewPageInfo.endNavi +1 }"></c:param>
	                   			<c:param name="travelNo" value="${travel.travelNo}"/>
	                   		</c:url>
	                   		<a href="${nextUrl }">다음</a>
	                   	</c:if>
	                </c:if>
                </ul>
            </div>
            <form id="likeDislikeForm" action="/travel/like.tp" method="POST">
	            <div class="infoLike">
	            <input type="hidden" name="userId" value="${sessionScope.userId}">
	                <h3>여행정보가 마음에 드시나요?</h3>
	                <p>더 좋은 여행정보를 위해 소중한 평가 부탁드립니다.</p>
	                <hr />
	                <div class="likeDislike">
	                    <div class="like">
	                        <label for="infoLikBtn">😊 도움이 됐어요</label>
	                        <input type="radio" id="infoLikBtn" name="like" value="like"> 
	                    </div>
	                    <div class="dislike">
	                        <label for="infoDislikBtn">😒 별로예요</label>
	                        <input type="radio" id="infoDislikBtn" name="like" value="dislike"> 
	                    </div>
	                </div>
	            </div>
            </form>
        </main>
    </body>
    <!-- 푸터 -->
    <jsp:include page="/include/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d52709ffacc68e58aa4c5df1743f8ea&libraries=services" ></script>
    <script>
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
    	// ================ 지도시작 ================
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${travel.travelAddr}', function(result, status) {
		    // 정상적으로 검색이 완료됐으면
		    if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		     // 이미지 지도를 생성한다
		        var staticMapContainer = document.getElementById('map'); // 이미지 지도를 표시할 div
		        var staticMapOption = {
		            marker: {
		                text: '${travel.travelName}', // 마커와 함께 표시할 텍스트
		                position: coords // 좌표를 직접 전달
		            },
		            center: coords, // 이미지 지도의 중심 좌표
		            level: 4, // 이미지 지도의 확대 레벨
		            mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
		        };
		        // 이미지 지도를 생성한다
		        var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		    }
		});
		
		// ================ 지도 종료 ================
        
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
	        const userId = "${sessionScope.userId}"; 
	        const selectedRating = document.querySelector('input[name="reviewRating"]:checked');
	        const reviewContent = document.querySelector('textarea[name="reviewContent"]').value.trim();
	        // 별점이 선택되지 않은 경우
	        if (!selectedRating) {
	            alert("별점을 선택하세요.");
	            return false;
	        }
	        // 리뷰 내용이 없는 경우
	        if (reviewContent === "") {
	            alert("리뷰 내용을 작성하세요.");
	            return false;
	        }
	        // 로그인하지 않은 경우
	        if (!userId) {
	            alert("로그인 후 이용해 주세요.");
	            window.location.href = "/user/login.tp"; 
	            return false;
	        }
	        const confirmed = confirm("리뷰를 등록하시겠습니까?");
	        return confirmed;
	    }
		
		function selectedRating(rating) {
			var selectedRating = rating;
			document.getElementById('selectedRating').innerText = selectedRating;
		}
		
		function deleteReview(url) {
			const userId = "${sessionScope.userId}";
			const reviewWriter = "${myReview.userId}";
			if(userId == reviewWriter) {
				if(confirm("리뷰를 삭제하시겠습니까? 삭제 후에는 복구가 불가합니다.")) {
					location.href = url;				
				}				
			} else {
				alert("작성자만 삭제할 수 있습니다.");
			}
		}
		// 스크롤 이벤트 리스너 추가
		window.addEventListener("scroll", function () {
		    const detailTop = document.getElementById("detailTop");
		    const menuTab = detailTop.querySelector(".menuTab");

		    // 현재 스크롤 위치
		    const scrollY = window.scrollY;

		    // detailTop의 top 위치
		    const detailTopTop = detailTop.offsetTop;

		    if (scrollY >= detailTopTop) {
		        menuTab.classList.add("fixed");
		    } else {
		        menuTab.classList.remove("fixed");
		    }
		});
		
		// 페이지 로드 시 스크롤 이벤트 리스너를 등록하여 고정 메뉴 동작 추가
        window.addEventListener("load", function () {
            const detailTop = document.getElementById("detailTop");
            const detailTopTop = detailTop.offsetTop;

            function handleScroll() {
                if (window.pageYOffset >= detailTopTop) {
                    detailTop.classList.add("fixed");
                } else {
                    detailTop.classList.remove("fixed");
                }
            }

            window.addEventListener("scroll", handleScroll);

            // 클릭 이벤트 리스너를 등록하여 메뉴 항목 클릭 시 해당 섹션으로 스크롤 이동
            const menuLinks = document.querySelectorAll(".menuTab ul li a");
            menuLinks.forEach(function (link) {
                link.addEventListener("click", function (e) {
                    e.preventDefault();
                    const targetId = link.getAttribute("href").substring(1);
                    const targetElement = document.getElementById(targetId);
                    window.scrollTo({
                        top: targetElement.offsetTop,
                        behavior: "smooth", // 부드러운 스크롤 효과 적용
                    });

                    // 스크롤 이동 후, detailTop 영역을 상단에 고정
                    detailTop.classList.add("fixed");
                });
            });
        });
		
        document.addEventListener("DOMContentLoaded", function () {
            const likeDislikeForm = document.getElementById("likeDislikeForm");
            
            // 라디오버튼이 클릭되었을 때 자동으로 폼 제출
            const radioButtons = document.querySelectorAll("input[type=radio]");
            radioButtons.forEach(function (radioButton) {
                radioButton.addEventListener("click", function () {
                    likeDislikeForm.submit(); // 폼 제출
                });
            });
        });
	</script>
</html>
