<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!--장비에 따라서 알아서 적용되도록-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- layout.css import -->
  <link rel="stylesheet" href="css/layout.css">
  
  <!-- moment 오픈소스 import -->
  <script src="js/moment-with-locales.min.js"></script>
  <!-- jQuery import -->
  <script src="js/jquery-3.6.4.min.js"></script>
  
  <style>
  	/* body { background-image:url('images/SE.jpg'); } */
  </style>
</head>



<body>

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a id="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">
      	<img src="images/JJANGlogo.png" style="width:130px"></a><!-- / : 절대경로. 루트에서 찾겠다 -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">        
      	<li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav><!-- 메인 카테고리 끝 -->

<!-- Content 시작 -->
<!-- First Container -->
<div class="container-fluid bg-3 text-center" style="padding-bottom:0px;">
  <img src="images/GU.gif" class="img-responsive img-circle margin" style="display:inline" alt="cat" width="350px">
</div>

<div class="container-fluid bg-1 text-center">
  <div class="row">
    <div class="col-xs-12">
    
    
    <!-- 본문 시작 -->
    <!-- Container (Services Section) -->
	<!-- 스크롤 -->

  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- 순서아이콘 -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- 슬라이드 -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/JJA3.gif" style="width:680px">
      </div>
      <div class="item">
        <img src="images/JJA4.gif" style="width:680px">
      </div>
      <div class="item">
        <img src="images/GU5.gif" style="width:680px">
      </div>
    </div>

    <!-- 오른쪽 왼쪽 컨트롤러 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!-- 본문 끝 -->
    </div><!-- col-xs-12 끝 -->
  </div><!-- row 끝 -->
</div><!-- Second Container 끝 -->
  
        
        
<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
		Copyright &copy; 2023 MyWeb
</footer>

</body>
</html>

