<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>    
<%@page import="java.sql.ResultSet"%>
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
	<p><a href="sungjukForm.jsp">[성적입력]</a></p>
	
	<table class="table table-bordered">
	<tr class="warning">
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	</tr>
	
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
		String user	   ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);	
		con=DriverManager.getConnection(url, user, password);
		//out.println("오라클 DB 연결 성공!");
		
		
		
		//SQL문 작성
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" ORDER BY wdate DESC ");
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery(); 
		if(rs.next()){
			do{
%>
	<!-- HTML body 공간 -->
				<tr>
					<td><a href="sungjukRead.jsp?sno=<%=rs.getInt("sno")%>"><%=rs.getString("uname") %></a></td>
					<!-- 이름을 클릭했을때 페이지 이동 -->	<!-- 데이터값 가져올때 따로 변수 선언 안했으면 rs.get 써야함 -->
					<!-- 데이터 들고갈때 ?변수=값&변수=값&변수=값 -->
					<td><%=rs.getString("kor") %></td>
					<td><%=rs.getString("eng") %></td>
					<td><%=rs.getString("mat") %></td>
					<td><%=rs.getString("wdate").substring(0, 10)%></td>
											<!-- 현재날짜 년월일만 출력 -->
				</tr>

<%
			}while(rs.next());
		}else{
			out.println("<tr>");
			out.println("  	<td colspan='5'>글없음!</td>");
			out.println("</tr>");
		}
		
	}catch (Exception e) {
		out.println("오라클 DB 연결실패 :"+e);
	}finally{//자원반납(순서주의)
		try{
			if(rs!=null) rs.close();
		}catch (Exception e) {}
		try{
			if(pstmt!=null) pstmt.close();
		}catch (Exception e) {}
		try{
			if(con!=null) con.close();
		}catch (Exception e) {}	
	}
%>
	</table>
	</div>
	
</body>
</html>