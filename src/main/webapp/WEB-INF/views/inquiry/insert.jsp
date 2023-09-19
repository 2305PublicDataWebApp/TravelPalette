<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>문의 작성</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/insert.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		</head>
    <body>
        <div class="container">
            <p>문의 작성</p>
            <hr>
            <div id="container">
                <div class="d-flex justify-content-around">
                    <label for="title">제목</label>
                    <input type="text" id="title" class="input" placeholder="제목을 입력해주세요">
                    <label for="writeDate">작성일</label>
                    <span>2023-09-13</span>
                </div>
                <div class=" d-flex justify-content-center">
                    <textarea class="content" id="textarea" placeholder="내용을 입력해주세요"></textarea>
                </div>
                <div class="fileBox d-flex justify-content-center">
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                    <label for="fileBtn" class="d-flex justify-content-center">파일첨부</label> 
                    <input type="file" id="fileBtn">
                </div>
                <!-- <button>문의글 작성</button> -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script>
            document.getElementById('fileBtn').addEventListener('change', () => {
                var fileName = document.getElementById('fileBtn').value;
                document.querySelector('.upload-name').value = fileName;
            });            
        </script>
	</body>
</html>