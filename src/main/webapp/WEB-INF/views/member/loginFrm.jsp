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
      .container2{
      	margin: 0 auto;
      	width: 60%;
      }
      .login-form{
      	margin: 0 auto;
      }
      .login-form>fieldset>input{
      	align-content: center;
      	text-align: center;
      }
      .login-form>fieldset{
      	margin: 0 auto;
      	margin-top: 20%;
      	width: 40%;
      }
    </style>
</head>
<body>
<div class="header-middle">
	<div class="container">
          <div class="row">
            <div class="col-sm-4">
              <div class="logo pull-left">
                <a href="/"
                  ><img src="./img/main-logo-eum.png" alt="" style="width: 120px; vertical-align: middle; margin-top: 31px;"
                /></a>
              </div>
            </div>
            <div class="col-sm-8">
              <div class="shop-menu pull-right">
                <ul class="nav navbar-nav">
                  <li>
                    <a href="/reference.jsp" style="font-family: fs-bold; color: #555"><a href="/login.do"/>임시로그인</a></a>
                  </li>
                  <li>
                    <a href="#">회원가입</a>
                  </li>
                  <li>                   
                    <button class="btn bc1 bs6" id="login-btn" type="button" onclick="location.href='/loginFrm.do'">로그인</button>       
                  </li>
                </ul>
              </div>
          	</div>
        </div>
    </div>
</div>
<hr>
<div class="container2">
	<form class="login-form" action="/login.do" method="post">
		<fieldset>
			<input type="text" class="input-form" name="memberId" placeholder="이메일을 입력해주세요."><br>
			<input type="text" class="input-form" name="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			<button class="btn bc1 bs4" type="submit">로그인</button>
		</fieldset>
	</form>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>