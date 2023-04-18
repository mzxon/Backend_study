<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>travleList.jsp</title>
	<style>
		header{background:navy; color:white; text-align:center;}
		nav	  {text-align:center;}
		footer{background:olive; color:white; text-align:center;}
	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<section>
	<div class="container" style="padding:6%; margin:8px; width:100%;">
	<!-- 본문시작 -->
		<h3>여행내역 조회</h3>
		<hr>
        
        <table class="table table-bordered">
        <tr class="warning">
        	<th>예약번호</th>
        	<th>주민번호</th>
        	<th>성명</th>
        	<th>성별</th>
        	<th>전화번호</th>
        	<th>여행상품</th>
        	<th>상태</th>
        	<th>금액</th>
        	<th>수정/삭제</th>
        </tr>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		
		String url     ="jdbc:oracle:thin:@localhost:1521:xe";
		String user    ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);						
		con=DriverManager.getConnection(url, user, password);			
		
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT tbl_reserve_01.tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair ");
	    sql.append("       ,rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat ");
	    sql.append(" FROM tbl_tourcode_02 INNER JOIN tbl_reserve_01 ");
	    sql.append(" ON tbl_tourcode_02.tcode = tbl_reserve_01.tcode ");
	    sql.append(" ORDER BY tbl_reserve_01.tcode ");

	    pstmt=con.prepareStatement(sql.toString());
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	do{
%>    		
				<tr>
                  <td><%=rs.getString("rno") %></td>   <!-- 예약번호 -->      
                  <td><%=rs.getString("rjumin").substring(0,6)+"-"+rs.getString("rjumin").substring(6,13) %></td>   <!-- 주민번호 -->
                  <td><%=rs.getString("rname") %></td>   <!-- 성명 -->
                  <td>
                  <!-- <%=rs.getString("rjumin")%> -->
<%
                  int code=Integer.parseInt(rs.getString("rjumin").substring(6,7));
                  //int rjumin=rs.getString("rjumin").substring(6,7);

                  /*
                  if(rjumin.equals("1")||rjumin.equals("3")){
                     out.print("남자");
                  }else if(rjumin.equals("2")||rjumin.equals("4")){
                     out.print("여자");
                  }//if end
                  */
                  
                  String gender="";
                  switch(code%2) {
                  case 0 : gender="여"; break;
                  case 1 : gender="남"; break;
                  }//switch end
                  
                  out.print(gender);                  
%>
                  
                  </td>   <!-- 성별 -->   
                  <td><%=rs.getString("rphone1")+"-"+rs.getString("rphone2")+"-"+rs.getString("rphone3") %></td>   <!-- 전화번호 -->   
                  <td><%=
                  rs.getString("tcode")+"-"+rs.getString("tarea") +"-"+rs.getString("tdate")+"-"+rs.getString("ttime")+"/"+rs.getString("thotel")+"/"+rs.getString("tair")
                  %></td>   <!-- 여행상품 -->
                  <td>
                  <!-- <%=rs.getString("rstat") %> -->
<%
                  int rstat=Integer.parseInt(rs.getString("rstat"));

                  String stat="";
                  switch(rstat) {
                  case 1 : stat="미납"; break;
                  case 2 : stat="완납"; break;
                  }//switch end
                  
                  out.print(stat);
%>
                  
                  </td>   <!-- 상태 -->
                  <td>
                  <!-- <%="￦"+rs.getString("tmoney")+"원" %> -->
<%
                  
                  //NumberFormat numberFormat = NumberFormat.getInstance();
                  //money = numberFormat.format(돈);
                  
                  int tmoney = Integer.parseInt(rs.getString("tmoney"));
                  DecimalFormat df = new DecimalFormat("###,###");
                  String money = df.format(tmoney);
                  out.print("￦"+money+"원");
%>
                  
                  </td>   <!-- 금액 -->
                  <td>
                  	<input type="button" value="수정" onclick="location.href='travelUpdate.jsp?rno=<%=rs.getString("rno") %>'" class="btn btn-default-inline" >
                  	<input type="button" value="삭제" onclick="location.href='travelDel.jsp?rno=<%=rs.getString("rno") %>'" class="btn btn-default-inline">
                  </td>
               </tr>   
<%
        	}while(rs.next());
        }else{
	        out.println("<tr>");
	        out.println("  <td colspan='5'>글없음!!</td>");
	        out.println("</tr>");
        }//if end	       
	
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}finally {//자원반납(순서주의)
	    try {
	        if(rs!=null) {rs.close();}
	    }catch (Exception e) {}
	    try {
	        if(pstmt!=null) {pstmt.close();}
	    }catch (Exception e) {}            
	    try {
	          if(con!=null) {con.close();}
	    }catch (Exception e) {}
	}//end
%>        
		</table>
	</div>
	<!-- 본문끝 -->       
	</section>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>