<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
	        <title>회원 문의 내역</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
			<link rel="stylesheet" href="../resources/css/inquiry/detail.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		</head>
    <body>
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>          
        <div class="d-flex justify-content-center">

            <div id="inquiries" >
                <h1 style="text-align: center; margin-top: 50px;">문의글 상세 조회</h1><br>
                <h3>${iPost.userId }님의 문의</h3>
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
	                                    <span>답변일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${rPost.responseCreateDate}" /></span>
	                                </td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td colspan="2" style="padding: 20px;">
	                                    <p>${rPost.responseContent }</p>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
                </c:if>
                <div id="btnBox">
                	<c:if test='${iPost.inquiryResponse.toString() eq "Y" }'>
                    	<a href="/admin/modifyresponse.tp?inquiryNo=${iPost.inquiryNo }"><button class="btn btn-success">수정</button></a>
                	</c:if>
                	<c:if test='${iPost.inquiryResponse.toString() eq "N" }'>
                    	<a href="/admin/insertresponse.tp?inquiryNo=${iPost.inquiryNo }"><button class="btn btn-success">작성</button></a>
                	</c:if>
                    <a href="/admin/inquirylist.tp"><button class="btn btn-success">목록</button></a>
                </div>
	        </div>
	    </div>
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
    	</script>
    </body>
</html>