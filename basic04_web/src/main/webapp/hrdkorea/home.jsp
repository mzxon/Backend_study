<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	<%@ include file="" %>					JSP 디렉티브 -> jsp태그가 많으면 추천
	<jsp:include page=""></jsp:include>		액션 태그
 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home.jsp</title>
	<style>
		header{background:navy; color:white; text-align:center;}
		nav	  {text-align:center;}
		a:visited {color:black; text-decoration:none;}
		footer{background:olive; color:white; text-align:center;}
	</style>
</head>
<body>
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<section>
	<!-- 본문시작 -->
		<div>
			<img src="../images/b_tube.png">	
		</div>
	<!-- 본문끝 -->
	</section>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>

</body>
</html>