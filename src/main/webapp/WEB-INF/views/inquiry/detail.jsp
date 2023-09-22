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
    	<!-- 헤더 -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        <!-- 네비 -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
        <div style="width: 100%;height: 50px;"></div>          
        <div class="d-flex justify-content-center">
            <div id="inquiries" >
                <h1 style="font-family: 'TmoneyRoundWindExtraBold';font-size: 32px;margin-bottom: 25px;">문의글 상세조회</h1><br>
                <h3 style="font-size: 24px;font-family: 'SUITE-Regular';font-weight: 600;padding-left: 21px;padding-bottom: 20px;">나의 문의</h3>
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
	                <h3 style="font-size: 24px;font-family: 'SUITE-Regular';font-weight: 600;padding-left: 21px;">답변</h3>
	                <div class="respones inquiries">
	                    <table id="responesTable" class="table table-borderless table-warning" style="--bs-table-bg: #F4F4F2;">
	                        <thead style="border-top: none; border-bottom: thin solid #AD8E70;">
	                            <tr>
	                                <td>
	                                    <span>답변일 : </span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${rPost.responseCreateDate}" /></span>
	                                </td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td colspan="2" style="padding: 20px;">
	                                    <textarea>${rPost.responseContent }</textarea>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <p style="font-family: 'SUITE-Regular';">* 답변이 작성된 후에는 문의글을 수정할 수 없습니다.</p>
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
	    <div style="width: 100%;height: 50px;"></div> 
        <!-- 푸터 -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    	<jsp:include page="/include/navjs.jsp"></jsp:include>
			const deleteCheck = (inquiryNo) => {
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href = "/inquiry/delete.tp?inquiryNo="+inquiryNo;
				}
			}
    	</script>
    </body>
</html>