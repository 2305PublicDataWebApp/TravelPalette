<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>문의 내역</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/detail.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		</head>
    <body>
        <div class="d-flex justify-content-center">

            <div id="inquiries" >
                <h1>문의글 상세조회</h1><br>
                <h3>나의 문의</h3>
                <div id="question" class="inquiries">
                    <table class="table table-borderless">
                        <thead id="tHead" style="border-bottom: thin solid black;">
                            <tr>
                                <td style="width: 13%;">
                                    제목
                                </td>
                                <td colspan="2" >
                                    <span>${iPost.inquiryTitle }</span>
                                </td>
                                <td >
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <div  class="d-flex justify-content-end">
                                <tr id="writeDate" class="align-middle" style="font-size: 15px;">
                                    <td style="width: 13%;">
                                        <label>첨부 파일 </label>
                                    </td>
                                    <td colspan="">
                                    <c:if test ="${iPost.inquiryFileName ne null }">
                                        <div id="fileBox" class="fileBox">
                                            <p id="upload-name" style="margin: 0px;" >${iPost.inquiryFileName }</p>
                                            <a href="#" download><button class="fileBtn" id="downBtn">다운</button></a>
                                        </div>
                                    </c:if>
                                    </td>
                                    <td style="width: 20%;" colspan="2">
                                        <span>작 성 일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${iPost.inquiryCreateDate}" /></span>
                                    </td>
                                </tr>
                            </div>
                            <tr id="qContnet">
                                <td colspan="4" style="padding: 20px;">
                                    <textarea readonly="readonly">${iPost.inquiryContent }</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <c:if test='${iPost.inquiryResponse.toString() eq "Y" }'>
	                <h3>답변</h3>
	                <div class="respones inquiries">
	                    <table id="responesTable" class="table table-borderless table-warning" style="--bs-table-bg: #f4f4f2;">
	                        <thead style="border-top: none; border-bottom: thin solid #AD8E70;">
	                            <tr>
	                                <td>
	                                    <span>답변일 : </span><span>${responesDate}</span>
	                                </td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td colspan="2" style="padding: 20px;">
	                                    <p>이건답변내용이에용아기다리고기다리던추석이왔으면좋겠다람쥐가노래를한다람쥐가 간장공장콩장장어쩌구저쩌구얼씨구야어절씨구</p>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <p>답변이 작성된 후에는 문의글을 수정할 수 없습니다.</p>
                </c:if>
                <div id="btnBox">
                	<c:if test='${iPost.inquiryResponse.toString() eq "N" }'>
                    <a href="/inquiry/modify.tp?inquiryNo=${iPost.inquiryNo }"><button class="btn btn-success">수정</button></a>
                	</c:if>
                    <a href="/inquiry/list.tp?userId=${userId }"><button class="btn btn-success">목록</button></a>
                    <button onclick="deleteCheck('${iPost.inquiryNo}')"class="btn btn-success">삭제</button></a>
                </div>
        </div>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
			const deleteCheck = (inquiryNo) => {
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href = "/inquiry/delete.tp?inquiryNo="+inquiryNo;
				}
			}
    	</script>
    </body>
</html>