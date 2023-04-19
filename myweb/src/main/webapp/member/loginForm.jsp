<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp-->
<div class="container">
<h3>* 로 그 인 *</h3>



<form name="loginfrm" id="loginfrm" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
	<table border="1" class="table" style="margin:auto; width:30%">
	<tr class="success">
		<td>
			<input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
		</td>
		<td rowspan="2">
			<input type="image" src="../images/bt_login.gif">
		</td>
	</tr>
	<tr class="success">
		<td>
			<input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
		</td>
	</tr>
	</table>
</form>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>