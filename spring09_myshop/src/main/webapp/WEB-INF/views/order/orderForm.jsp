<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderform.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script>
		function ordercheck(){
			if(confirm("결제할까요?")){
				return true;
			}
			else{
				return false;
			}
		}
	</script>
</head>
<body>
	<div class="container">
	<h3>주문서작성</h3>
	
	<form method="post" action="insert" onsubmit="return ordercheck()">
		<table class="table table-hover">
		<tr>
			<th>받는사람</th>
			<td><input type="text" name="deliverynm"></td>
		</tr>
		<tr>
			<th>받는주소</th>
			<td><input type="text" name="deliveryaddr"></td>
		</tr>
		<tr>
			<th>배송메세지</th>
			<td><input type="text" name="deliverymsg"></td>
		</tr>
		<tr>
			<th>결제구분</th>
			<td>
				<select name="payment">
					<option value="cash">현금결제</option>
					<option value="card">카드</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="결제하기">
			</td>
		</tr>
		</table>
	</form>
	</div>
</body>
</html>