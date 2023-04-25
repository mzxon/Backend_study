<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 findID.jsp-->
<h3>* 아이디/비번 찾기 *</h3>
<div class="container">
<form method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()"><!-- myscript.js -->
	<table border="1" class="table" style="margin:auto; width:280px">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="mname" id="mname" placeholder="이름" maxlength="20" required>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="email" name="email" id="email" placeholder="이메일" maxlength="20" required>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="아이디/비번찾기" class="btn btn-success">
			<input type="reset" name="취소" class="btn btn-danger">
		</td>
	</tr>
	</table>
</form>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>