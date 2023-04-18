<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukIns.jsp</title>
</head>
<body>
	<h3>* 성적 결과 페이지 *</h3>
<%
	//==========데이터 가져오기==========
	
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");	
	
	//(sungjukForm.jsp에서)사용자가 입력한 정보를 가져와서 변수에 담기
	String uname=request.getParameter("uname").trim();
	int kor 	= Integer.parseInt(request.getParameter("kor").trim());
	int eng 	= Integer.parseInt(request.getParameter("eng").trim());
	int mat 	= Integer.parseInt(request.getParameter("mat").trim());
	String addr = request.getParameter("addr").trim();
	
	//평균 구하기
	int aver=(kor+eng+mat)/3;
	
	//out.print("요청IP: " +request.getRemoteAddr());
	
	//==========SQL 작성하기==========
	
	//Oracle DB연결 및 행 추가
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
		
		//SQL INSRT문 작성
		StringBuilder sql=new StringBuilder();
		sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)");
		sql.append(" VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, uname);
		pstmt.setInt(2, kor);
		pstmt.setInt(3, eng);
		pstmt.setInt(4, mat);
		pstmt.setInt(5, aver);
		pstmt.setString(6, addr);
		
		int cnt=pstmt.executeUpdate();//int형으로 받음
		if(cnt==0){ //업데이트 안되었단 뜻 0개
			out.println("<p>성적 입력이 실패했습니다!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a><p>");
								     //->자바스크립트 함수로 뒤로가기
		}else{
			out.println("<script>");
			out.println("	alert('성적이 입력되었습니다!');");
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

</body>
</html>