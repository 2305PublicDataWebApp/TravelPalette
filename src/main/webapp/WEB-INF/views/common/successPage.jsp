<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>성공</title>
	</head>
	<body>
		<script>
			const msg = "${msg }"
			const url = "${url }"
			if(msg != "") alert(msg);
			location.href = url;
		</script>
	</body>
</html>