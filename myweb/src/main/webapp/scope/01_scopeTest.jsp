<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01_scopeTest</title>
</head>
<body>
	
	<h3>내장객체 및 내부변수</h3>
<%
/*
	● [JSP 내장객체]
	  - JSP페이지가 서블릿에서 변환될때(.class) JSP컨테이너(Tomcat웹서버)가 자동적으로 제공
	  - JSP페이지 내에서 제공하는 특수한 레퍼런스(참조) 타입의 변수
	  - 객체 생성 없이 바로 사용할 수 있는 JSP의 객체
		
	  1)out				: 출력객체             
	  2)pageContext		: JSP페이지 자체의 Context 제공
	  3)request			: 요청에 관한 정보
	  4)response		: 응답에 관한 정보 (out보다 다이나믹)
	  5)session			: 요청에 관한 Context 제공
	  6)application		: 서블릿 및 외부 환경 정보 Context제공
---------------------------------------------------------------------------

	● [Scope의 종류]
	  - myweb 프로젝트내에서 페이지들간에 값을 공유하기 위해서 사용
	  1)pageContext : 현재 페이지에서만 유효(다른페이지에서는 x), 기본값
	  2)request		: 부모페이지와 자식페이지에서만 유효 (부른페이지:부모, 불러진페이지:자식)
	  3)session		: myweb프로젝트의 모든 페이지에서 유효 (사용자 개별 접근, 시간) -> 시간이 항상 함께
	  4)application : myweb르로젝트의 모든 페이지에서 유효 (모든 사용자 접근, 서버 정보)
	  
--------------------------------------------------------------------------

	● [내부변수 선언 형식] - 별도의 자료형이 없다.
	  1)pageContext.setAttribute("변수명", 값);
	  2)request.setAttribute("변수명", 값);
	  3)session.setAttribute("변수명", 값);
	  4)application.setAttribute("변수명", 값);
	  

	● [내부변수값 가져오기]
	  1)pageContext.getAttribute("변수명");
	  2)request.getAttribute("변수명");
	  3)session.getAttribute("변수명");
	  4)application.getAttribute("변수명");
	  	
--------------------------------------------------------------------------
*/

	//각 내부변수에 값 올리기
	pageContext.setAttribute("kor", 100);
	request.setAttribute("eng", 100);
	session.setAttribute("mat", 100);
	application.setAttribute("uname", "ITWILL");

	
	//내부 변수값 가져오기
	out.println(pageContext.getAttribute("kor"));
	out.println("<hr>");
	out.println(request.getAttribute("eng"));
	out.println("<hr>");
	out.println(session.getAttribute("mat"));
	out.println("<hr>");
	out.println(application.getAttribute("uname"));
	out.println("<hr>");
	  
	
	Object obj=pageContext.getAttribute("kor");
	int kor=(int)obj;
	int eng=(int)request.getAttribute("eng");
	int mat=(int)session.getAttribute("mat");
	String uname=(String)application.getAttribute("uname");
	
	out.print("1)pageContext 영역 : " + kor + "<hr>");
	out.print("2)request 영역 : " + eng + "<hr>");
	out.print("3)session 영역 : " + mat + "<hr>");
	out.print("4)application 영역 : " + uname + "<hr>");
	  
	  
	//내부 변수 삭제
	pageContext.removeAttribute("kor");
	request.removeAttribute("eng");
	session.removeAttribute("mat");
	application.removeAttribute("uname");
	  
	//null값 반환
	out.print("<p>* SCOPE영역 변수 삭제 후 *</p>");
	out.print("1)pageContext 영역 : " + pageContext.getAttribute("kor") + "<hr>");
	out.print("2)request 영역 : " + request.getAttribute("eng") + "<hr>");
	out.print("3)session 영역 : " + request.getAttribute("mat") + "<hr>");
	out.print("4)application 영역 : " + application.getAttribute("uname") + "<hr>");
	    
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  	
%>


</body>
</html>