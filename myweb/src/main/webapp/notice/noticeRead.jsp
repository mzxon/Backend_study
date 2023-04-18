<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeRead.jsp-->
<div class="container">
<h3>* 게시판 상세보기 *</h3>
<p>
	<a href="noticeForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a>
</p>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno);
	if(dto==null){
		out.println("해당 글 없음!");
	}else{
		dao.incrementCnt(bbsno); //조회수 증가
%>	

		<table border="1" class="table table-bordered" style="font:13px">
			<thead>
				<tr>
					<th class="success" style="text-align:center">제목</th>
					<td colspan="8" class="active" style="text-align:center"><%=dto.getSubject() %></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="active"><strong>작성자 : </strong><%=dto.getWname() %></td>
					<td class="active"><strong>작성일 : </strong><%=dto.getRegdt() %></td>
					<td class="active"><strong>조회수 : </strong><%=dto.getReadcnt() %></td>
					<td class="active"><strong>IP : </strong><%=dto.getIp() %></td>
				</tr>
			</tbody>
			<tfoot>
			
			
				<tr>
					<td colspan="8" class="active" style="text-align:left">
<%	
				//특수문자 및 엔터를 <br>태그로 치환하기
				String content=Utility.convertChar(dto.getContent()); 
				out.print(content);
%>
					
					
					</td>
				</tr>
			</tfoot>


		</table>
		<br>
		<input type="button" value="답변쓰기" class="btn btn-info" onclick="location.href='noticeReply.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'">
		<input type="button" value="수정" class="btn btn-warning" onclick="location.href='noticeUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'">
		<input type="button" value="삭제" class="btn btn-danger" onclick="location.href='noticeDel.jsp?bbsno=<%=bbsno%>'">




<%
	}
%>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>