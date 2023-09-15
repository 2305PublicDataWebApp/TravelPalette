<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/community/questionList.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 100%; height: 135px;">
                <h2 style="font-family: 'TmoneyRoundWindExtraBold'; font-size: 28px; padding: 20px; margin-top: 30px; float: left;">질의 문답 게시판</h2>
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
                    <button type="button" style="float: right;width: 80px;" class="btn btn-primary">글 등록</button>
                    <p style="margin: 0;padding: 7px 13px 0px 8px;margin-left: 3px;float: right;">
                        <a href="#">최신순 </a>|
                        <a href="#">추천순</a> 
                    </p>
                </div>
            </div>
            <table class="table" style="text-align: center;margin-top: 5px;">
                <thead>
                  <tr class="table" style="border-bottom: 2px solid #ccc;--bs-table-bg: rgba(224, 224, 224, 0.32);">
                    <th scope="col">글 번호</th>
                    <th scope="col" style="width: 500px;">제목</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">작성날짜</th>
                    <th scope="col">추천수</th>
                    <th scope="col">조회수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>1</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">5</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">6</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">7</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">8</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">9</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <th scope="row">10</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>1</td>
                  </tr>
                </tbody>
            </table>
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