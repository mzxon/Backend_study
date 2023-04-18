<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>07_form.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		function validate(){
			//alert();
			//이름 5~20글자 이내에서 입력해야만 서버로 전송(07_ok.jsp)
			let uname=document.getElementById("uname").value;
			uname=uname.trim();
			if(uname.length<5 || uname.length>20){
				alert("이름 5~20글자 이내에서 입력해주세요");
				return false;
			}
			return true;
		}
	</script>
	
	
	
</head>
<body>

	<div class="container">
	<h3>* 성적 입력 *</h3>
	<form name="sungjukfrm" id="sungjukfrm" method="post" action="07_ok.jsp" onsubmit="return validate()">
		<!-- action: 결과페이지를 .jsp로 받겠다(서버가 받는 방식) onsubmit:리턴값을 가짐(자바스크립트나 jquery로 만들어서 리턴)-->
		이름 : <input type="text" name="uname" id="uname" maxlength="20" placeholder="이름" required class="form-control">
		<hr>
		국어 : <input type="number" name="kor" id="kor" size="5" min="0" max="100" class="form-control">
		      <!-- size=상자 크기, maxlength=입력 크기 --><!-- 0~100까지 입력가능 -->
		<hr>
		영어 : <input type="number" name="eng" id="eng" size="5" min="0" max="100" class="form-control">
		<hr>
		수학 : <input type="number" name="mat" id="mat" size="5" min="0" max="100" class="form-control">
		<hr>
		<input type="submit" value="전송" class="btn btn-success">
		<input type="reset" value="취소" class="btn">
	</form>
	</div>
	<!-- 
		● [<form> 관련 다양한 속성들]
		  사용자가 입력한 정보를 서버로 전송하기 위한 양식
		  name 	  : 폼이름. 	 	  서버에서 식별하기 위한 이름
		  id      : 폼아이디.	 	  Frontend단에서 식별자로 주로 사용
		  method  : 폼 전송방식.	 	  get | post 방식. 생략시 기본은 get방식
		  action  : 사용자가 요청한 정보(폼)를 서버가 받아서 처리할 결과페이지
		  enctype : 폼에서 파일을 첨부해서 서버로 전송하고자 할때 "multipart/form-data" 추가
	 
	 	● [폼 전송방식]
	 
	 	  1) method=get 방식
	 	  	 - 생략시 기본값
	 	  	 - 사용자가 입력 요청한 정보가 URL 그대로 노출
	 	  	 - 한글 안깨짐
	 	  	 - ok.jsp?서버로 전송되는 값들
	 	  	   형식)요청페이지(또는 명령어)?변수=값&변수=값&변수=값~~
	 	  	   	   예)ok.jsp?uname=대한민국&kor=80&eng=60&mat=50
	 	  	 - 예) 검색어
	 	  	 
	 	  2) method=post 방식
	 	  	 - 사용자가 요청한 정보가 URL에 노출되지 않고 패키지화 되어서 서버로 전송
	 	  	 - Tomcat 9이하 버전에서는 한글 깨짐
	 	  	 - 예) 비번, 주민번호, 카드번호 등
	 -->	
	
</body>
</html>