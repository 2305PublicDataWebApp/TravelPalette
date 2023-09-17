<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/community/travelcertify.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 100%; height: 135px;">
                <h2 style="font-family: 'TmoneyRoundWindExtraBold'; font-size: 28px; padding: 20px; margin-top: 30px; float: left;">여행 인증 게시판</h2>
                <div class="input-group" style="width: 600px;float: right;margin-top: 90px;">
                    <select class="form-select" aria-label="Default select example" style="margin-right: 8px;border: 1px solid #adb5bd;">
                        <option selected>전체</option>
                        <option value="1">제목</option>
                        <option value="2">닉네임</option>
                        <option value="3">글번호</option>
                      </select>
                    <input style="width: 200px;border: 1px solid #adb5bd;" class="form-control me-2" type="search" placeholder="검색어를 입력해보세요" aria-label="Search">
                    <button class="btn btn-outline-success" style="border-bottom-right-radius: 5px;border-top-right-radius: 5px;z-index: 1;width: 80px;" type="submit" >Search</button>
                </div>
                <div style="width: 100%;float: left;border-top: 1px solid #ccc;margin-top: 15px;padding: 10px 0px">
                    <p style="float:left;font-size: 18px;margin: 0;padding: 5px;font-weight: 600;font-family: 'SUITE-Regular';letter-spacing: 2px;padding-left: 15px;">#12건</p>
                    <button type="button" style="float: right;" class="btn btn-primary">글 등록</button>
                    <p style="margin: 0;padding: 7px 13px 0px 8px;margin-left: 3px;float: right;">
                        <a href="#">최신순 </a>|
                        <a href="#">추천순</a> 
                    </p>
                </div>
            </div>
            <table class="table" style="text-align: center;margin:0;margin-top: 5px;">
                <thead>
                  <tr class="table" style="border-bottom: 2px solid #ccc;">
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 220px;padding-top: 10px;padding-bottom: 10px;">
                        <div class="card" style="width: 200px;height: 120px;">
                            <img src="..." class="card-img-top" alt="...">
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;font-family: 'SUITE-Regular';">
                        <h4 style="font-family: 'HakgyoansimWoojuR';padding-top: 10px;font-weight: 600;margin: 0;font-size: 22px;">제목이 들어갈 자리입니다</h4> <br>
                        닉네임 : <br>
                        작성날짜 :
                    </td>
                    <td style="width: 100px;">
                        <img style="width: 40px;padding-top: 25px;" src="../resources/images/community/likeoff.png" alt="">
                        <div>
                            <span style="font-size: 20px;font-weight: 600;">1</span>
                        </div>
                    </td>
                  </tr>
                </tbody>
              </table>
        </div>
        <div aria-label="Page navigation example">
            <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
              <li class="page-item"><a style="color: black;" class="page-link" href="#">Previous</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">1</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">2</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">3</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">4</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">5</a></li>
              <li class="page-item"><a style="color: black;" class="page-link" href="#">Next</a></li>
            </ul>
        </div>
        </main>
        <!-- 푸터 -->
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
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>