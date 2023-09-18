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
        <link rel="stylesheet" href="../resources/css/community/insert.css">
    </head>
    <body>
        <!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- 메인 -->
        <main>
            <div style="width: 100%;height: 135px;">
                <h4 style="float: left;font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">게시판 글 등록</h4>
                <button id="goBackButton" style="float: right;margin: 49px 10px 0px 0px;" type="button" class="btn btn-primary">목록으로</button>
                <!-- <button style="float: right;margin: 47px 10px 0px 0px;" type="button" class="btn btn-info">수정하기</button> -->
            </div>
            <form action="/community/modify.tp" method="post">
            	<div style="width: 100%;margin: 0 auto;">
                    <div class="form-floating mb-3">
	                    <input name="boardTitle" type="text" style="border: 1px solid #ccc;" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요">
	                    <label for="floatingInput" id="boardTitleLable">${community.boardTitle }</label>
                      </div>
                </div>
                   <div class="form-floating" style="margin-top: 25px;">
                   <select id="boardSelect" name="boardType" class="form-select" aria-label="Floating label select example" style="border: 1px solid #ccc;">
                   	  <c:if test="${community.boardType eq 'QnABoard'}">
	                      <option value="QnABoard" selected>질의문답 게시판</option>
                   	  </c:if>
                   	   <c:if test="${community.boardType eq 'travelCompanion'}">
	                      <option value="travelCompanion" selected>동행 구인 게시판</option>
                   	  </c:if>
                   	  <c:if test="${community.boardType eq 'travelVerification'}">
	                      <option value="travelVerification" selected>여행 인증 게시판</option>
                   	  </c:if>
                    </select>
                    <label>게시판 종류</label>
                 </div>
                 <div id="imageFile" class="input-group mb-3" style="margin-top: 25px;display:none;">
                    <img src="../resources/images/community/fileadd.png" style="width: 25px;height: 25px;margin-top: 6px;margin-right: 10px;float:left" alt="">
                    <input type="file" class="form-control" id="inputGroupFile02" style="border: 1px solid #ccc;width: 925px;">
                    <!-- <label class="input-group-text" for="inputGroupFile02">Upload</label> -->
                 </div>
                 <div class="form-floating">
                    <textarea name="boardContent" class="form-control" placeholder="내용을 입력해주세요." style="height: 100px;border: 1px solid #ccc;margin-top: 25px;height: 500px;resize: none;"></textarea>
                    <label id="boardContentLable">${community.boardContent }</label>
                 </div>
                <div style="width: 1000px;margin: 0 auto;text-align: center;margin-top: 70px;">
                    <button id="modifyBtn" type="button" class="btn btn-primary btn-lg">수정 완료</button>
                </div>
            </form>
        </main>
        <div style="width: 100%;height: 80px;margin: 0 auto;">
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script>
        <jsp:include page="/include/navjs.jsp"></jsp:include>
            
            document.getElementById("goBackButton").addEventListener("click", function() {
                history.go(-1); // 뒤로가기
            });
            
         // 유효성 체크
            var submitButton = document.querySelector("#insertBtn"); // 버튼 선택
            submitButton.addEventListener("click", function(event) {
                var boardTitleInput = document.querySelector("input[name='boardTitle']");
                var boardSelect = document.querySelector("select[name='boardType']");
                var boardContentTextarea = document.querySelector("textarea[name='boardContent']");
                // 버튼 클릭 시 실행되는 함수
                if (boardTitleInput.value.trim() === "") {
                    alert("제목을 입력해주세요.");
                    return; // submit 막기
                } else if (boardContentTextarea.value.trim() === "") {
                    alert("내용을 입력해주세요.");
                    return; // submit 막기
                } else if(boardContentTextarea.value == "예상 동행 인원 :\n\n주로 활동하는 날 :\n\n모임의 특징 :\n\n예상 회비 :\n\n전화번호 :"){
                   	alert("양식에 내용을 입력해주세요.");
                   	return; // submit 막기
                }
                if(document.getElementsByName("boardContent")[0])
                // 모든 조건이 충족되면 폼을 제출
                var form = document.insertForm;
                form.submit();
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>