<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>상품목록</h3>
	<p>
		<button type="button" onclick="location.href='write'">상품등록</button>
		<button type="button" onclick="location.href='list'">상품전체목록</button>
		<button type="button" onclick="location.href='../cart/list'">장바구니</button>
	</p>
	
	<form action="search">
		상품명 : <input type="text" name="product_name" value="${product_name}">
			   <input type="submit" value="검색">
	</form>

	<hr>
	상품갯수 : ${fn:length(list)}
	<br><br>
	<table border="1">
	<tr>
		<c:forEach items="${list}" var="row" varStatus="vs">
			<td>
				<c:choose>
					<c:when test="${row.FILENAME != '-'}">
						<img src="/storage/${row.FILENAME}" width="100px">
					</c:when>
					<c:otherwise>
						등록된 사진 없음!<br>
					</c:otherwise>
				</c:choose>
				<br>
				상품명 : <%--<a href="detail?product_code=${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a> --%>
						   <a href="detail/${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a>
				<br>
				상품가격 : <fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>
			</td>
			<!-- 테이블 한줄에 5칸씩 -->
			<c:if test="${vs.count mod 5==0}">
				<tr></tr>
			</c:if>
		</c:forEach>
	</tr>
	</table>	
	
</body>
</html>