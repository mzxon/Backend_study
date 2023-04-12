<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="net.utility.DBOpen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate</title>
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
		out.println("<p>성적 수정 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
%>
		<div class="container" style="padding:10%; width:900px;">
		<h3>* 성적 수정 폼 *</h3>
		<hr>
		<p><a href="sungjukList.jsp">[성적목록]</a></p>
		<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
		<input type="hidden" name="sno" value="<%=sno %>">
		<table class="table table-striped">
		<tr>
			<th>이름</th>
			<td><input type="text" name="uname" id="uname" value="<%=dto.getUname() %>" maxlength="50" required autofocus class="form-control"></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><input type="number" name="kor" id="kor" value="<%=dto.getKor() %>" size="5" min="0" max="100" placeholder="국어점수" class="form-control"></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><input type="number" name="eng" id="eng" value="<%=dto.getEng() %>" size="5" min="0" max="100" placeholder="영어점수" class="form-control"></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><input type="number" name="mat" id="mat" value="<%=dto.getMat() %>" size="5" min="0" max="100" placeholder="수학점수" class="form-control"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<% String addr=dto.getAddr(); %>
				<select name="addr" id="addr" class="form-control">
					<option value="Seoul" <%if(addr.equals("Seoul")) out.print("selected"); %>>서울</option>
				    <option value="Jeju"  <%if(addr.equals("Jeju"))  out.print("selected"); %>>제주</option>
					<option value="Suwon" <%if(addr.equals("Suwon")) out.print("selected"); %>>수원</option>
					<option value="Busan" <%if(addr.equals("Busan")) out.print("selected"); %>>부산</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-default">
				<input type="reset" value="취소" class="btn btn-default">
			</td>
		</tr>
		</table>
		</form>
		</div>
<%
	}
%>
</body>
</html>