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
<!-- 기본 CSS -->
<link rel="stylesheet" href="css/default_city.css" />
<link rel="stylesheet" href="css/sweetalert2.min.css" />
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
                <a href="#" style="font-family: fs-bold; color: #555"
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
   <div class="page-content">
      <div class="flex-wrap">
         <div>
            <h2>폰트</h2>
            <div class="fs-thin">가나다 abc ABC 0123</div>
            <div class="fs-light">가나다 abc ABC 0123</div>
            <div class="fs-regular">가나다 abc ABC 0123</div>
            <div class="fs-medium">가나다 abc ABC 0123</div>
            <div class="fs-bold">가나다 abc ABC 0123</div>
            <div class="fs-full">가나다 abc ABC 0123</div>
         </div>
         <div>
            <h2>글씨 색</h2>
            <div class="fc-1">가나다 fc-1 ABC 0123</div>
            <div class="fc-2">가나다 fc-2 ABC 0123</div>
            <div class="fc-3">가나다 fc-3 ABC 0123</div>
            <div class="fc-4">가나다 fc-4 ABC 0123</div>
            <div class="fc-5">가나다 fc-5 ABC 0123</div>
            <div class="fc-6">가나다 fc-6 ABC 0123</div>
            <div class="fc-7">가나다 fc-7 ABC 0123</div>
            <div class="fc-8">가나다 fc-8 ABC 0123</div>
            <div class="fc-9">가나다 fc-9 ABC 0123</div>
            <div class="fc-10">가나다 fc-10 ABC 0123</div>
         </div>
         <div>
            <h2>배경 색</h2>
            <div class="bg-1 bg">bg-1 bg #333333</div>
            <div class="bg-2 bg">bg-2 bg #555555</div>
            <div class="bg-3 bg">bg-3 bg #666666</div>
            <div class="bg-4 bg">bg-4 bg #a7a7a7</div>
            <div class="bg-5 bg">bg-5 bg #fff</div>
            <div class="bg-6 bg">bg-6 bg #1abc9c</div>
            <div class="bg-7 bg">bg-7 bg #3865f2</div>
            <div class="bg-8 bg">bg-8 bg #cadbee</div>
            <div class="bg-9 bg">bg-9 bg #f05454</div>
            <div class="bg-10 bg">bg-10 bg #ff990d</div>
            <div class="bg-11 bg">bg-11 bg #f2b81f</div>

         </div>
      </div>
      <div>
         <h2>벨트</h2>
         <h3 class="belt">NOTICE</h3>
      </div>
      <br />
      <div>
         <h2>테이블 디자인</h2>
         <h3>tbl</h3>
         <table class="tbl">
            <tr class="tr-1">
               <th>ththth-1</th>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
            </tr>
            <tr class="tr-2">
               <th>ththth-2</th>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
            </tr>
            <tr class="tr-3">
               <th>ththth-3</th>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
            </tr>
            <tr class="tr-4">
               <th>ththth-4</th>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
            </tr>
            <tr class="tr-5">
               <th>ththth-5</th>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
            </tr>
         </table>
         <h3>tbl tbl-hover</h3>
         <table class="tbl tbl-hover">
            <tr class="tr-1">
               <th>ththth-1</th>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
               <td>tdtdtd-1</td>
            </tr>
            <tr class="tr-2">
               <th>ththth-2</th>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
               <td>tdtdtd-2</td>
            </tr>
            <tr class="tr-3">
               <th>ththth-3</th>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
               <td>tdtdtd-3</td>
            </tr>

            <tr class="tr-5">
               <th>제목</th>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
               <td>tdtdtd-5</td>
            </tr>
            <tr class="tr-4">
               <th>내용내용</th>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
               <td>tdtdtd-4</td>
            </tr>
   
         </table>
      </div>
      <br />
      <div>
         <h2>버튼디자인</h2>
         <h3>버튼색</h3>
         <button class="btn bc1">bc1</button>
         <button class="btn bc2">bc2</button>
         <button class="btn bc3">bc3</button>
         <button class="btn bc4">bc4</button>
         <button class="btn bc5">bc5</button>
         <button class="btn bc6">bc6</button>
         <button class="btn bc7">bc7</button>
         <button class="btn bc8">bc8</button>
         <hr />
         <h3>버튼크기</h3>
         <button class="btn bc1 bs1">size1</button>
         <button class="btn bc1 bs2">size2</button>
         <button class="btn bc1 bs3">size3</button>
         <button class="btn bc1 bs4">size4</button><hr />
         <button class="btn bc1 bs5">size5</button>
         <button class="btn bc1 bs6">size6</button>
         <button class="btn bc1 bs7">size7</button>
      </div>
      <div>
         <h3>이미지 사이즈</h3>
         <img class="img-0 bc1">size1</img>
         <img class="img-1 bc2">size2</img>
      </div>
      <br />
      <div>
         <h2>입력양식</h2>
         <input type="text" class="input-form" placeholder="input" /> <br>
         <select class="input-form">
            <option>value1</option>
            <option>value2</option>
            <option>value3</option>
         </select>
         <textarea class="input-form" placeholder="textarea"></textarea>
         <input type="text" class="input-form" placeholder="disabled" disabled />
         <input type="text" class="input-form" placeholder="readonly" readonly />
      </div>
      <br />
      <div>
         <h2>페이지처리</h2>

         <ul class="pagination circle-style">
            <li><a class="page-item" href="#"><span
                  class="material-icons">keyboard_double_arrow_left</span></a></li>
            <li><a class="page-item" href="#"><span
                  class="material-icons">chevron_left </span></a></li>
            <li><a class="page-item" href="#">1</a></li>
            <li><a class="page-item" href="#">2</a></li>
            <li><a class="page-item" href="#">3</a></li>
            <li><a class="page-item active-page" href="#">4</a></li>
            <li><a class="page-item" href="#">5</a></li>
            <li><a class="page-item" href="#"><span
                  class="material-icons"> chevron_right </span></a></li>
            <li><a class="page-item" href="#"><span
                  class="material-icons">keyboard_double_arrow_right</span></a>
            </li>
         </ul>
      </div>
      <br />
      <div>
         <h2>게시물 표현</h2>
         <div class="posting-wrap">
           <div class="posting-item">
             <div class="posting-img">
               <img src="/project_eum/src/main/webapp/img/toeic.png" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="/project_eum/src/main/webapp/img/hotel_img (10).jpg" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="/project_eum/src/main/webapp/img/hotel_img (9).jpg" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="/project_eum/src/main/webapp/img/bowl-1844894_1920.jpg" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="img/dora.png" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="img/dora.png" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
           <div class="posting-item">
             <div class="posting-img">
               <img src="img/dora.png" />
             </div>
             <div class="posting-content">
               <p>내용내용</p>
               <p>내용내용</p>
             </div>
           </div>
         </div>
       </div>
       <br />
       <div>
         <h2>댓글출력</h2>
           <div class="comments-area">
		      <div class="comment-list">
		        <div class="single-comment justify-content-between d-flex">
		          <div class="user justify-content-between d-flex">
		            <div class="thumb">
		              <img src="img/blog/c1.jpg" alt="" />
		            </div>
		            <div class="desc">
		              <h5><a href="#">Emilly Blunt</a></h5>
		              <p class="date">December 4, 2017 at 3:12 pm</p>
		              <p class="comment">Never say goodbye till the end comes!</p>
		            </div>
		          </div>
		          <div class="reply-btn">
		            <a href="" class="btn-reply text-uppercase">reply</a>
		          </div>
		        </div>
		      </div>
		      <div class="comment-list left-padding">
		        <div class="single-comment justify-content-between d-flex">
		          <div class="user justify-content-between d-flex">
		            <div class="thumb">
		              <img src="img/blog/c2.jpg" alt="" />
		            </div>
		            <div class="desc">
		              <h5><a href="#">Elsie Cunningham</a></h5>
		              <p class="date">December 4, 2017 at 3:12 pm</p>
		              <p class="comment">Never say goodbye till the end comes!</p>
		            </div>
		          </div>
		          <div class="reply-btn">
		            <a href="" class="btn-reply text-uppercase">reply</a>
		          </div>
		        </div>
		      </div>
		      <div class="comment-list left-padding">
		        <div class="single-comment justify-content-between d-flex">
		          <div class="user justify-content-between d-flex">
		            <div class="thumb">
		              <img src="img/blog/c3.jpg" alt="" />
		            </div>
		            <div class="desc">
		              <h5><a href="#">Annie Stephens</a></h5>
		              <p class="date">December 4, 2017 at 3:12 pm</p>
		              <p class="comment">Never say goodbye till the end comes!</p>
		            </div>
		          </div>
		          <div class="reply-btn">
		            <a href="" class="btn-reply text-uppercase">reply</a>
		          </div>
		        </div>
		      </div>
		      <div class="comment-list">
		        <div class="single-comment justify-content-between d-flex">
		          <div class="user justify-content-between d-flex">
		            <div class="thumb">
		              <img src="img/blog/c4.jpg" alt="" />
		            </div>
		            <div class="desc">
		              <h5><a href="#">Maria Luna</a></h5>
		              <p class="date">December 4, 2017 at 3:12 pm</p>
		              <p class="comment">Never say goodbye till the end comes!</p>
		            </div>
		          </div>
		          <div class="reply-btn">
		            <a href="" class="btn-reply text-uppercase">reply</a>
		          </div>
		        </div>
		      </div>
		      <div class="comment-list">
		        <div class="single-comment justify-content-between d-flex">
		          <div class="user justify-content-between d-flex">
		            <div class="thumb">
		              <img src="img/blog/c5.jpg" alt="" />
		            </div>
		            <div class="desc">
		              <h5><a href="#">Ina Hayes</a></h5>
		              <p class="date">December 4, 2017 at 3:12 pm</p>
		              <p class="comment">Never say goodbye till the end comes!</p>
		            </div>
		          </div>
		          <div class="reply-btn">
		            <a href="" class="btn-reply text-uppercase">reply</a>
		          </div>
		        </div>
		      </div>
		    </div>
       </div>
            <br>
            <br>
            <h2>리뷰 댓글</h2>
            <table class="review">
               <tr class="review-info">
                  <td rowspan="3"><img src="img/boy (1).png">
                     <div>1일전</div></td>
                  <td>
                     <div class="star-wrap">
                        <span class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span>4.5</span>
                        <div class="star-on">
                           <div>
                              <span class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span>
                           </div>
                        </div>
                     </div>
                  </td>
                  <td class="review-book-info"><span>객실타입 : </span> <span>스위트</span>
                     <span>| 인원 : </span> <span>성인 2, 소아 1</span> <span>| 김*딩님
                  </span></td>
                  <td>
                     <button class="bc3">삭제</button>
                  </td>
               </tr>
               <tr class="review-content">
                  <td colspan="3">
                     <p>
                        내용내용내용내용내용내용<br> 내용내용내용내용내용내용<br>
                     </p>
                     <div class="review-image"></div>
                  </td>
               </tr>
            </table>
            <table class="review">
               <tr class="review-info">
                  <td rowspan="3"><img src="img/girl (1).png">
                     <div>1개월전</div></td>
                  <td>
                     <div class="star-wrap">
                        <span class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span
                           class="material-icons">star_border</span> <span>4.5</span>
                        <div class="star-on">
                           <div>
                              <span class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span> <span
                                 class="material-icons">star</span>
                           </div>
                        </div>
                     </div>
                  </td>
                  <td class="review-book-info"><span>객실타입 : </span> <span>스위트</span>
                     <span>| 인원 : </span> <span>성인 2, 소아 1</span> <span>| 김*딩님
                  </span></td>
                  <td>
                     <button class="bc3">삭제</button>
                  </td>
               </tr>
               <tr class="review-content">
                  <td colspan="3">
                     <p>
                        내용내용내용내용내용내용<br> 내용내용내용내용내용내용<br> 내용내용내용내용내용내용<br>
                        내용내용내용내용내용내용<br> 내용내용내용내용내용내용<br>
                     </p>
                     <div class="review-image">
                        <img src="img/고해상도 1.jpg"> <img src="img/고해상도 2.jpg">
                        <img src="img/고해상도 3.jpg">
                     </div>
                  </td>
               </tr>
            </table>
         </div>
         <br />
         <div>
            <h2>모달</h2>
            <button class="btn bc3 modal-open-btn" target="#test-modal">
            모달</button>
         </div>
         <br>
         <div>
            <h2>alert 라이브러리</h2>
            <button class="btn bc44" onclick="alertFunc('success')">성공</button>
            <button class="btn bc66" onclick="alertFunc('error')">에러</button>
            <button class="btn bc55" onclick="alertFunc('warning')">경고</button>
            <button class="btn bc88" onclick="alertFunc('info')">정보</button>
         </div>
      </div>
            <!--예약취소 modal 시작-->
            <div id="test-modal" class="modal-bg">
            <div class="modal-wrap">
            <div class="modal-head">
            <h2>예약을 정말로 취소하시겠습니까?</h2>
            <br>
            </div>
            <div class="modal-content">
            <table class="modal-content-tbl">
            <tr>
            <th class="modal-tbl-th">객실정보</th>
            <br>
            <td class="modal-tbl-td">로얄스위트</td>
            </tr>
            <tr>
            <th class="modal-tbl-th">체크인</th>
            <td class="modal-tbl-td">6월15일(수) 15:00</td>
            </tr>
            <tr>
            <th class="modal-tbl-th">체크아웃</th>
            <td class="modal-tbl-td">6월17일(금) 11:00</td>
            </tr>
            <tr>
            <th class="modal-tbl-th">예약정보</th>
            <td class="modal-tbl-td">성인3</td>
            </tr>
            </table>
            </div>
            <div class="modal-foot">
            <p>
            취소 후 다시 예약시 다른 예약이 있는 경우 예약이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
            영업일 2-3일 내로 처리될 예정입니다.
            </p>
            <div class="modal-btns-container">
            <button class="btn bc3" id="modal-btns-item">예약취소</button>
            <button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
            </div>
            </div>
            </div>
            </div>
         </div>
         <!-- 예약취소 modal 끝 -->
     <footer>
     <footer id="footer">
      <!--Footer-->

      <div class="footer-widget">
        <div class="container">
          <div class="row">
            <div class="col-sm-2">
              <div class="single-widget eum_logo">
                <h2></h2>
                <ul class="nav nav-pills nav-stacked">
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-2">
              <div class="single-widget">
                <h2></h2>
                <ul class="nav nav-pills nav-stacked">
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-2">
              <div class="single-widget">
                <h2></h2>
                <ul class="nav nav-pills nav-stacked">
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-2">
              <div class="single-widget customercenter">
                <h2>고객센터</h2>
                <ul class="nav nav-pills nav-stacked">
                  <li>070-0000-0000</li>
                  <li>평일 09:00~16:30</li>
                  <li>주말, 공휴일 휴무</li>
                </ul>
              </div>
            </div>
<div class="col-sm-2">
              <div class="single-widget">
                <h2>이음</h2>
                <ul class="nav nav-pills nav-stacked">
                  <li><a href="#">서비스소개</a></li>
                  <li><a href="#">이음 유튜브</a></li>
                  <li><a href="#">이음 인스타그램</a></li>
                  <li><a href="#">채용정보</a></li>
                </ul>
              </div>
            </div>
            <div class="col-sm-2">
              <div class="single-widget">
                <h2>지원</h2>
                <ul class="nav nav-pills nav-stacked">
                  <li><a href="#">공지사항</a></li>
                  <li><a href="#">자주묻는질문</a></li>
                  <li><a href="#">1:1문의</a></li>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!--/Footer-->
    </footer>
</body>
</html>