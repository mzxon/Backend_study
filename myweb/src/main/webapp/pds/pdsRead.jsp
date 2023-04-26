<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 pdsRead.jsp-->
<div class="container">
<h3>* 포토갤러리 상세보기 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	dto=dao.read(pdsno);
	if(dto==null){
		out.println("해당 글 없음!");
	}else{
		dao.incrementCnt(pdsno); //조회수 증가
%>
		<table border="1" class="table table-bordered" style="font:13px; background-color:white;">
		<thead>
		<tr>
			<th class="success" style="text-align:center">글제목</th>
			<td colspan="8" class="active" style="text-align:center"><%=dto.getSubject() %></td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th class="active">사진</th>
			<td><img src="../storage/<%=dto.getFilename()%>"></td>
		</tr>
		<tr>
			<th class="active">파일크기</th>
			<td><%=dto.getFilesize() %></td>
		</tr>
		<tr>
			<th class="active">작성자</th>
			<td><%=dto.getWname() %></td>
		</tr>
		<tr>
			<th class="active">작성일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th class="active">조회수</th>
			<td><%=dto.getReadcnt() %></td>
		</tr>
		</tbody>
		</table>
		<br>
		<input type="button" value="삭제" class="btn btn-danger" onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">
<%
	}

%>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>