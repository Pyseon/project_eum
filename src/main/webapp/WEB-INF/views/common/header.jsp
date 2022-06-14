<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- jquery -->
<script src="js/jquery-3.6.0.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="css/default_city.css" />
<link rel="stylesheet" href="css/sweetalert2.min.css" />
<!-- 기본 js -->
<script src="js/default.js"></script>
<script src="js/sweetalert2.all.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/prettyPhoto.css" rel="stylesheet" />
<link href="css/price-range.css" rel="stylesheet" />
<link href="css/animate.css" rel="stylesheet" />
<link href="css/main.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/2fade9eaba.js"
	crossorigin="anonymous"></script>
<!-- 썸머노트 -->
<!-- summer note -->
<script src="js/summernote/summernote-lite.js"></script>
<script src="js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="css/summernote/summernote-lite.css" />
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
<link href="css/font-awesome.min.css" rel="stylesheet" />
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png" />
<style>
#login-btn {
	font-family: fs-regular;
}

#nav-all-category {
	font-family: fs-bold;
	color: #555;
}

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
							<a href="/"> <img src="./img/main-logo-eum.png" alt=""
								style="width: 120px; vertical-align: middle; margin-top: 31px;" />
							</a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<c:choose>
									<c:when test="${empty sessionScope.member }">
										<!-- <a href="/reference.jsp"
											style="font-family: fs-bold; color: #555">전문가 등록</a> -->
										<li></li>
										<li><a href="/joinFrm.do">회원가입</a></li>
										<li>
											<button class="btn bc1 bs6" id="login-btn" type="button"
												onclick="location.href='/loginFrm.do'">로그인</button>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<c:if test="${sessionScope.member.grade eq 2 }">
											<a href="/Expertapply.do"
											style="font-family: fs-bold; color: #555">전문가 등록</a>
											</c:if>
											</li>
											
											<c:choose>
												<c:when test="${sessionScope.member.grade eq 0 }">
													<li><a href="manaMember.do?reqPage=1&selectNum=0">관리자페이지</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="/Mypage.do?memberNo=${sessionScope.member.memberNo}">마이페이지</a></li>
												</c:otherwise>
											</c:choose>
										<li>
											<button class="btn bc2 bs6" id="login-btn" type="button"
												onclick="location.href='/logout.do'">로그아웃</button>
										</li>
									</c:otherwise>
								</c:choose>
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
                  data-target=".navbar-collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </div>
              <div class="mainmenu pull-left">
                <ul class="nav navbar-nav collapse navbar-collapse">
                  <li class="dropdown">
                    <a id="nav-all-category">전체 카테고리<i class="fa fa-angle-down"></i></a>
                    <ul role="menu" class="sub-menu">
                      <li><a href="/ExpertList.do?reqPage=1&selPro=법률">법률/세무</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=비즈니스">비즈니스</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=심리/헬스">심리/헬스</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=학습">학습</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=금융">금융</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=라이프">라이프</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=취미">취미</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=어학">어학</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=레저">레저</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=IT/테크">IT/테크</a></li>
                      <li><a href="/ExpertList.do?reqPage=1&selPro=자기계발">자기계발</a></li>
                    </ul>
                  </li>
                  <li class="mainNav-select"><a href="/ExpertList.do?reqPage=1&selPro=전체">전문가 상담</a></li>
                  <li class="mainNav-select"><a href="/ClassList.do?reqPage=1&selPro=전체">클래스</a></li>
                  <li class="mainNav-select"><a href="/IdeamarketList.do?reqPage=1&selPro=전체">지식마켓</a></li>
                  <li class="mainNav-select"><a href="/communityList.do?category=2&reqPage=1">커뮤니티</a></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-3" style="text-align: right">
              <a href="/requestList.do?reqPage=1&selReq=전체" class="fc-1">원하시는 상담/클래스가 없나요?</a>
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
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>

</body>
</html>