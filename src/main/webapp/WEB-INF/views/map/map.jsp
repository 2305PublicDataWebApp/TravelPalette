<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div id="map" style="width: 100%; height: 97vh;"></div>
		
		<!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d52709ffacc68e58aa4c5df1743f8ea&libraries=services" ></script>
		<script>
       	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	
		// Kakao Maps SDK가 로드된 후에 실행되도록 이벤트 리스너를 추가합니다.
		window.addEventListener('load', function () {
		    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		    var mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.978656), // 지도의 초기 중심 좌표 (서울)
		        level: 10 // 지도의 확대 레벨
		    };  
		
		    // 지도를 생성합니다    
		    var map = new kakao.maps.Map(mapContainer, mapOption); 
		
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
		    var locations = [
		        { address: '서울특별시 중구 장충단로13길 34', name: '동화상가' },
		        { address: '서울특별시 강남구 선릉로100길 1', name: '서울 선릉(성종과 정현왕후)과 정릉(중종)' },
		        { address: '서울특별시 동대문구 회기로 57', name: '홍릉수목원' },
		        { address: '서울특별시 동작구 현충로 210', name: '국립서울현충원' },
		        { address: '서울특별시 성동구 뚝섬로 273', name: '서울숲' }
		    ];
		
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
		
		                // 각 마커에 인포윈도우로 장소 이름을 표시합니다.
		                var infowindow = new kakao.maps.InfoWindow({
		                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + location.name + '</div>'
		                });
		                infowindow.open(map, marker);
		
		                // 지도의 중심을 마지막 주소의 좌표로 이동시킵니다.
		                map.setCenter(coords);
		            } else {
		                console.log('주소 검색 실패: ' + status);
		            }
		        });
		    });
		});
		</script>
	</body>
</html>
