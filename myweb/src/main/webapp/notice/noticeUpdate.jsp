<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeUpdate.jsp-->
<!-- 글번호가 일치하는 행을 가져와서, 수정폼에 출력하기 -->
<h3>* 게시판 수정 *</h3>
<p>
	<a href="noticeForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a>
</p>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno); //글번호가 일치하는 행을 가져오기
	if(dto==null){
		out.println("해당 글 없음!");
	}else{
%>
		<form name="bbsfrm" id="bbsfrm" method="post" action="noticeUpdateProc.jsp" onsubmit="return bbsCheck()">
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		<input type="hidden" name="col" value="<%=col%>">
		<input type="hidden" name="word" value="<%=word%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		
		<div class="container" style="margin-left:auto; margin-right:auto;">
		<table class="table">
		<tr>
		   <th class="success">작성자</th>
		   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname() %>" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
		   <th class="success">제목</th>
		   <td><input type="text" name="subject" id="subject" value="<%=dto.getSubject() %>" class="form-control" maxlength="100" required></td>
		</tr>
		<tr>
		   <th class="success">내용</th>
		   <td><textarea rows="5"  class="form-control" name="content" id="content"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
		   <th class="success">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="쓰기" class="btn btn-success">
		       <input type="reset"  value="취소" class="btn btn-danger">
		    </td>
		</table>
		</div>
		
		</form>
	


<%
	}
%>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>