<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	<script src="../js/jquery-3.6.4.min.js"></script>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	
	<script>
		function product_update(){
			document.productfrm.action="/product/update";
			document.productfrm.submit();
		}//product_update() end
		
		function product_delete(){
			if(confirm("첨부된 파일은 영구히 삭제됩니다\n진행할까요?")){
				document.productfrm.action="/product/delete";
				document.productfrm.submit();
			}
		}//product_delete()end
		
		function product_update(){
			document.productfrm.action="/product/update";
			document.productfrm.submit();
		}//product_update()end
	</script>
	
</head>
<body>
	
	<h3>상품상세보기 / 상품수정 / 상품삭제</h3>
	
	<p>
		<button type="button" onclick="location.href='/product/list'">상품전체목록</button>
	</p>
	
	<form name="productfrm" id="productfrm" method="post" action="insert" enctype="multipart/form-data">
		<table border="1">
	    <tr>
	        <td>상품명</td>
	        <td> <input type="text" name="product_name" value="${product.PRODUCT_NAME}"> </td>
	    </tr>
	    <tr>
	        <td>상품가격</td>
	        <td> <input type="number" name="price" value="${product.PRICE}"> </td>
	    </tr>
	    <tr>
	        <td>상품설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea>     
	         </td>
	    </tr>
	    <tr>
	        <td>상품사진</td>
	        <td> <input type="file" name="img"> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        	<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
	        	<input type="button" value="상품수정" onclick="product_update()" >
	        	<input type="button" value="상품삭제" onclick="product_delete()">
	        </td>
		</tr>
		</table>
	</form>
</body>
</html>