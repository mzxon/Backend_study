<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
	<title>travleBook.jsp</title>
 	
 	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		header{background:navy; color:white; text-align:center;}
		nav	  {text-align:center;}	
		footer{background:olive; color:white; text-align:center;}
	</style>
	<script>
		function validate() {
			//유효성 검사
			
			//1)예약번호 글자 갯수가 8글자 인지 확인
			let rno=document.getElementById("rno").value;
			rno=rno.trim();
			if(rno.length!=8){
				alert("예약번호는 8글자로 입력해주세요~");
				document.getElementById("rno").focus();
				return false;
			}
			
			//2)상품코드를 선택했는지 확인
			let tcode=document.getElementById("tcode").value;
			tcode=tcode.trim();
			if(tcode.length==0){
				alert("상품코드 선택해주세요~");
				return false;
			}

			//3)주민번호가 각각 6글자, 7글자, 숫자형으로 입력되었는지
			let rjumin1=document.getElementById("rjumin1").value;
			rjumin1=rjumin1.trim();
			if(isNaN(rjumin1) || rjumin1.length!=6){
				alert("주민번호 숫자 6글자 입력해 주세요~");
				document.getElementById("rjumin1").focus();
				return false;
			}//if end

			let rjumin2=document.getElementById("rjumin2").value;
			rjumin2=rjumin2.trim();
			if(isNaN(rjumin2) || rjumin2.length!=7){
				alert("주민번호 숫자 7글자 입력해 주세요~");
				document.getElementById("rjumin2").focus();
				return false;
			}//if end
			

			//4)예약자 전화가 각각 3글자, 4글자, 4글자, 숫자형으로 입력되었는지
			let rphone1=document.getElementById("rphone1").value;
			rphone1=rphone1.trim();
			if(isNaN(rphone1) || rphone1.length!=3){
				alert("예약자 전화번호 숫자 3글자 입력해 주세요~");
				document.getElementById("rphone1").focus();
				return false;
			}//if end

			let rphone2=document.getElementById("rphone2").value;
			rphone2=rphone2.trim();
			if(isNaN(rphone2) || rphone2.length!=4){
				alert("예약자 전화번호 숫자 4글자 입력해 주세요~");
				document.getElementById("rphone2").focus();
				return false;
			}//if end

			let rphone3=document.getElementById("rphone3").value;
			rphone3=rphone3.trim();
			if(isNaN(rphone3) || rphone3.length!=4){
				alert("예약자 전화번호 숫자 4글자 입력해 주세요~");
				document.getElementById("rphone4").focus();
				return false;
			}//if end

			
			//5)고객이메일에 @문자가 있는지
			let remail=document.getElementById("remail").value;
			remail=remail.trim();
			if(remail.indexOf("@")==-1){
				alert("고객 이메일 다시 입력해 주세요~");
				document.getElementById("remail").focus();
				return false;
			}//if end
			
			return true; //서버로 전송
		}
	</script>
</head>
<body>
	
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<section>
	<!-- 본문시작 -->
		<div class="container" style="padding:6%; width:90%;">
			<form name="travelfrm" id="travelfrm" method="post" action="travelBookProc.jsp" onsubmit="return validate()" class="form-inline">	
			<table class="table table-striped">
			<tr>
				<th>예약번호</th>	
				<td><input type="text" name="rno" id="rno" size="8" maxlength="8" required class="form-control" style="width:80%" style="width:80%"></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td>
					<select name="tcode" id="tcode" class="form-control" style="width:80%">
						<option value="">상품선택</option>
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
		
		//SQL INSRT문 작성
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT tcode, tarea, tdate ");
		sql.append(" FROM tbl_tourcode_02");
		sql.append(" ORDER BY tcode");
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery();
		if(rs.next()){
			String tname ="";
			do{
				tname += "<option value='" + rs.getString("tcode") + "'>";
				tname += "[" + rs.getString("tcode") +"]";
				tname += rs.getString("tarea") + " ";
				tname += rs.getString("tdate").substring(0, 4) + "-";
				tname += rs.getString("tdate").substring(4, 6) + "-";
				tname += rs.getString("tdate").substring(6);
				tname += " 출발";
				tname += "</option>";
			}while(rs.next());
		
			out.print(tname);
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
					</select>
				</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td>
					<input type="text" name="rjumin1" id="rjumin1" size="6" maxlength="6" required class="form-control" style="width:39%">
               		-
               		<input type="text" name="rjumin2" id="rjumin2" size="7" maxlength="7" required class="form-control" style="width:39%">
				</td>
			</tr>
			<tr>
				<th>예약자성명</th>
				<td><input type="text" name="rname" id="rname" size="20" maxlength="20" class="form-control" style="width:80%"></td>
			</tr>
			<tr>
				<th>예약자전화</th>
				<td>
					<input type="text" name="rphone1" id="rphone1" size="3" maxlength="3" class="form-control" style="width:26%">
					<input type="text" name="rphone2" id="rphone2" size="4" maxlength="4" class="form-control" style="width:26%">
					<input type="text" name="rphone3" id="rphone3" size="4" maxlength="4" class="form-control" style="width:26%">
				</td>
			</tr>
			<tr>
				<th>고객이메일</th>
				<td><input type="text" name="remail" id="remail" size="30" maxlength="30" class="form-control" style="width:80%"></td>
			</tr>
			<tr>
				<th>결제상태</th>
				<td>
					<input type="radio" name="rstat" id="rstat" value="1" checked>미납
					<input type="radio" name="rstat" id="rstat" value="2">완납
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="예약"  class="btn btn-default">
					<input type="reset" value="다시쓰기"  class="btn btn-default">
				</td>
			</tr>
			</table>
			</form>
		</div>
	<!-- 본문끝 -->
	</section>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>