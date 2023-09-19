<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주소로 장소 표시하기</title>
    <link rel="stylesheet" href="/resources/css/map/map.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
</head>
	<body>
	 <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        
        <!-- 메인 -->
        <main>
		<div id="map" style="width: 100%; height: 97vh; margin: 0 auto;"></div>
		
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
		            name: '<c:out value="${travel.travelName}" />'
		        });
		    </c:forEach>
		    
		    // 각 주소에 대한 좌표를 검색하고 마커를 표시합니다.
		    locations.forEach(function (location) {
		        geocoder.addressSearch(location.address, function (result, status) {
		            if (status === kakao.maps.services.Status.OK) {
		                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                var marker = new kakao.maps.Marker({
		                    map: map,
		                    image: markerImage, // 마커의 이미지
		                    position: coords
		                });
		
// 		                // 각 마커에 인포윈도우로 장소 이름을 표시합니다.
// 		                var infowindow = new kakao.maps.InfoWindow({
// 		                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + location.name + '</div>'
// 		                });
// 		                infowindow.open(map, marker);
		
		                // 지도의 중심을 마지막 주소의 좌표로 이동시킵니다.
// 		                map.setCenter(coords);
		                
		                // 커스텀 오버레이에 표시할 컨텐츠 입니다
						// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
						// 별도의 이벤트 메소드를 제공하지 않습니다 
						var content = '<div class="wrap">' + 
						            '    <div class="info">' + 
						            '        <div class="title">' + 
						                        location.name + 
						            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						            '        </div>' + 
						            '        <div class="body">' + 
						            '            <div class="desc">' + 
						            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
						            '            </div>' + 
						            '        </div>' + 
						            '    </div>' +    
						            '</div>';
						// 마커 위에 커스텀오버레이를 표시합니다
						// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						var overlay = new kakao.maps.CustomOverlay({
						    content: content,
						    map: map,
						    position: marker.getPosition()       
						});
		            } else {
		                console.log('주소 검색 실패: ' + status);
		            }
		            
					// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					    overlay.setMap(map);
					});
					
					// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					function closeOverlay() {
					    overlay.setMap(null);     
					}
		        });
		    });
		});
		</script>
	</body>
</html>
