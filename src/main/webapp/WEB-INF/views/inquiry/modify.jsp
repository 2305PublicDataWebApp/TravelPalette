<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>1:1 문의 수정</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/insert.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		</head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>     
        <div style="width: 100%;height: 50px;"></div>     
        <div class="container">
            <p style="font-family: 'TmoneyRoundWindExtraBold';font-size: 30px;margin-bottom: 33px;">1:1 문의 수정</p>
            <hr>
            <div id="container">
            <form action="/inquiry/modify.tp" name="insertForm" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="inquiryNo" value="${iPost.inquiryNo }">
                <div class="d-flex justify-content-around" style="padding-top: 5px;">
                    <label for="title">제목</label>
                    <input type="text" id="title" class="input" name="inquiryTitle" value="${iPost.inquiryTitle }"placeholder="제목을 입력해주세요">
                    <label for="writeDate">작성일</label>
                    <span><fmt:formatDate pattern="yyyy-MM-dd" value="${iPost.inquiryCreateDate}" ></fmt:formatDate></span>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div class=" d-flex justify-content-center">
                    <textarea class="content" id="textarea" name="inquiryContent"placeholder="내용을 입력해주세요">${iPost.inquiryContent }</textarea>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div class="fileBox d-flex justify-content-center">
                    <input class="upload-name" value="${iPost.inquiryFileName }" placeholder="첨부파일">
                    <label for="fileBtn" class="d-flex justify-content-center">파일첨부</label> 
                    <input type="file" name="uploadFile" id="fileBtn">
                </div>
                <div style="width: 100%;height: 50px;"></div>
                <div style="width: 100%;height: 50px;text-align: center;">
	                <button type="button" class="btn btn-primary" onclick="inquiryInert()">문의글 수정</button>
                </div>
                <div style="width: 100%;height: 50px;"></div>
                </form>
            </div>
        </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
            document.getElementById('fileBtn').addEventListener('change', () => {
                var fileName = document.getElementById('fileBtn').value;
                document.querySelector('.upload-name').value = fileName;
            });          
            
            function inquiryInert() {
				const title = document.querySelector("#title").value;
				const content = document.querySelector("#textarea").value;
	 		   if(title === '' || content === '') {
	 		   		window.alert("문의사항을 입력해주세요.");
	 		   		return false;
	 		   } else{
	 			  document.insertForm.submit();
	 		   }
            }
        </script>
	</body>
</html>