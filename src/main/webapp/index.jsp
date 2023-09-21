<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/index.css">
    </head>
    <body>
		<!-- 헤더 -->
        <jsp:include page="/include/header_main.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <!-- 캐러셀 뒷 공간 -->
            <div id="mainBackground"></div>
            <div id="slider">
                <button class="btn prev"><</button>
                <div class="wrapper">
                  <div class="items">
                    <div class="item"></div>
                    <div class="item">
                    	<a href="#">
							<div class="content" style="width:23%;height:220px;float:left;background-color:#FFEFBC;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
							    <div>
								    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#CC9B6D;">
								    	*부소담악(추소정)
								    </h2>
								</div>						
							</div>
						    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5), transparent), url(../resources/images/main/부소담악.jpg); background-size: cover; 
						    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);">
						    </div>
							<div class="content" style="width:23%;float:left;height:330px;background-color:#F7D098;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);">
								    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #fffdee;line-height: 33px;">호수 위에 떠 있는 병풍바위,<br><br>충북 옥천군 군북면<br> 부소무늬마을에 가면 <br>부소담악이라는 <br>절경을 만날 수 있다. </h4>
							</div>
                    	</a>
					</div>
                    <div class="item">
                    	<div class="content" style="width:23%;height:220px;float:left;background-color:#FFD1D1;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FF8989;">
							    	*섬진강<br>기차마을
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.1), transparent 70%), url(../resources/images/main/섬진강기차마을.jpg); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#FFB9B9;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);">
						    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: white;line-height: 33px;">
							국도17호선에서 빠져나오면<br>울창한 메타세쿼이아 <br>가로수가 펼쳐진다. <br><br>길 양편으로 기차처럼 <br>길쭉한 나무들이<br> 쭉쭉 뻗었다.
							</h4>
						</div>
                    </div>
                    <div class="item">
                    	<div class="content" style="width:23%;height:220px;float:left;background-color:#FBA1A1;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FFEDED;">
							    	*휴애리<br>자연생활<br> 공원
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.2), transparent 70%), url(../resources/images/main/휴애리자연생활공원1.bmp); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#FB8691;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);">
						    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #fbeeee;line-height: 33px;">
								휴애리는 <br>수많은 꽃들과 <br>한라산 풍경이 더해져 <br>더욱 아름다움을 <br>자랑하는<br> 꽃 정원이다
							</h4>
						</div>
                    </div>
	                    <div class="item">
							<div class="content" style="width:23%;height:220px;float:left;background-color:#FF847C;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
							    <div>
								    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FFEDED;">
								    	*아침 고요<br>수목원
								    </h2>
								</div>						
							</div>
							    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.3), transparent 70%), url(../resources/images/main/아침고요수목원1.jpg); background-size: cover; 
							    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);">
							    </div>
							<div class="content" style="width:23%;float:left;height:330px;background-color:#FF6464;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);">
							    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #FFE1E1;line-height: 33px;">
								여러 가지 <br>특색 있는 정원을<br> 갖추고 있고,<br><br> 울창한 잣나무 <br>숲 아래에서 <br>삼림욕을 즐길 수 있는<br> 도시민들의 쉼터
								</h4>
							</div>
						</div>
                    <div class="item"></div>
                  </div> 
                </div>  
                <button class="btn next">></button>
            </div>
            <div class="travelRecommendArea">
                <div class="travelRecommendText">
                    <h2>추천 여행 코스</h2>
                    <a href="/travel/list.tp">
	                    <img style="width:32px;float: right;padding-top: 5px;margin-right: 14px;" src="../resources/images/main/plus.png" alt="">
                    </a>
                </div>
                <div class="travelRecommand">
                    <ul>
                        <li style="position: relative;">
                        	<a href="/travel/detail.tp?travelNo=35">
	                            <div class="animationTravelImg">
	                                <div class="travelImg" style="background-image: url(../resources/images/main/여행지사진1.jpg);"></div>
	                            </div>
	                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
	                            <div class="travelText">*의미 있는 여행지</div>
                        	</a>
                        </li>
                        <li style="position: relative;">
                        	<a href="/travel/detail.tp?travelNo=55">
	                            <div class="animationTravelImg">
	                                <div class="travelImg" style="background-image: url(../resources/images/main/여행지사진2.jpg);"></div>
	                            </div>
	                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
	                            <div class="travelText">*우리 동네 탐방기</div>
                        	</a>
                        </li>
                        <li style="position: relative;">
                        	<a href="/travel/detail.tp?travelNo=6">
	                            <div class="animationTravelImg">
	                                <div class="travelImg" style="background-image: url(../resources/images/main/여행지사진3.jpg);"></div>
	                            </div>
	                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
	                            <div class="travelText">*신나게 놀자!</div>
                        	</a>
                        </li>
                        <li style="position: relative;">
                        	<a href="/travel/detail.tp?travelNo=44">
	                            <div class="animationTravelImg">
	                                <div class="travelImg" style="background-image: url(../resources/images/main/여행지사진4.jpg);"></div>
	                            </div>
	                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
	                            <div class="travelText">*힐링 여행</div>
                        	</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 주요이벤트 -->
            <div class="eventImg">
                <div style="width: 50%;height: 100%;float: left;">
                    <div style="width: 450px;height: 250px;margin-left: 25px;">
                        <img style="height: 250px;width: 450px;border-radius: 10px;" src="../resources/images/main/이벤트1.png" alt="">
                    </div>
                </div>
                <div class="eventArea">
                    <div>
                        <h4 style="width: 465px;float:left">주요 이벤트</h4>
                        <a href="/event/list.tp">
	                        <img style="width:28px;" src="../resources/images/main/plus.png" alt="">
                        </a>
                    </div>
                   	<a href="/event/detail.tp?eventNo=58">
	                    <div style="width: 100%;height: 50px;background-color: rgba(224, 224, 224, 0.32);padding-top: 10px;padding-left: 15px;margin-top:6px;">
	                        <p style="float: left;background-color: #222;color: white;border-radius: 5px;width: 182px;text-align: center;margin: 0;font-weight: 100;">
	                            HOT 이벤트
	                        </p>
	                        &nbsp;&nbsp;&nbsp;2023 대백제전 소문내고 선물 받자!
	                    </div>
                   	</a>
                   	<a href="/event/detail.tp?eventNo=62">
	                    <div class="eventList table-info">
	                        <p class="eventHighlight">퀴즈 이벤트 | </p>&nbsp;오딩이와 함께하는 로컬힙 플레이스 퀴즈이벤트
	                    </div>
                   	</a>
                   	<a href="/event/detail.tp?eventNo=60">
	                    <div class="eventList">
	                        <p class="eventHighlight">내 주변의 HIP | </p>&nbsp;로컬힙 플레이스 자랑대회 이벤트!
	                    </div>
                   	</a>
                    <a href="/event/detail.tp?eventNo=56">
	                    <div class="eventList">
	                        <p class="eventHighlight">꿀 이벤트 | </p>&nbsp;"2023 찾아가고 싶은 가을섬 인증샷 이벤트!"
	                    </div>
                    </a>
                </div>
            </div>
            <!-- 가이드북 공간 -->
            <div style="width: 1000px;margin: 0 auto;height: 400px;">
                <div style="height: 200px;">
                    <h2 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding-top: 130px;float:left;">
                        여행 가이드북
                    </h2>
                </div>
                <div style="width:100%;height: 510px;background-color: rgba(224, 224, 224, 0.32);">
                    <div style="width: 100%;height: 50px;"></div>
                    <div style="display: flex;flex-direction: row;justify-content: space-evenly;">
                        <div class="card guideBookMsg" style="float: left;">
                        	<a href="../resources/pdf/매거진 남해.pdf" download> 
	                            <img src="../resources/images/main/가이드북1.png" class="card-img-top" alt="">
                        	</a>
                            <div class="card-body">
                                <p class="card-text">한국의 숨은 골목 맛집</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg" style="float:left;">
                        	<a href="../resources/pdf/한국의 숨은골목 맛집 여행_국문.pdf" download>
	                            <img style="border-radius:5px;" src="../resources/images/main/가이드북2.jpg" class="card-img-top" alt="">
                        	</a>
                            <div class="card-body">
                                <p class="card-text">아름다운 한국의 건축물 순례</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg">
                        	<a href="../resources/pdf/봄.pdf" download>
	                            <img src="../resources/images/main/가이드북3.png" class="card-img-top" alt="">
                        	</a>                        	
                            <div class="card-body">
                                <p class="card-text">동행! 동네 한바퀴(봄)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 빈 공간 -->
            <div style="width: 100%;height: 500px;"></div>
        </main>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script>
        	<jsp:include page="/include/navjs.jsp"></jsp:include>
        
            // 캐러셀
            const silder = document.querySelector('#slider');
            const wrapper = document.querySelector('.wrapper');
            const items = document.querySelector('.items');
            const item = document.querySelectorAll('.item');
            const next = document.querySelector('.next');
            const prev = document.querySelector('.prev');
            const itemCount = item.length - 2;
            const mainBackground = document.querySelector("#mainBackground");
            const nav = document.querySelector(".navContainer");
            const colors = ['#FBFFDC', '#FFE3E1', '#FFD1D1', '#FFB9B9', 'orange'];
            let startX = 0;         //mousedown시 위치
            let moveX = 0;         //움직인 정도
            let currentIdx = 0;    //현재 위치(index)
            let positions = [];

            function initializeData() {
            const isActive = items.classList.contains('active');
            if (isActive) items.classList.remove('active');
            const width = wrapper.clientWidth;
            const interval = item[1].clientWidth;
            const margin = (width - interval) / 2
            const initX = Math.floor((interval - margin) * -1);
            let pos = [];
            for (let i=0; i<itemCount; i++) {
                pos.push(initX - interval * i);
            }
            positions = pos;
            items.style.width = (itemCount + 1)*100 + '%';
            items.style.left = positions[currentIdx] + 'px';
            silder.style.visibility = 'visible';
            }

            window.addEventListener('resize', initializeData);
            window.addEventListener('load', initializeData);

            // btn click event
            next.addEventListener('click', (e) => {
            if (currentIdx === itemCount - 1) {
                currentIdx = -1; 
                // return;
            }  
            const isActive = items.classList.contains('active');
            if (!isActive) items.classList.add('active');
            currentIdx = currentIdx + 1;
            items.style.left = positions[currentIdx] + 'px';
            // console.log(currentIdx);

            mainBackground.style.background = "linear-gradient(to bottom, " + colors[currentIdx] + ", white)";
            nav.style.backgroundColor = colors[currentIdx]; // 배경색 변경
            });
            prev.addEventListener('click', (e) => {
            if (currentIdx === 0) {
                currentIdx = itemCount;
                // return;
            }
            const isActive = items.classList.contains('active');
            if (!isActive) items.classList.add('active');
            currentIdx = currentIdx - 1;
            items.style.left = positions[currentIdx] + 'px';
            mainBackground.style.background = "linear-gradient(to bottom, " + colors[currentIdx] + ", white)";
            nav.style.backgroundColor = colors[currentIdx]; // 배경색 변경
            });


            wrapper.onmousedown =(e)=> {
            const rect = wrapper.getBoundingClientRect();
            startX = e.clientX - rect.left;
            const isActive = items.classList.contains('active');
            if (!isActive) items.classList.add('active');
            items.addEventListener('mousemove', onMouseMove);
            document.onmouseup =(e)=> {
                if (wrapper.classList.contains('active')) wrapper.classList.remove('active');
                items.removeEventListener('mousemove', onMouseMove);
                document.onmouseup = null;
                if (moveX > -70 && moveX <= 70) {
                //   만약 -70~70이면 초기위치로 이동
                return items.style.left = positions[currentIdx] + 'px';
                }
                if (moveX > 0 && currentIdx > 0) {
                currentIdx = currentIdx - 1;
                items.style.left = positions[currentIdx] + 'px';
                }
                if (moveX < 0 && currentIdx < itemCount - 1){
                currentIdx = currentIdx + 1;
                items.style.left = positions[currentIdx] + 'px';
                }
                
            }
            }

            function onMouseMove(e) {
            if (!wrapper.classList.contains('active')) wrapper.classList.add('active');
            const rect = wrapper.getBoundingClientRect();
            moveX = e.clientX - rect.left - startX;
            const left = positions[currentIdx] + moveX;
            if (currentIdx === 0 && moveX > 0) return;
            else if(currentIdx === itemCount - 1 && moveX < 0) return;
            items.style.left = left + 'px';
            }

            // 5초마다 다음버튼 누르게 하기
//             setInterval(() => {
//                 next.click();
//             }, 5000);
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>