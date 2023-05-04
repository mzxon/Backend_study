<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bbsResult.jsp</title>
</head>
<body>

	<h3>* 로그인 결과 *</h3>
	
	${requestScope.message}<br>
	<p>${requestScope.link}</p>
	<hr>
	
	${message}<br>
	<p>${link}</p>
	
	
</body>
</html>