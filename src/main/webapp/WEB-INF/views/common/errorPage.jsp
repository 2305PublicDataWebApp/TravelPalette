<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에러페이지</title>
	</head>
	<body>
		<h1>${error }</h1>
		<script>
			const msg= "${msg }";
			const url= "${url}";
			if(msg != "") alert(msg);
			if (url) {
				location.href = url;
			}
		</script>
	</body>
</html>