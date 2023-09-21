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
                    <div class="item">
						<div class="content" style="width:23%;height:220px;float:left;background-color:#FFEFBC;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#CC9B6D;">
							    	*�μҴ��(�߼���)
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5), transparent), url(../resources/images/main/�μҴ��.jpg); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#F7D098;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);">
							    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #fffdee;line-height: 33px;">ȣ�� ���� �� �ִ� ��ǳ����,<br><br>��� ��õ�� ���ϸ�<br> �μҹ��̸����� ���� <br>�μҴ���̶�� <br>������ ���� �� �ִ�. </h4>
						</div>
					</div>
                    <div class="item">
                    	<div class="content" style="width:23%;height:220px;float:left;background-color:#FFCCCC;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FF8989;">
							    	*������<br>��������
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.1), transparent 70%), url(../resources/images/main/��������������.jpg); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#FFB9B9;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);">
						    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: white;line-height: 33px;">
							����17ȣ������ ����������<br>��â�� ��Ÿ�����̾� <br>���μ��� ��������. <br><br>�� �������� ����ó�� <br>������ ��������<br> ���� ������.
							</h4>
						</div>
                    </div>
                    <div class="item">
                    	<div class="content" style="width:23%;height:220px;float:left;background-color:#FC9D9D;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FFEDED;">
							    	*�޾ָ�<br>�ڿ���Ȱ<br> ����
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.2), transparent 70%), url(../resources/images/main/�޾ָ��ڿ���Ȱ����1.bmp); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#FB8691;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);">
						    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #fbeeee;line-height: 33px;">
								�޾ָ��� <br>������ �ɵ�� <br>�Ѷ�� ǳ���� ������ <br>���� �Ƹ��ٿ��� <br>�ڶ��ϴ�<br> �� �����̴�
							</h4>
						</div>
                    </div>
                    <div class="item">
						<div class="content" style="width:23%;height:220px;float:left;background-color:#FF847C;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);text-align: center;">
						    <div>
							    <h2 style="font-size: 30px; font-family: 'TmoneyRoundWindExtraBold';color:#FFEDED;">
							    	*��ħ ���<br>�����
							    </h2>
							</div>						
						</div>
					    <div class="content pink" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.3), transparent 70%), url(../resources/images/main/��ħ�������1.jpg); background-size: cover; 
					    background-repeat: no-repeat;background-position: center center; width: 66%; height: 600px;float: right;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);">
					    </div>
						<div class="content" style="width:23%;float:left;height:330px;background-color:#FF6464;margin-top:50px;margin-left:85px;box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);">
						    <h4 style="font-family: 'SUITE-Regular'; font-size: 23px;font-weight:600;color: #FFE1E1;line-height: 33px;">
							���� ���� <br>Ư�� �ִ� ������<br> ���߰� �ְ�,<br><br> ��â�� �㳪�� <br>�� �Ʒ����� <br>�︲���� ��� �� �ִ�<br> ���ùε��� ����
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
                    <h2>��õ ���� �ڽ�</h2>
                    <a href="/travel/list.tp">
	                    <img style="width:32px;float: right;padding-top: 5px;margin-right: 14px;" src="../resources/images/main/plus.png" alt="">
                    </a>
                </div>
                <div class="travelRecommand">
                    <ul>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������1.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
                            <div class="travelText">�ǹ� �ִ� ������</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������2.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
                            <div class="travelText">�츮 ���� Ž���</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������3.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
                            <div class="travelText">�ų��� ����!</div>
                        </li>
                        <li style="position: relative;">
                            <div class="animationTravelImg">
                                <div class="travelImg" style="background-image: url(../resources/images/main/����������4.jpg);"></div>
                            </div>
                            <img style="position:absolute;top:10px;right: 20px;" src="../resources/images/main/pinkheart.png" alt="">
                            <div class="travelText">���� ����</div>
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
                        <h4 style="width: 465px;float:left">�ֿ� �̺�Ʈ</h4>
                        <a href="/event/list.tp">
	                        <img style="width:28px;" src="../resources/images/main/plus.png" alt="">
                        </a>
                    </div>
                    <div style="width: 100%;height: 50px;background-color: rgba(224, 224, 224, 0.32);padding-top: 10px;padding-left: 15px;margin-top:6px;">
                        <p style="float: left;background-color: #222;color: white;border-radius: 5px;width: 182px;text-align: center;margin: 0;font-weight: 100;">
                            �����̼� �׸��� ����
                        </p>
                        &nbsp;&nbsp;&nbsp;������ ������
                    </div>
                    <div class="eventList table-info">
                        <p class="eventHighlight">�����̼� �׸��� ���� | </p>&nbsp;�ϰ� �ް��� ���ÿ�, �����̼� ������!
                    </div>
                    <div class="eventList">
                        <p class="eventHighlight">���� ������ �̺�Ʈ? | </p>&nbsp;���� �ٷ� Ȯ���غ���
                    </div>
                    <div class="eventList">
                        <p class="eventHighlight">���� ���� ���� | </p>&nbsp;�츮 �� ��ó�� �α� ������?
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
                        	<a href="../resources/pdf/�Ű��� ����.pdf" download> 
	                            <img src="../resources/images/main/���̵��1.png" class="card-img-top" alt="">
                        	</a>
                            <div class="card-body">
                                <p class="card-text">�ѱ��� ���� ��� ����</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg" style="float:left;">
                        	<a href="../resources/pdf/�ѱ��� ������� ���� ����_����.pdf" download>
	                            <img style="border-radius:5px;" src="../resources/images/main/���̵��2.jpg" class="card-img-top" alt="">
                        	</a>
                            <div class="card-body">
                                <p class="card-text">�Ƹ��ٿ� �ѱ��� ���๰ ����</p>
                            </div>
                        </div>
                        <div class="card guideBookMsg">
                        	<a href="../resources/pdf/��.pdf" download>
	                            <img src="../resources/images/main/���̵��3.png" class="card-img-top" alt="">
                        	</a>                        	
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

            setInterval(() => {
                next.click();
            }, 5000);
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>