<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%-- ssi.jsp 공통페이지 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.notice.*" %>

<jsp:useBean id="dao" class="net.notice.NoticeDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.notice.NoticeDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8"); %>

<%
	//검색--------------------------------------------------------
	String word=request.getParameter("word");
	String col =request.getParameter("col");	//검색칼럼
	word=Utility.checkNull(word); //문자열이 null이면 빈문자열로 치환
	col=Utility.checkNull(col);
	
	//현재페이지----------------------------------------------------
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){ //페이지가 null이 아니면
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
%>