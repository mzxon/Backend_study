<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckForfm.jsp</title>
</head>
<body>
	<div style="text-align:center">
		<h3>* 이메일 중복 확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
			아이디 : <input type="text" name="email" id="email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">
		
		</form>
	</div>
	
	<script>
		function blankCheck() {
			let email=document.getElementById("email").value;
			email=email.trim();
			if(email.length<5){
				alert("이메일은 5~10글자 이내로 입력해주세요");
				return false;
			}
			return true;
		}
	
	</script>
</body>
</html>