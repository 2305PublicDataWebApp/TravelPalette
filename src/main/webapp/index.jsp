<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/index.css">
        <style type="text/css">
        	header{
        		border: 0px;
        	}
        </style>
    </head>
    <body>
		<!-- ��� -->
        <jsp:include page="/include/header_main.jsp"></jsp:include>
        
        <!-- �׺� -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- ���� -->
        <main>
            <!-- ĳ���� �� ���� -->
            <div id="mainBackground"></div>
            <div id="slider">
                <button class="btn prev"><</button>
                <div class="wrapper">
                  <div class="items">
                    <div class="item"></div>
                    <div class="item"><div class="content pink">1</div></div>
                    <div class="item"><div class="content yellow">2</div></div>
                    <div class="item"><div class="content skyblue">3</div></div>
                    <div class="item"><div class="content orange">4</div></div>
                    <div class="item"></div>
                  </div> 
                </div>  
                <button class="btn next">></button>
            </div>
            <div class="travelRecommendArea">
                <div class="travelRecommendText">
                    <h2>��õ ���� �ڽ�</h2>
                    <img style="width:32px;float: right;padding-top: 3px;margin-right: 14px;" src="../resources/images/main/plus.png" alt="">
                </div>
                <div class="travelRecommand">
                    <ul>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������1.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/emptyheart.png" alt="">
                            <div class="travelText">���1</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������2.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/emptyheart.png" alt="">
                            <div class="travelText">���1</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������3.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/emptyheart.png" alt="">
                            <div class="travelText">���1</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������4.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/emptyheart.png" alt="">
                            <div class="travelText">���1</div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- �ֿ��̺�Ʈ -->
            <div class="eventImg">
                <div style="width: 50%;height: 100%;float: left;">
                    <div style="width: 450px;height: 250px;margin-left: 25px;">
                        <img style="height: 250px;width: 450px;border-radius: 10px;" src="../resources/images/main/�̺�Ʈ1.png" alt="">
                    </div>
                </div>
                <div class="eventArea">
                    <div>
                        <h4>�ֿ� �̺�Ʈ</h4>
                    </div>
                    <div style="width: 100%;height: 50px;background-color: rgba(224, 224, 224, 0.32);padding-top: 10px;padding-left: 15px;">
                        <p style="float: left;background-color: #222;color: white;border-radius: 5px;width: 182px;text-align: center;margin: 0;font-weight: 100;">
                            �����̼� �׸��� ����
                        </p>
                        &nbsp;&nbsp;&nbsp;������ ������
                    </div>
                    <div class="eventList table-info">
                        <p class="eventHighlight">�����̼� �׸��� ���� | </p>&nbsp;�ϰ� �ް��� ���ÿ�, �����̼� ������!
                    </div>
                    <div class="eventList">
                        <p class="eventHighlight">���� �� �ð� | </p>&nbsp;���� �ٷ� ������!
                    </div>
                    <div class="eventList">
                        <p class="eventHighlight">������ �ϼ��ұ�..? | </p>&nbsp;�ϴ� ���� ��!
                    </div>
                </div>
            </div>
            <!-- ���̵�� ���� -->
            <div style="width: 1000px;margin: 0 auto;height: 400px;">
                <div style="height: 200px;">
                    <h2 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding-top: 130px;float:left;">
                        ���� ���̵��
                    </h2>
                    <img style="width:32px;float: right;padding-top: 131px;margin-right: 14px;" src="../resources/images/main/plus.png" alt="">
                </div>
                <div style="width:100%;height: 510px;background-color: rgba(224, 224, 224, 0.32);">
                    <div style="width: 100%;height: 50px;"></div>
                    <div style="display: flex;flex-direction: row;justify-content: space-evenly;">
                        <div class="card guideBookMsg" style="float: left;">
                            <img src="../resources/images/main/���̵��1.png" class="card-img-top" alt="">
                            <div class="card-body">
                                <p class="card-text">�ѱ��� ���� ��� ����</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg" style="float:left;">
                            <img style="border-radius:5px;" src="../resources/images/main/���̵��2.jpg" class="card-img-top" alt="">
                            <div class="card-body">
                                <p class="card-text">�Ƹ��ٿ� �ѱ��� ���๰ ����</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg">
                            <img src="../resources/images/main/���̵��3.png" class="card-img-top" alt="">
                            <div class="card-body">
                                <p class="card-text">����! ���� �ѹ���(��)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- �� ���� -->
            <div style="width: 100%;height: 500px;"></div>
        </main>
        <!-- Ǫ�� -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
			    const liElements = document.querySelectorAll('nav ul li');
			    const navArea = document.getElementById('navArea');
			
			    let hoverIntent = false;
			
			    liElements.forEach(li => {
			        li.addEventListener('mouseenter', () => {
			            hoverIntent = true;
			            navArea.classList.add('show');
			            navArea.style.zIndex = 2;
			        });
			
			        li.addEventListener('mouseleave', () => {
			            hoverIntent = false;
			            setTimeout(() => {
			                if (!hoverIntent) {
			                    navArea.classList.remove('show');
                            }
                            // navArea.style.zIndex = -1;
				            }, ); // Add a delay before hiding to allow time for moving to menu_text
				        });
				    });
			
                    navArea.addEventListener('mouseenter', () => {
			        hoverIntent = true;
			    });
			
			    navArea.addEventListener('mouseleave', () => {
			        hoverIntent = false;
			        setTimeout(() => {
			            if (!hoverIntent) {
			                navArea.classList.remove('show');
			            }
                        // navArea.style.zIndex = -1;
			        }, ); // Add a delay before hiding to allow time for moving to menu_text
			    });
			});
            // ĳ����
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
            let startX = 0;         //mousedown�� ��ġ
            let moveX = 0;         //������ ����
            let currentIdx = 0;    //���� ��ġ(index)
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
            nav.style.backgroundColor = colors[currentIdx]; // ���� ����
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
            nav.style.backgroundColor = colors[currentIdx]; // ���� ����
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
                //   ���� -70~70�̸� �ʱ���ġ�� �̵�
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

            // setInterval(() => {
            //     next.click();
            // }, 5000);
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>