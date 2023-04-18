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
	<title>sungjukUpdate.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="padding:10%; width:900px;">
	<h3>* 성적 상세보기 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	
	try{
		String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
		String user	   ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);	
		con=DriverManager.getConnection(url, user, password);
		
		
		//1)단계. select문을 이용해서 수정할 행을 가져온다.(sungjukRead.jsp참조)
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
		<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
		<!-- 사용자에게는 필요한 값이 아니지만, 프로그램 흐름상 필요한 값은 hidden 속성으로 담아서 넘긴다. -->
		<input type="hidden" name="sno" value="<%=sno %>"> <!-- sno를 통해서 수정, 조회하는데 사용자에게는 보여줄 필요 없는 값이니까 숨겨서 넘김 -->
		<table class="table table-striped">
		<tr>
			<th>이름</th>
			<td><input type="text" name="uname" id="uname" value="<%=rs.getString("uname")%>" maxlength="50" required autofocus class="form-control"></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><input type="number" name="kor" id="kor" value="<%=rs.getString("kor")%>" size="5" min="0" max="100" placeholder="국어점수" class="form-control"></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><input type="number" name="eng" id="eng" value="<%=rs.getString("eng")%>" size="5" min="0" max="100" placeholder="영어점수" class="form-control"></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><input type="number" name="mat" id="mat" value="<%=rs.getString("mat")%>" size="5" min="0" max="100" placeholder="수학점수" class="form-control"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<% String addr=rs.getString("addr"); %>
				<select name="addr" id="addr">
					<option value="Seoul" <%if(addr.equals("Seoul")) {out.print("selected");} %>>서울</option>
					<option value="Jeju" <%if(addr.equals("Jeju")) {out.print("selected");} %>>제주</option>
					<option value="Suwon" <%if(addr.equals("Suwon")) {out.print("selected");} %>>수원</option>
					<option value="Busan" <%if(addr.equals("Busan")) {out.print("selected");} %>>부산</option>
				</select>
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</td>
		</tr>
		</table>
		</form>
		</div>	
			
			
			
			
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

</body>
</html>