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
                      <li><a href="#">법률/세무</a><ul role="menu" class="sub-menu2">
                        <li><a href="#">변호사</a></li>
                        <li><a href="#">노무사</a></li>
                        <li><a href="#">변리사</a></li>
                        <li><a href="#">법무사</a></li>
                        <li><a href="#">행정사</a></li>
                        <li><a href="#">세무사</a></li>
                        </ul>
                      </li>
                      <li><a href="#">비즈니스</a>
                      <ul role="menu" class="sub-menu2">
                        <li><a href="#">회계사</a></li>
                        <li><a href="#">관세사</a></li>
                        <li><a href="#">번역/통역</a></li>
                        <li><a href="#">디자인</a></li>
                        <li><a href="#">경영/컨설팅</a></li>
                        <li><a href="#">유통관리</a></li>
                        <li><a href="#">가맹점창업</a></li>
                        <li><a href="#">스마트스토어 사업</a></li>
                        <li><a href="#">엑스퍼트 사업</a></li>
                        <li><a href="#">원산지 관리</a></li>
                        <li><a href="#">원가 분석</a></li>
                        <li><a href="#">물류관리</a></li>
                      </ul>
                    </li>
                      <li><a href="#">심리/헬스
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">마음건강</a></li>
                          <li><a href="#">MBTI</a></li>
                          <li><a href="#">에니어그램</a></li>
                          <li><a href="#">영양/다이어트</a></li>
                          <li><a href="#">명상</a></li>
                          <li><a href="#">육아</a></li>
                          <li><a href="#">청소년</a></li>
                          <li><a href="#">가족</a></li>
                        </ul>
                      </a></li>
                      <li><a href="#">학습
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">대학교학습</a></li>
                          <li><a href="#">고등학교학습</a></li>
                          <li><a href="#">중학교학습</a></li>
                          <li><a href="#">입시/진학</a></li>
                          <li><a href="#">해외유학</a></li>
                          <li><a href="#">초등학교학습</a></li>
                          <li><a href="#">유아학습</a></li>
                        </ul>
                      </a></li>
                      <li><a href="#">금융</a>
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">자산컨설팅</a></li>
                          <li><a href="#">부동산컨설팅</a></li>
                          <li><a href="#">손해사정</a></li>
                          <li><a href="#">경제동향/전망</a></li>
                          <li><a href="#">감정평가</a></li>
                          <li><a href="#">온라인 마케팅</a></li>
                          <li><a href="#">신용상담</a></li>
                        </ul>
                      </li>
                      <li><a href="#">라이프
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">패션/스타일</a></li>
                          <li><a href="#">인테리어</a></li>
                          <li><a href="#">반려동물 관리</a></li>
                          <li><a href="#">반려동물 미용</a></li>
                          <li><a href="#">요리</a></li>
                          <li><a href="#">바리스타</a></li>
                          <li><a href="#">교통사고 분석</a></li>
                          <li><a href="#">자동차수리</a></li>
                          <li><a href="#">건축</a></li>
                        </ul>
                      </a></li>
                      <li><a href="#">취미</a>
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">만들기</a></li>
                          <li><a href="#">미술/디자인</a></li>
                          <li><a href="#">음악/악기</a></li>
                          <li><a href="#">반려식물</a></li>
                          <li><a href="#">포토</a></li>
                          <li><a href="#">방송/영화</a></li>
                          <li><a href="#">뮤지컬/공연</a></li>
                          <li><a href="#">바둑</a></li>
                        </ul>
                      </li>
                      <li><a href="#">어학</a>
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">토익/시험영어</a></li>
                          <li><a href="#">영어</a></li>
                          <li><a href="#">중국어</a></li>
                          <li><a href="#">일본어</a></li>
                          <li><a href="#">프랑스어</a></li>
                          <li><a href="#">기타언어</a></li>
                        </ul>
                      </li>
                      <li><a href="#">레저</a>
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">피트니스</a></li>
                          <li><a href="#">필라테스</a></li>
                          <li><a href="#">요가</a></li>
                          <li><a href="#">골프</a></li>
                          <li><a href="#">댄스</a></li>
                          <li><a href="#">생활스포츠</a></li>
                          <li><a href="#">자전거</a></li>
                          <li><a href="#">낚시</a></li>
                          <li><a href="#">여행</a></li>
                          <li><a href="#">등산</a></li>
                          <li><a href="#">캠핑</a></li>
                          <li><a href="#">수상스포츠</a></li>
                          <li><a href="#">동계스포츠</a></li>
                          <li><a href="#">레크레이션</a></li>
                          <li><a href="#">유아체육</a></li>
                        </ul>
                      </li>
                      <li><a href="#">IT/테크</a>
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">코딩/IT개발</a></li>
                          <li><a href="#">IT노하우</a></li>
                          <li><a href="#">오피스도구</a></li>
                          <li><a href="#">게임공략</a></li>
                          <li><a href="#">영상 촬영/편집</a></li>
                        </ul>
                      </li>
                      <li><a href="#">자기계발
                        <ul role="menu" class="sub-menu2">
                          <li><a href="#">코칭</a></li>
                          <li><a href="#">취업</a></li>
                          <li><a href="#">공무원시험</a></li>
                          <li><a href="#">자격증시험</a></li>
                          <li><a href="#">글쓰기/논술</a></li>
                        </ul>
                      </a></li>
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
                >원하시는 상담/클래스가 없나요?</a>
            </div>
          </div>
        </div>
      </div>
      <!--/header-bottom-->
    </header>
    <!--/header-->
    <script>
    	$(function(){
    		$(".navbar-toggle").on("click",function(){
    		
    		});
    	});
    </script>
        <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>