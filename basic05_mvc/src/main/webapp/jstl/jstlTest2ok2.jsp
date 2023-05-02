<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstlTest2ok2.jsp</title>
</head>
<body>

	<h3>* 결과페이지(JSTL) *</h3>

	<c:set var="name" value="${param.name}"></c:set>
	<c:set var="age"  value="${param.age}"></c:set>

	이름 : ${name} / <c:out value="${name}"></c:out> <br>
  	나이 : ${age} /  <c:out value="${age}"></c:out> <br>


	<!-- 조건문 -->
	<c:if test="${name=='itwill'}">무궁화</c:if>
	
	<!-- 다중 조건문 -->
    <c:choose>
    	<c:when test="${age<10}">어린이</c:when>
		<c:when test="${age<20}">청소년</c:when>
		<c:otherwise>성인</c:otherwise>
    </c:choose>
    
    <hr>
    
    <!-- 반복문 -->
    <c:forEach var="a" begin="1" end="${age}" step="1">
		<c:out value="#"></c:out>
	</c:forEach>
    
    <hr>
    
    <c:forEach var="a" begin="1" end="${age}" step="1">
		<c:choose>
			<c:when test="${a%2==0}">
				<span style='color:blue'>${a}</span>
			</c:when>
			<c:when test="${a%2==1}">
				<span style='color:red'>${a}</span>
			</c:when>
		</c:choose>
	</c:forEach>    
    
    <hr>
    
    
     <!-- varStatus="상태용 변수"
    	${vs.current} 현재 for문의 해당하는 번호
		${vs.index} 0부터의 순서
		${vs.count} 1부터의 순서
		${vs.first} 첫 번째인지 여부
		${vs.last} 마지막인지 여부
		${vs.begin} for문의 시작 번호
		${vs.end} for문의 끝 번호
		${vs.step} for문의 증가값
     --> 
     
    <c:forEach var="b" begin="10" end="30" step="10" varStatus="vs">
    	${vs.current} <br>
		${vs.index} <br>
		${vs.count} <br>
		${vs.first} <br>
		${vs.last} <br>
		${vs.begin} <br>
		${vs.end} <br>
		${vs.step}    	
    	<hr>
    </c:forEach>
   
    

</body>
</html>