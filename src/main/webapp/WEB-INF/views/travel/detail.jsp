<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
        />
    </head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <main>
            <div>
                <h1 style="padding: 20px">${travel.travelName}</h1>
                <h4>${travel.travelAddr}</h4>
                <div class="center">
                    <div id="like"><span>💖</span><span style="padding-left:5px;]">12,345</span></div>
                    <div id="view"><span>👀</span><span style="padding-left:5px;]">${travel.travelViewCount}</span></div>
                </div>
            </div>
            <div class="menuTab">
                <ul>
                    <li><a href="#">사진</a></li>
                    <li><a href="#">상세정보</a></li>
                    <li><a href="#">지도</a></li>
                    <li><a href="#">리뷰</a></li>
                </ul>
            </div>
            <div id="photo">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="4000">
                            <img src="../resources/images/travel/flower1.png" class="d-block w-100" alt="사진1" />
                        </div>
                        <div class="carousel-item" data-bs-interval="4000">
                            <img src="../resources/images/travel/flower2.png" class="d-block w-100" alt="사진2" />
                        </div>
                        <div class="carousel-item" data-bs-interval="4000">
                            <img src="../resources/images/travel/flower3.png" class="d-block w-100" alt="사진3" />
                        </div>
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

                    <div class="reviewRegister">
                        <div class="starRating">
                            <input type="radio" name="reviewStar" value="1" id="rate1"><label for="rate1">★</label>
                            <input type="radio" name="reviewStar" value="2" id="rate2"><label for="rate2">★</label>
                            <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
                            <input type="radio" name="reviewStar" value="4" id="rate4"><label for="rate4">★</label>
                            <input type="radio" name="reviewStar" value="5" id="rate5"><label for="rate5">★</label>
                            <span id="selectedRating">0</span>
                        </div>
                        <div class="reviewContent">
                            <textarea></textarea>
                            <button id="submitRating">등록하기</button>
                        </div>
                    </div>

                    <div class="myReview">
                        <div class="myStarRating">
                            <input type="radio" name="reviewStar" value="1" id="rate1"><label for="rate1">★</label>
                            <input type="radio" name="reviewStar" value="2" id="rate2"><label for="rate2">★</label>
                            <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
                            <input type="radio" name="reviewStar" value="4" id="rate4"><label for="rate4">★</label>
                            <input type="radio" name="reviewStar" value="5" id="rate5"><label for="rate5">★</label>
                            <span id="selectedRating">4</span>
                        </div>
                        <div class="myReviewContent">
                            <textarea readonly>동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것</textarea>
                            <button id="submitRating">삭제하기</button>
                        </div>
                        <div class="myReviewReg">
                            <span>2023-01-01</span>
                            <span style="padding-left: 10px;">작성자닉넴</span>
                        </div>
                    </div>

                <div class="reviewList">
                    <ul>
                        <li>
                            <div class="revStarRating">
                                <label>★★★★★</label>
                            </div>
                            <div class="reviewContent">
                                <textarea>인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의</textarea>
                            </div>
                            <div class="reviewReg">
                                <span>작성일</span>
                                <span>작성자이름</span>
                                <span><a href="#">❤</a></span>
                            </div>
                        </li>
                        <li>
                            <div class="revStarRating">
                                <label>★★★★★</label>
                            </div>
                            <div class="reviewContent">
                                <textarea>인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의</textarea>
                            </div>
                            <div class="reviewReg">
                                <span>작성일</span>
                                <span>작성자이름</span>
                                <span><a href="#">❤</a></span>
                            </div>
                        </li>
                        <li>
                            <div class="revStarRating">
                                <label>★★★★★</label>
                            </div>
                            <div class="reviewContent">
                                <textarea>인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의</textarea>
                            </div>
                            <div class="reviewReg">
                                <span>작성일</span>
                                <span>작성자이름</span>
                                <span><a href="#">❤</a></span>
                            </div>
                        </li>
                        <li>
                            <div class="revStarRating">
                                <label>★★★★★</label>
                            </div>
                            <div class="reviewContent">
                                <textarea>인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의</textarea>
                            </div>
                            <div class="reviewReg">
                                <span>작성일</span>
                                <span>작성자이름</span>
                                <span><a href="#">❤</a></span>
                            </div>
                        </li>
                        <li>
                            <div class="revStarRating">
                                <label>★★★★★</label>
                            </div>
                            <div class="reviewContent">
                                <textarea>인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의</textarea>
                            </div>
                            <div class="reviewReg">
                                <span>작성일</span>
                                <span>작성자이름</span>
                                <span><a href="#">❤</a></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="reviewNav">
                <ul>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
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
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56723, 126.98358), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);  
	</script>
</html>
