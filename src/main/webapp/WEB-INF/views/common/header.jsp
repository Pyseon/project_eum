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
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico" />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="144x144"
      href="images/ico/apple-touch-icon-144-precomposed.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="114x114"
      href="images/ico/apple-touch-icon-114-precomposed.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="72x72"
      href="images/ico/apple-touch-icon-72-precomposed.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      href="images/ico/apple-touch-icon-57-precomposed.png"
    />
    <style>
      #login-btn {
        font-family: fs-regular;
      }
   
      #nav-all-category {
        font-family: fs-bold;
        color: #555;
      }
    </style>
  </head>
  <!--/head-->

  <body>
    <header id="header">
      <!--header-->
      <div class="header-middle">
        <!--header-middle-->
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
                    <a href="/reference.jsp" style="font-family: fs-bold; color: #555"
                      >전문가 등록</a
                    >
                  </li>
                  <li>
                    <a href="#">회원가입</a>
                  </li>
                  <li>
                    <button class="btn bc1 bs6" id="login-btn">로그인</button>
                  </li>
                </ul>
              </div>
              <div class="search_box pull-right">
                <input type="text" placeholder="상담,클래스,지식마켓 검색" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/header-middle-->

      <div class="header-bottom">
        <!--header-bottom-->
        <div class="container">
          <div class="row">
            <div class="col-sm-9">
              <div class="navbar-header">
                <button
                  type="button"
                  class="navbar-toggle"
                  data-toggle="collapse"
                  data-target=".navbar-collapse"
                >
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </div>
              <div class="mainmenu pull-left">
                <ul class="nav navbar-nav collapse navbar-collapse">
                  <li class="dropdown">
                    <a href="#" id="nav-all-category"
                      >전체 카테고리<i class="fa fa-angle-down"></i
                    ></a>
                    <ul role="menu" class="sub-menu">
                      <li><a href="shop.html">법률</a></li>
                      <li><a href="product-details.html">세무</a></li>
                      <li><a href="checkout.html">비즈니스</a></li>
                      <li><a href="cart.html">Cart</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                      <li><a href="login.html">Login</a></li>
                    </ul>
                  </li>
                  <li><a href="404.html">전문가 상담</a></li>
                  <li><a href="404.html">클래스</a></li>
                  <li><a href="contact-us.html">지식마켓</a></li>
                  <li><a href="contact-us.html">커뮤니티</a></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-3" style="text-align: right">
              <a href="login.html" class="fc-1"
                >원하시는없나요? 개설요청을 하세요!</a
              >
            </div>
          </div>
        </div>
      </div>
      <!--/header-bottom-->
    </header>
    <!--/header-->
</body>
</html>