<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>start.jsp</title>
</head>
<body>
	
	<h1>계산결과</h1>
	
	<h2>1)JSP</h2>
	<%=request.getAttribute("message")%><br>
	숫자1 : <%=request.getAttribute("no1")%><br>
	숫자2 : <%=request.getAttribute("no2")%><br>
	결과 : <%=request.getAttribute("result")%><br>
	<%=request.getAttribute("img")%><br>
	
	<h2>2)EL</h2>
	${requestScope.message}<br>
	숫자1 : ${requestScope.no1}<br>
	숫자2 : ${requestScope.no2}<br>
	결과 : ${requestScope.result}<br>
	${requestScope.img}<br>
	<hr>
		
	<h2>3)EL</h2>
	${message}<br>
	숫자1 : ${no1}<br>
	숫자2 : ${no2}<br>
	결과 : ${requestScope.result}<br>
	${img==null ? "" : img}<br>
	<hr>
		

</body>
</html>