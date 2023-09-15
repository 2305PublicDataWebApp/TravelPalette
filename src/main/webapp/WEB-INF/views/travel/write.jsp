<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>여행 정보 게시판 작성</title>
        <link rel="stylesheet" href="../resources/css/travel/write.css">
    </head>
    <body>
        <h1>여행 정보 게시판 작성</h1>
        <form action="/travel/insert.tp" method="POST">
            <ul>
                <li>
                    <label for="tName"><b>여행지명</b></label>
                    <input type="text" name="travelName" id="tName">
                </li>
                <li>
                    <label for="tAddr"><b>여행지주소</b></label>
                    <input type="text" name="travelAddr" id="tAddr">
                </li>
                <li>
                    <label for="tInfo"><b>여행 소개글</b></label>
                    <textarea rows="4" cols="50" id="tInfo" name="travelInfo"></textarea>
                </li>
                <li>
                    <label for="tUrl"><b>홈페이지</b></label>
                    <input type="text" name="travelUrl" id="tUrl">
                </li>
                <li>
                    <label for="tTel"><b>연락처</b></label>
                    <input type="text" name="travelTel" id="tTel">
                </li>
                <li>
                    <label for="tTime"><b>이용시간</b></label>
                    <input type="text" name="travelUsingTime" id="tTime">
                </li>
                <li>
                    <label for="tHoliday"><b>휴일정보</b></label>
                    <input type="text" name="travelHoliday" id="tHoliday">
                </li>
                <li>
                    <label for="tParking"><b>주차정보</b></label>
                    <input type="text" name="travelParking" id="tParking">
                </li>
                <li>
                    <label for="travelLocation"><b>지역키워드</b></label><br>
                    <sapn class="tagsCheck">#서울 <input type="radio" name="travelLocation" value="#서울" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#부산 <input type="radio" name="travelLocation" value="#부산" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#대구 <input type="radio" name="travelLocation" value="#대구" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#인천 <input type="radio" name="travelLocation" value="#인천" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#광주 <input type="radio" name="travelLocation" value="#광주" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#대전 <input type="radio" name="travelLocation" value="#대전" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#울산 <input type="radio" name="travelLocation" value="#울산" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#세종 <input type="radio" name="travelLocation" value="#세종" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#경기 <input type="radio" name="travelLocation" value="#경기" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#강원 <input type="radio" name="travelLocation" value="#강원" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#충북 <input type="radio" name="travelLocation" value="#충북" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#충남 <input type="radio" name="travelLocation" value="#충남" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#경북 <input type="radio" name="travelLocation" value="#경북" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#경남 <input type="radio" name="travelLocation" value="#경남" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#전북 <input type="radio" name="travelLocation" value="#전북" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#전남 <input type="radio" name="travelLocation" value="#전남" id="travelLocation"></sapn>
                    <sapn class="tagsCheck">#제주 <input type="radio" name="travelLocation" value="#제주" id="travelLocation"></sapn>
                </li>
                <li>
                    <label for="tTags"><b>테마키워드</b></label>
                    <span style="margin-left: 10px; color: red; font-weight: bold;">중복 선택 가능</span><br>
                    <sapn class="tagsCheck">#동물       <input type="checkbox" name="travelTags" value="#동물" 		 id="tTags"></sapn>
                    <sapn class="tagsCheck">#레포츠     <input type="checkbox" name="travelTags" value="#레포츠"  	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#캠핑       <input type="checkbox" name="travelTags" value="#캠핑"    	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#한옥체험   <input type="checkbox" name="travelTags" value="#한옥체험" 	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#문화시설   <input type="checkbox" name="travelTags" value="#문화시설"   id="tTags"></sapn>
                    <sapn class="tagsCheck">#럭셔리     <input type="checkbox" name="travelTags" value="#럭셔리"     id="tTags"></sapn>
                    <sapn class="tagsCheck">#테마파크   <input type="checkbox" name="travelTags" value="#테마파크" 	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#실내여행지 <input type="checkbox" name="travelTags" value="#실내여행지" id="tTags"></sapn>
                    <sapn class="tagsCheck">#유적지     <input type="checkbox" name="travelTags" value="#유적지" 	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#쇼핑       <input type="checkbox" name="travelTags" value="#쇼핑" 		 id="tTags"></sapn>
                    <sapn class="tagsCheck">#자연여행   <input type="checkbox" name="travelTags" value="#자연여행" 	 id="tTags"></sapn>
                    <sapn class="tagsCheck">#관광지     <input type="checkbox" name="travelTags" value="#관광지" 	 id="tTags"></sapn>
                </li>
                <!--  
                <li>
                    <b>첨부파일1</b>
                    <input type="file" name="uploadFile">
                </li>
                <li>
                    <b>첨부파일2</b>
                    <input type="file" name="uploadFile">
                </li>
                <li>
                    <b>첨부파일3</b>
                    <input type="file" name="uploadFile">
                </li>-->
            </ul>
            <div class="button-container">
                <input type="submit" value="등록">
            </div>
        </form>
    </body>
</html>