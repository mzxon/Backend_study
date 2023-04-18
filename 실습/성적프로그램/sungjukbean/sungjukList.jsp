<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="ssi.jsp" %>

<%-- 파일 include 방법
	1. <%@ include file="" %>					JSP 디렉티브 -> jsp태그가 많으면 추천
	2. <jsp:include page=""></jsp:include>		액션 태그
--%>    
        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukList.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="padding:10%; width:900px;">
	<h3>* 성적 목록 *</h3>
	<hr>
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	
	<table class="table table-bordered">
	<tr class="warning">
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	</tr>
<%
	ArrayList<SungjukDTO> list = dao.list();
	/* dao(DAO객체)로 list함수를 불러서 받아올 값을 list 변수에 저장
		--> list함수의 반환값이 ArrayList<SungjukDTO>이기때문에 list변수형도 ArrayList<SungjukDTO>*/
	if(list==null){
		out.println("<tr>");
		out.println("   <td colspan='5'>글없음!!</td>");
		out.println("</tr>");
	}else{
		for(int i=0; i<list.size(); i++){
			dto=list.get(i); //list의 인덱스i 가져와서 dto에(dto=DTO객체)담기
%>
			<tr>
				<td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>"><%=dto.getUname() %></a></td>
				<td><%=dto.getKor() %></td>
				<td><%=dto.getEng() %></td>
				<td><%=dto.getMat() %></td>
				<td><%=dto.getWdate().substring(0, 10) %></td>
			</tr>
<%
		}
	}
	
%>
	</table>
	</div>
</body>
</html>