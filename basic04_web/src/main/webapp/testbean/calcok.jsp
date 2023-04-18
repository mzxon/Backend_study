<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="calc" class="net.testbean.CalcBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calcok.jsp</title>
</head>
<body>
	<h3>* 계산 결과 *</h3>
<%
	int num=Integer.parseInt(request.getParameter("num"));

	out.print(num + "의 절대값은 " + calc.abs(num));
	out.print("<hr>");
	out.print(num + "의 팩토리얼값은 " + calc.fact(num));
	out.print("<hr>");
%>
</body>
</html>