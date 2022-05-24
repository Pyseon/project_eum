<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=GFS+Didot&family=Rubik+Moonrocks&display=swap"
      rel="stylesheet"
    />
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css"
      rel="stylesheet"
      type="text/css"
    />
    <!-- 구글 아이콘 -->
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <!-- jquery -->
    <script src="js/jquery-3.6.0.js"></script>
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="css/default_city.css" />
    <link rel="stylesheet" href="css/sweetalert2.min.css" />
    <!-- 기본 js -->
    <script src="js/default.js"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/prettyPhoto.css" rel="stylesheet" />
    <link href="css/price-range.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>
	
<style>
  #login-btn {
    font-family: fs-regular;
  }
</style>
</head>
<body>
	<div class="header-middle">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="/"><img src="./img/main-logo-eum.png" alt=""
							style="width: 120px; vertical-align: middle; margin-top: 31px;" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<li><a href="/instantlogin.do?memberId=admin&memberPw=1555"
								style="font-family: fs-bold; color: #555">임시로그인</a></li>
							<li><a href="/joinFrm.do">회원가입</a></li>
							<li>
								<button class="btn bc1 bs6" id="login-btn" type="button"
									onclick="location.href='/loginFrm.do'">로그인</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>