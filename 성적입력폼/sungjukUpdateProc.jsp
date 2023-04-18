<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdateProc.jsp</title>
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
	//==========데이터 가져오기==========
	
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");	
	
	//(sungjukForm.jsp에서)사용자가 입력한 정보를 가져와서 변수에 담기
	int sno=Integer.parseInt(request.getParameter("sno"));
	String uname=request.getParameter("uname").trim();
	int kor 	= Integer.parseInt(request.getParameter("kor").trim());
	int eng 	= Integer.parseInt(request.getParameter("eng").trim());
	int mat 	= Integer.parseInt(request.getParameter("mat").trim());
	String addr = request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	try{
		String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
		String user	   ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		//out.println("오라클 DB 연결 성공!");
		
		//SQL UPDATE문 작성
		StringBuilder sql=new StringBuilder();
		sql.append(" UPDATE sungjuk");
		sql.append(" SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate");
		sql.append(" WHERE sno=?");
	
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, uname);
		pstmt.setInt(2, kor);
		pstmt.setInt(3, eng);
		pstmt.setInt(4, mat);
		pstmt.setInt(5, aver);
		pstmt.setString(6, addr);
		pstmt.setInt(7, sno);
		
		int cnt=pstmt.executeUpdate();//int형으로 받음
		if(cnt==0){ //업데이트 안되었단 뜻 0개
			out.println("<p>성적 입력이 실패했습니다!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a><p>");
								     //->자바스크립트 함수로 뒤로가기
		}else{
			out.println("<script>");
			out.println("	alert('성적이 수정되었습니다!');");
			out.println("	location.href='sungjukList.jsp';"); //자바스크립트 location함수로 목록페이지로 이동
			out.println("</script>");
		}
		
	}catch (Exception e) {
		out.println("오라클 DB 연결실패 :"+e);
	}finally{//자원반납(순서주의)
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