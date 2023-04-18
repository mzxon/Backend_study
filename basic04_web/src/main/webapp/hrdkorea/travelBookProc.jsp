<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelBookProc.jsp</title>
<style>
  header{background:darkblue; color:white; text-align: center;}
  nav   {text-align:center;}
  footer{background:blue; color:white; text-align: center;}
</style>
</head>
<body>
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		  <jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<section>
	<!-- 본문시작 -->
		<h3>예약등록</h3>
<%

	request.setCharacterEncoding("UTF-8");

	String rno     =request.getParameter("rno").trim();
	String tcode   =request.getParameter("tcode");
	
	String rjumin1 =request.getParameter("rjumin1").trim();
	String rjumin2 =request.getParameter("rjumin2").trim();
	String rjumin=rjumin1+rjumin2;
	
	String rname   =request.getParameter("rname").trim();
	String rphone1 =request.getParameter("rphone1").trim();
	String rphone2 =request.getParameter("rphone2").trim();
	String rphone3 =request.getParameter("rphone3").trim();
	String remail  =request.getParameter("remail").trim();
	String rstat   =request.getParameter("rstat");


	Connection con=null;
	PreparedStatement pstmt=null;
	
	try{
		
		String url     ="jdbc:oracle:thin:@localhost:1521:xe";
		String user    ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);						
		con=DriverManager.getConnection(url, user, password);	
	
	    StringBuilder sql=new StringBuilder();
		sql.append(" INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)");
		sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, rno);
		pstmt.setString(2, rjumin);
		pstmt.setString(3, rname);
		pstmt.setString(4, rphone1);
		pstmt.setString(5, rphone2);
		pstmt.setString(6, rphone3);
		pstmt.setString(7, remail);
		pstmt.setString(8, rstat);
		pstmt.setString(9, tcode);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>예약등록이 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("    alert('예약등록이 완료되었습니다~');");
			out.println("    location.href='travelList.jsp';");
			out.println("</script>");
		}//if end

		
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}finally {
	    try {
	        if(pstmt!=null) {pstmt.close();}
	    }catch (Exception e) {}            
	    try {
	          if(con!=null) {con.close();}
	    }catch (Exception e) {}
	}//end
%>		            
	<!-- 본문끝 -->
	</section>
	<footer>
		<p>
		    HRDKOREA Copyright&copy;2018 All rights reserved.
    	    Human Resources Development Service of Korea
    	</p>
	</footer>
</body>
</html>