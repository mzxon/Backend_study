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
	<script>
		function order(){
			if(confirm("주문할까요?")){
				location.href='/order/orderform';
			}
		}
	</script>
</head>
<body>
	<div class="container">
	<h3>장바구니목록</h3>
	
	<table class="table">
	<tr>
		<th>번호</th>
		<th>상품코드</th>
		<th>상품가격</th>
		<th>상품수량</th>
		<th>총가격</th>
		<th>삭제</th>
	</tr>
	
	<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.cartno}</td>
			<td>${row.product_code}</td>
			<td>${row.price}</td>
			<td>${row.qty}</td>
			<td>${row.price*row.qty}</td>
			<td>
				<input type="button" value="삭제" onclick="location.href='/cart/delete?cartno=${row.cartno}'">
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