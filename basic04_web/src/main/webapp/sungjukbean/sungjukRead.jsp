<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukRead.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>
		<div class="container" style="padding:10%; width:900px;">
		<h3>* 성적 상세보기 *</h3>
		<hr>
		<p>
			<a href="sungjukForm.jsp">[성적쓰기]</a>
			<a href="sungjukList.jsp">[성적목록]</a>
		</p>
		<table class="table table-bordered">
		<tr>
			<th class="active">이름</th>
			<td><%=dto.getUname() %></td>
		</tr>
		<tr>
			<th class="active">국어</th>
			<td><%=dto.getKor() %></td>
		</tr>
		<tr>
			<th class="active">영어</th>
			<td><%=dto.getEng() %></td>
		</tr>
		<tr>
			<th class="active">수학</th>
			<td><%=dto.getMat() %></td>
		</tr>
		<tr>
			<th class="active">평균</th>
			<td><%=dto.getAver() %></td>
		</tr>
		<tr>
			<th class="active">주소</th>
			<td>
				<%=dto.getAddr() %>
<%
				//주소를 한글로 출력
				String addr=dto.getAddr();
				if(addr.equals("Seoul")) out.print("서울");
				else if(addr.equals("Jeju")) out.print("제주");
				else if(addr.equals("Suwon")) out.print("수원");
				else if(addr.equals("Busan")) out.print("부산");
%>
			</td>
		</tr>
		<tr>
			<th class="active">작성일</th>
			<td><%=dto.getWdate() %></td>
		</tr>
		</table>
		<br><br>
		<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>
		&nbsp;&nbsp;
		<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>
		</div>
<% 		
	}
%>
</body>
</html>