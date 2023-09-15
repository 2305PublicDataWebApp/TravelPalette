<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/community/detail.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 1000px;margin: 0 auto;">
                <div style="width: 100%;height: 135px;">
                    <h4 style="float: left;font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">게시판 글 상세보기</h4>
                    <button style="float: right;margin: 49px 10px 0px 0px;" type="button" class="btn btn-primary">목록으로</button>
                    <!-- <button style="float: right;margin: 47px 10px 0px 0px;" type="button" class="btn btn-info">수정하기</button> -->
                </div>
                <table class="table caption-top" style="padding: 0px 20px;font-family: 'SUITE-Regular';font-size: 18px;">
                    <caption>여행 구인 게시판</caption>
                    <thead style="--bs-table-bg: rgba(224, 224, 224, 0.32);border: 1px solid #eee;border-bottom: 2px solid #ccc;">
                      <tr>
                        <th scope="col" style="text-align: left;width: 600px;padding-left: 20px;">
                            제목 : 질문이 뭔가용?
                        </th>
                        <th scope="col" style="text-align: right;">날짜 : 2023.09.14</th>
                        <th scope="col" style="text-align: right;">조회수 : 1</th>
                      </tr>
                    </thead>
                    <tbody style="text-align: left;height: 600px;border: 1px solid #ccc;border-bottom-left-radius: 10px;">
                      <tr>
                        <td colspan="3" style="padding: 20px;">
                            <div style="width: 200px;height: 120px;border: 1px solid red;border-radius: 5px;float: left;margin: 10px;"></div>
                            <div style="width: 200px;height: 120px;border: 1px solid red;border-radius: 5px;float: left;margin: 10px;margin-left: 10px;"></div>
                            <div style="width: 200px;height: 120px;border: 1px solid red;border-radius: 5px;margin: 10px;margin-left: 450px;"></div>
                            <span style="padding: 0px 10px;">내용이 들어갈 공간입니다.</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                <div style="width: 100%;height: 80px;border-bottom: 2px solid #ccc;">
                <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 80px;">해당 게시물이 마음에 드셨나요?</h4>
                </div>
                <div style="width: 100%;height: 130px;border-bottom: 1px solid #ccc;">
                <h4 style="float: left;;font-family: 'SUITE-Regular';font-size: 25px;padding: 20px;margin-top: 30px;">추천 버튼으로 마음을 표현해보세요 ^O^!</h4>
                <div style="float: right;padding: 10px;margin-top: 27px;">
                    <span style="float: right;font-size: 23px;font-weight: 600;margin-top: 12px;margin-left: 5px;">1</span>
                    <img style="width: 40px;float: right;" src="../resources/images/community/likeoff.png" alt="">
                </div>
                </div>
                <div style="width: 100%;height: 110px;margin-top: 80px;">
                    <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">댓글 남기기</h4>
                </div>
                <div style="width: 100%;margin: 0 auto;height: 245px;border-radius: 10px;background-color: rgb(239, 239, 239);font-family: 'SUITE-Regular';">
                    <div class="form-floating" style="width: 90%;margin: 0 auto;padding-top: 1px;">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px;border: 1px solid #ccc;margin-top: 25px;resize: none;height: 150px;"></textarea>                        
                        <label for="floatingTextarea2" style="margin-top: 18px;">댓글을 입력해주세요~</label>
                    </div>
                    <button type="button" class="btn btn-secondary" style="float: right;margin-right: 50px;margin-top: 15px;">
                        글 등록
                    </button>
                    <button type="button" class="btn btn-primary" style="float: right;margin-right: 10px;margin-top: 15px;">
                        수정하기
                    </button>
                    <div class="form-check" style="float: right;margin-right: 15px;margin-top: 21px;">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          비밀 댓글
                        </label>
                      </div>
                </div>
                <div style="width: 100%;height: 110px;margin-top: 80px;">
                    <h4 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">댓글 목록</h4>
                </div>
                <div style="width: 1000px;margin: 0 auto;font-family: 'SUITE-Regular';position: relative;">
                    <div style="width: 100%;height: 200px;background-color: #FDF6F0;">
                        <div style="float: left;padding: 20px;">
                            <h4 style="float: left;font-weight: 600;">닉네임이 들어갈 자리</h4>
                            <p style="float: left;padding: 5px;padding-left: 8px;">2023.09.14</p>
                            <div style="width: 800px;height: 100px;background-color: #FCECDD;float: left;padding: 10px;border-radius: 10px;">
                                <p>댓글 내용이 들어갈 자리입니다.</p>
                            </div>
                        </div>
                        <div style="padding: 10px;margin-top: 27px;position: absolute;right: 10px;top: 36px;">
                            <span style="float: right;font-size: 23px;font-weight: 600;margin-top: 12px;margin-left: 5px;">1</span>
                            <img style="width: 40px;float: right;" src="../resources/images/community/likeoff.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 100px;"></div>
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