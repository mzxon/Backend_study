<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>* 회원 로그인 결과 *</title>
</head>
<body>
	<h3>* 회원 로그인 결과 *</h3>
	
	1)JSP<br>
	
	아이디 : <%=session.getAttribute("s_uid") %><br>
	비번  : <%=session.getAttribute("s_upw") %><br>
	
	아이디 : <%=application.getAttribute("a_uid") %><br>
	비번  : <%=application.getAttribute("a_upw") %><br>
	
	아이디 : <%=request.getAttribute("r_uid") %><br>
	비번  : <%=request.getAttribute("r_upw") %><br>
	
	<hr>
	
	<%=request.getAttribute("msg") %><br>
	<%=request.getAttribute("img") %><br>
	
	<hr>
	
	2)EL (표현언어)<br>
	
	아이디 : ${sessionScope.s_uid }<br>
	비번 	 : ${sessionScope.s_upw }<br>
	
	아이디 : ${applicationScope.a_uid }<br>
	비번 	 : ${applicationScope.a_upw }<br>
	
	아이디 : ${requestScope.r_uid }<br>
	비번 	 : ${requestScope.r_upw }<br>
	
	<hr>
	
	${requestScope.msg }<br>
	${requestScope.img }<br>
	
	<hr>
	<!-- Scope는 생략 가능하다 -->
	<!-- ServletContent 순환 순서 : pageContext -> request -> session -> application -->
	아이디 : ${s_uid}<br> 비번 : ${s_upw}<br>
	아이디 : ${a_uid}<br> 비번 : ${a_upw}<br>
	아이디 : ${r_uid}<br> 비번 : ${r_upw}<br>
	
	${msg}<br>
	${img}<br>
	
</body>
</html>