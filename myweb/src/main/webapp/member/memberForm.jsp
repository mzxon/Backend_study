<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 memberForm.jsp-->
<div class="container">
<h3>* 회/원/가/입 *</h3>

<span style="color:red; fon-weight:bold">* 필수입력</span>
<br>

<form name="memfrm" id="memfrm">
<table class="table" style="background-color:white;">
<tr>
	<th>*아이디</th>
	<td style="text-align:left">
		<input type="text" name="id" id="id" size="10" maxlength="10" readonly>
		<input type="button" value="ID중복확인" onclick="idCheck()">
	</td>
</tr>
<tr>
	<th>*비밀번호</th>
	<td style="text-align:left">
		<input type="text" name="passwd" id="passwd" size="10" maxlength="10">
	</td>
</tr>
<tr>
	<th>*비밀번호 확인</th>
	<td style="text-align:left">
		<input type="text" name="repasswd" id="repasswd" size="10" maxlength="10">
	</td>
</tr>
<tr>
	<th>*이름</th>
	<td style="text-align:left">
		<input type="text" name="mname" id="mname" size="20" maxlength="20" required>
	</td>
</tr>
</table>
</form>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>