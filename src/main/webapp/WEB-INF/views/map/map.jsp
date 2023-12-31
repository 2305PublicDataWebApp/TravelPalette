<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>지도</title>
	    <link rel="stylesheet" href="/resources/css/map/map.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	</head>
	<body>
	    <!-- 헤더 -->
	    <jsp:include page="/include/header.jsp"></jsp:include>
	    
	    <!-- 네비 -->
	    <jsp:include page="/include/nav.jsp"></jsp:include>
	    
	    <!-- 메인 -->
	    <main>
	        <div id="map" style="width: 100%; height: 97vh; margin: 0 auto;"></div>
	    </main>
	    
		<!-- 푸터 -->
		<jsp:include page="/include/footer.jsp"></jsp:include>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d52709ffacc68e58aa4c5df1743f8ea&libraries=services" ></script>
		<script>
			<jsp:include page="/include/navjs.jsp"></jsp:include>
		
		    // Kakao Maps SDK가 로드된 후에 실행되도록 이벤트 리스너를 추가합니다.
		    window.addEventListener('load', function () {
		        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		        var mapOption = {
		            center: new kakao.maps.LatLng(37.55909, 126.97717), // 지도의 중심좌표
		            level: 8, // 지도의 확대 레벨
		        };  
		        
		        // 지도를 생성합니다    
		        var map = new kakao.maps.Map(mapContainer, mapOption);
		        
		        // 지도에 확대 축소 컨트롤을 생성한다
		        var zoomControl = new kakao.maps.ZoomControl();
		
		        // 지도의 우측에 확대 축소 컨트롤을 추가한다
		        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		        
		        // 마커 이미지의 주소
		        var markerImageUrl = '../resources/images/map/marker.png';
		        var markerImageSize = new kakao.maps.Size(40, 42); // 마커 이미지의 크기
		        var markerImageOptions = {
		            offset: new kakao.maps.Point(19, 43) // 마커 좌표에 일치시킬 이미지 안의 좌표
		        };
		        
		        // 마커 이미지를 생성합니다
		        var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		        
		        // 주소-좌표 변환 객체를 생성합니다
		        var geocoder = new kakao.maps.services.Geocoder();
		        
		        // 주소와 장소 이름을 포함한 배열
		        var locations = [];
		        
		        // tList 배열에 저장된 travelAddr 및 travelName 추가
		        <c:forEach items="${tList}" var="travel">
		            locations.push({
		                address: '<c:out value="${travel.travelAddr}" />',
		                name: '<c:out value="${travel.travelName}" />',
		                no: '<c:out value="${travel.travelNo}" />'
		            });
		        </c:forEach>
		        
		        // 각 주소에 대한 좌표를 검색하고 마커를 표시합니다.
		        locations.forEach(function (location) {
		            geocoder.addressSearch(location.address, function (result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                    var marker = new kakao.maps.Marker({
		                        map: map,
		                        image: markerImage,
		                        position: coords
		                    });
		
		                    // 마커를 클릭했을 때 이벤트 핸들러를 추가합니다.
		                    var overlayVisible = false; // 오버레이의 표시 여부를 추적하는 변수
		                    kakao.maps.event.addListener(marker, 'click', function() {
		                        // 오버레이가 표시 중이면 숨깁니다.
		                        if (overlayVisible) {
		                            overlay.setMap(null);
		                            overlayVisible = false;
		                        } else { // 오버레이가 숨겨져 있으면 표시합니다.
		                            overlay.setMap(map);
		                            overlayVisible = true;
		                        }
		                    });
		
		                    // 커스텀 오버레이를 생성하고 컨텐츠를 설정합니다.
		                    var content = '<div class="customoverlay">' +
		                        '  <a href="/travel/detail.tp?travelNo='+location.no +'" target="_blank">' +
		                        '    <span class="title">' + location.name + '</span>' +
		                        '  </a>' +
		                        '</div>';
		                    var overlay = new kakao.maps.CustomOverlay({
		                        content: content,
		                        map: null, // 초기에는 지도에 표시하지 않음
		                        position: marker.getPosition()
		                    });
		                } else {
		                    console.log('주소 검색 실패: ' + status);
		                }
		            });
		        });
		    });
		</script>
	</body>
</html>
