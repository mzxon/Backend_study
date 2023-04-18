<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsDel.jsp-->
<!-- 글번호(bbsno)와 비밀번호(passwd)가 일치하면 삭제 -->
<h3>* 글 삭제 *</h3>
<p><a href="bbslist.jsp">[글목록]</a>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));

%>
<div class="container" style="width:400px">
<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()"><!-- myscript.js -->
	<input type="hidden" name="bbsno" value="<%=bbsno%>"> <!-- 폼에 bbsno도 같이 넘긴다. (사용자에게 보여줄 필요 없으므로 히든) -->
	<table class="table">
		<tr>
			<th class="success">비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="삭제" class="btn btn-danger">
			</td>
		</tr>
	</table>
</form>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>