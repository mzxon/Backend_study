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
	<title>sungjukRead.jsp</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 </head>
<body>
	<div class="container" style="padding:10%; width:900px;">
	<h3>* 성적 상세보기 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적입력]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	//예) sungjukRead.jsp?sno=3
	//out.print(request.getParameter("sno"));
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	int sno=Integer.parseInt(request.getParameter("sno"));
	/* sno를 받아와서 sno 변수에 대입 */
	
	
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
		sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
		sql.append(" FROM sungjuk");
		sql.append(" WHERE sno=?");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		rs=pstmt.executeQuery(); 
		if(rs.next()){
%>
		<!-- HTML body 공간 -->
			<table class="table table-bordered">
			<tr>
				<th class="active">이름</th>
				<td><%=rs.getString("uname") %></td>
			</tr>
			<tr>
				<th class="active">국어</th>
				<td><%=rs.getString("kor") %></td>
			</tr>
			<tr>
				<th class="active">영어</th>
				<td><%=rs.getString("eng") %></td>
			</tr>
			<tr>
				<th class="active">수학</th>
				<td><%=rs.getString("mat") %></td>
			</tr>
			<tr>
				<th class="active">평균</th>
				<td><%=rs.getString("aver") %></td>
			</tr>
			<tr>
				<th class="active">주소</th>
				<td>
					<%=rs.getString("addr") %>
<%
					//주소를 한글로 출력
					String addr=rs.getString("addr");
					if(addr.equals("Seoul")) out.print("서울");
					else if(addr.equals("Jeju")) out.print("제주");
					else if(addr.equals("Suwon")) out.print("수원");
					else if(addr.equals("Busan")) out.print("부산");
%>
				</td>
			</tr>
			</table>
			<br><br>
			<a href="sungjukUpdate.jsp?sno=<%=sno %>">[수정]</a>
			&nbsp;&nbsp; <!-- 스페이스 한칸 -->
			<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>

<%
		}else{
			out.println("해당 글 없음!");
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
	</div>
</body>
</html>