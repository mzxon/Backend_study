<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	<h3>상품등록</h3>
	
	<p>
		<button type="button" onclick="location.href='list'" class="btn btn-outline-success">상품전체목록</button>
	</p>
	
	<form name="productfrm" id="productfrm" method="post" action="insert" enctype="multipart/form-data">
		<table class="table table-bordered">
	    <tr>
	        <td>상품명</td>
	        <td> <input type="text" name="product_name"> </td>
	    </tr>
	    <tr>
	        <td>상품가격</td>
	        <td> <input type="number" name="price"> </td>
	    </tr>
	    <tr>
	        <td>상품설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="description"></textarea>     
	         </td>
	    </tr>
	    <tr>
	        <td>상품사진</td>
	        <td> <input type="file" name="img"> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        	<input type="submit" value="상품등록" class="btn btn-outline-secondary">
	        </td>
		</tr>
		</table>
	</form>
	</div>
</body>
</html>