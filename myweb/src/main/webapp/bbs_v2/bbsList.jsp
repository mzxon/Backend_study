<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>


<!-- 본문 시작 bbsList.jsp-->
<div class="container">
<h3>* 글목록 *</h3>
<p><a href="bbsForm.jsp">[글쓰기]</a></p>

<table class="table table-hover">	
<thead>
	<tr class="success">
		<th>제목</th>
		<th style="text-align: center">작성자</th>
		<th style="text-align: center">조회수</th>
		<th style="text-align: center">작성일</th>
	</tr>
</thead>
<tbody>
<%
	ArrayList<BbsDTO> list=dao.list2(col, word);
	if(list==null){
		out.println("<tr>");
		out.println("	<td colspan='4'>");
		out.println("	 <strong>관련자료 없음!</strong>");
		out.println("	</td>");
		out.println("</tr>");	
	}else{
	
		
		//오늘 날짜를 문자열 "2023-04-14"만들기
		String today=Utility.getDate();
	
		for(int i=0; i<list.size(); i++){
			dto=list.get(i);
%>
			<tr  class="active">
				<td style="text-align: left">
<%
					//답변이미지 출력
					for(int n=1; n<=dto.getIndent(); n++){
						out.println("<img src='../images/reply.gif'>");
					}
%>
					<a href="bbsRead.jsp?bbsno=
					<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>"><%=dto.getSubject() %></a>
				<!-- 테이블 제목 -->
<%
				//오늘 작성한 글제목 뒤에 new 이미지 출력
				//작성일(regdt)에서 "년월일"자르기
				String regdt=dto.getRegdt().substring(0, 10);
				if(regdt.equals(today)){ //작성일이 오늘날짜	와 같다면
					out.println("<img src='../images/new.gif'>");
				}
				
				//조회수가 10이상이면 hot이미지 출력
				if(dto.getReadcnt()>=10){
					out.println("<img src='../images/hot.gif'>");
				}
				
%>				
				</td>
				
				<td><%=dto.getWname() %></td>
				<td><%=dto.getReadcnt() %></td>
				<td><%=dto.getRegdt().substring(0, 10) %></td>
			</tr>
<%
		}
		
		//글갯수
		int totalRecord=dao.count2(col, word);
		out.println("<tr  class='active'>");
		out.println("	<td colspan='4' style='text-align:center;'>");
		out.println("	  글갯수:<strong> "+ totalRecord + "</strong>");
		out.println("	</td>");
		out.println("</tr>");
		
		
		
		
		
%>
		<!-- 검색시작 -->
		<tr>
			<td colspan="4" style='text-align:center; height:50px;'>
				<form action="bbsList.jsp" onsubmit="return searchCheck()">
				<!-- 나를 다시 부르기 -->		<!-- myscript.js함수 작성 -->
					<select name="col">
						<option value="subject_content">제목+내용
						<option	value="subject">제목
						<option value="content">내용
						<option value="wname">작성자						
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색">
					<!-- 검색어를 입력하지 않으면 서버로 전송 안하게 자바스크립트 -->					
				</form>
			</td>
		</tr>
		<!-- 검색끝 -->
	
	
<%
	}

%>

</tbody>
</table>
</div>



<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>