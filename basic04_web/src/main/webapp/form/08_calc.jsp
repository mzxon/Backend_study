<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08_calc.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script>
		function validate(){
			//alert();
			//연산기호 + - */ % 만 입력가능 (유효성 검사)
			let op=document.getElementById("op").value;
			op=op.trim();
			if(!(op=='+' || op=='-' || op=='*' || op=='/' or op=='%')){
				alert("연산기호는 + - */ % 만 입력가능합니다.")
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	
	<div>
	<h3>* 계산기 연습 *</h3>
	<form name="calcfrm" id="calcfrm" method="get" action="08_ok.jsp" onsubmit="return validate()">
		첫번째 수 : <input type="number" name="num1" id="num1" min="0" max="100" required>
		<hr>
		연산자 :   <input type="text" name="op" id="op" size="3" maxlength="1" required>
		<hr>
		두번째 수 : <input type="number" name="num2" id="num2" min="0" max="100" required>
		<hr>
		<input type="submit" value="계산">
		<input type="reset" value="취소">
	</form>
	</div>
	<!-- 
		 출력결과
		 3+5=8
		 3-5=-2
		 3*5=15
		 3/5=0.6
		 3%5=3
	 -->
	
	
</body>
</html>