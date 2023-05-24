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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
	<link href="../css/main.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container">
	<h3>주문내역</h3>
	
	<table class="table">
	<tr>
		<th>주문서번호</th>
		<th>아이디</th>
		<th>총결제금액</th>
		<th>결제구분</th>
		<th>받는사람</th>
		<th>받는주소</th>
		<th>배송메세지</th>
		<th>결과상태</th>		
	</tr>
	<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.orderno}</td>
			<td>${row.id}</td>
			<td>${row.totalamount}</td>
			<td>${row.payment}</td>
			<td>${row.deliverynm}</td>
			<td>${row.deliveryaddr}</td>
			<td>${row.deliverymsg}</td>
			<td>${row.ordercheck}</td>
			<td>
				<input type="button" value="목록으로" onclick="location.href='/product/list'" class="btn btn-outline-success" id="btn2">
			</td>
		</tr>
	</c:forEach>
	
	</table>	
	
	<br>
	<input type="button" value="계속쇼핑하기" onclick="location.href='/product/list'" class="btn btn-outline-success" id="btn2">
	<input type="button" value="주문 및 결제하기" onclick="order()" class="btn btn-outline-success" id="btn2">
	</div>
</body>
</html>