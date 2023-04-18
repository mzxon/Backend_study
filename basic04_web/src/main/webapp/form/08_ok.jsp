<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08_ok.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	function calc(a, b){
		if(op=="+") return b+a;
		else if(op=="-") return a-b;
		else if(op=="*") return a*B;
		else if(op=="/") return a/b;
		else if(op=="%") return a%b;	
	}
</script>
<body>

	

<%
	request.setCharacterEncoding("UTF-8");

	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	String op=request.getParameter("op").trim();	
	
	
	int res1=0; 	 //정수형 계산 결과
	double res2=0.0; //실수형 계산 결과

	/* 자바에서 문자열 같은지 비교할때 equals() 써야함 */
	if(op.equals("+")){
		res1=num1+num2;
	}else if(op.equals("-")){
		res1=num1-num2;
	}else if(op.equals("*")){
		res1=num1*num2;
	}else if(op.equals("/")){
		res2=(double)num1/num2;
	}else if(op.equals("%")){
		res1=num1%num2;
	}
%>

	<!-- 출력 -->
	<div class="container" style='height:100px'>
	<h3>연산 결과</h3>
	<table class="table">
	<tr class="warning">
		<td><%=num1 %></td>
		<td><%=op %></td>
		<td><%=num2 %></td>
		<td>=</td>
		<td>
		<%
			if(op.equals("/")){
				out.print(String.format("%.1f", res2)); //소수점1자리수로 문자열 출력 String.format("%.1f")
			}else{
				out.print(res1);
			}
		%>
		</td>
	</tr>
	</table>
	</div>
	
	
	
</body>
</html>