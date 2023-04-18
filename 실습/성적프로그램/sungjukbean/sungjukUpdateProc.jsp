<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdateProc.jsp</title>
</head>
<body>
	<div class="container" style="padding:10%; width:900px;">
	<h3>* 성적 상세보기 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	int sno     =Integer.parseInt(request.getParameter("sno"));
	String uname=request.getParameter("uname").trim();
	int kor 	= Integer.parseInt(request.getParameter("kor").trim());
	int eng 	= Integer.parseInt(request.getParameter("eng").trim());
	int mat 	= Integer.parseInt(request.getParameter("mat").trim());
	String addr = request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAddr(addr);
	dto.setSno(sno);//누락
	
	int cnt=dao.update(dto); 
	
	if(cnt==0){
		out.println("<p>성적 수정이 실패했습니다!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a><p>");
	}else{
		out.println("<script>");
		out.println("	alert('성적이 수정되었습니다!');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지 이동
		out.println("</script>");
	}
	
	
%>
	</div>
</body>
</html>