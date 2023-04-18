<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsForm.jsp-->
<h3>* 답변쓰기 *</h3>
<p><a href="bbsList.jsp">[글목록]</a></p>							  <!-- 이벤트 발생 -> 자바스크립트 -->
 																  <!-- myscript.js에 함수 작성함 -->
<!-- url('../images/JJANG.png') --> 															
<form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()">
<!-- 부모글 번호 -->
<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
<input type="hidden" name="col" value="<%=col%>">
<input type="hidden" name="word" value="<%=word%>">

<div class="container" style="margin-left:auto; margin-right:auto;">
<table class="table">
<tr>
   <th class="success">작성자</th>
   <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" required></td>
</tr>
<tr>
   <th class="success">제목</th>
   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
</tr>
<tr>
   <th class="success">내용</th>
   <td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
</tr>
<tr>
   <th class="success">비밀번호</th>
   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
</tr>
<tr>
    <td colspan="2" align="center">
       <input type="submit" value="답변쓰기" class="btn btn-success">
       <input type="reset"  value="취소" class="btn btn-danger">
    </td>
</table>
</div>
</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>