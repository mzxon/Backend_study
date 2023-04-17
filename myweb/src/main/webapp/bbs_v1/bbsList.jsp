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
	ArrayList<BbsDTO> list=dao.list();
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
					<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject() %></a>
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
				
				//답변게시글 수 표현하기
				int cntreply=dao.cntreply(dto);
				out.println("("+cntreply+")");
				
				
%>				
				</td>
				
				<td><%=dto.getWname() %></td>
				<td><%=dto.getReadcnt() %></td>
				<td><%=dto.getRegdt().substring(0, 10) %></td>
			</tr>
<%
		}
		
		//글갯수
		int totalRecord=dao.count(dto);
		out.println("<tr  class='active'>");
		out.println("	<td colspan='4' style='text-align:center;'>");
		out.println("	  글갯수:<strong> "+ totalRecord + "</strong>");
		out.println("	</td>");
		out.println("</tr>");
	}

%>

</tbody>
</table>
</div>



<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>