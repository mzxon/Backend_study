<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<style>
	 *{font-family:gulim; font-size:24px;}
	</style>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="title">음원 목록</div>

	<div class="content">
		<input type="button" value="음원등록" onclick="location.href='create.do?mediagroupno=${requestScope.mediagroupno}'">
		<input type="button" value="HOME" onclick="location.href='/home.do'"><!-- 절대경로 -->
	</div>
	
	<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>음원파일명</th>
		<th>수정/삭제</th>
	</tr>
	</table>
	
	<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.mediagno}</td>
				<td>${dto.title}</td>
				<td>${dto.rdate}</td>
				<td>
					${dto.filename}
					${dto.filesize}
				</td>

				<td>
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</td>
			</tr>
		</c:forEach>

	

</body>
</html>