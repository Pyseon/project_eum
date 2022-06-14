<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 : 이음</title>
</head>
<style>
.m-slider-img1{
  background-color: #057cb9;
   background-image: url("./img/mainpage/coun1.png") !important;
  background-position: 65% 50%;
  background-repeat:no-repeat;
	background-size: auto 100%;
    height:450px;
}
.m-slider-img2{
  background-color: #8c6841;
   background-image: url("./img/mainpage/class2.png") !important;
  background-position: 65% 50%;
  background-repeat:no-repeat;
    height:450px;
}
.m-slider-img3{
  background-color: #5a40c8;
   background-image: url("./img/mainpage/comm1.png") !important;
  background-position: 65% 50%;
  background-repeat:no-repeat;
	background-size: auto 100%;
    height:450px;
}

.col-sm-6{
	background-color:transparent;
}
.main-slider-wrap>.col-sm-6:first-child{
	   display:inline-block;
	   width:60%;
	   margin-top: 80px;
	   padding-left:30%;
}
.main-slider-wrap>.col-sm-6:last-child{
		display:inline-block;
	  width:40%; 
	   margin: 0 auto;
}
.f-white{
	color:#fff !important;
}
#slider{
/*
	width: 60%;
	margin:0 auto;
	padding: 3%;
	*/
}
#slider-wrap{
	/*
	 background-color:#4966f5;
	 */ 
}

    .main-img-btn{
        width: 186px;
        height: 46px;
        font-size: 22px;
        margin-top: 40px;
        background-color: transparent;
        border: 2px solid #fff;
        text-align: center;
        
    }  
    
    .main-img-btn:hover{
       cursor: pointer;
        background-color: rgba(255, 255, 255, 0.33) !important;
        transition-duration: 1.5s;
    }

	.cat-img-wrap td img{
		width:80px;
		height:80px;
	}
	.cat-img-wrap>td>button{
		padding: 0 !important;
		border: none !important;
		background: none !important;
	}
	.fa-angle-right{
		padding-right: 100px;
	}
	.fa-angle-left{
		padding-left: 100px;
	}
	
	.fs-bold{
		text-align: center;
    	margin: 50px 0px;
	}
	
	.icon-img {
		width: 80px;
   		height: 80px;
	}
	.img-btn-all-wrap{
		display: flex;
    	justify-content: center;
   		align-items: center;
    	flex-direction: revert;
	}
	.img-btn{
		background: none;
		border: none;
	}
	.img-btn-wrap {
		margin-right: 25px;
	}
	
	.blueAdd{
        filter:invert(31%) sepia(87%) saturate(2886%) hue-rotate(219deg) brightness(98%) contrast(94%);
    }
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- 
<h1><a href="/manaMember.do?reqPage=1&selectNum=0">매니저</a></h1>
	 -->
	<div id=slider-wrap>
		<section id="slider">
			<!--slider-->
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="main-slider-wrap m-slider-img1">

									<div class="col-sm-6">
										<h2>
											<span class="f-white">당신의 고민을</span>
										</h2>
										<h2>
											<span class="f-white">속 시원하게</span>
										</h2>
										<h2>
											<span class="f-white">해결해 드립니다!</span>
										</h2>
										
										<button type="button" class="main-img-btn fc-5" id="expertView">전문가 상담</button>
									</div>
									<div class="col-sm-6">
										<img src="" class="girl img-responsive" alt="" />
									</div>
								</div>

							</div>


							<div class="item">
									<div class="main-slider-wrap m-slider-img2">

									<div class="col-sm-6">
										<h2>
											<span class="f-white">거리두기 끝!!</span>
										</h2>
										<h2>
											<span class="f-white">다 같이 모여서</span>
										</h2>
										<h2>
											<span class="f-white">다양한 사람들과</span>
										</h2>
										<h2>
											<span class="f-white">함께 해요!</span>
										</h2>
										
										<button type="button" class="main-img-btn fc-5" style="margin-top:30px;" id="classView">클래스</button>
									</div>
									<div class="col-sm-6">
										<img src="" class="girl img-responsive" alt="" />
									</div>
								</div>
							</div>

							<div class="item">
									<div class="main-slider-wrap m-slider-img3">

									<div class="col-sm-6">
										<h2>
											<span class="f-white">당신의 일상과 생각을 자유롭게</span>
										</h2>
										<h2>
											<span class="f-white">자유롭게, 다양하게</span>
										</h2>
										<h2>
											<span class="f-white">여러 사람들과 소통해보세요!</span>
										</h2>
										
										<button type="button" class="main-img-btn fc-5" id="communityView">커뮤니티</button>
									</div>
									<div class="col-sm-6">
										<img src="" class="girl img-responsive" alt="" />
									</div>
								</div>
							</div>
						</div>

						<a href="#slider-carousel"
							class="left control-carousel hidden-xs" data-slide="prev"> <i
							class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
			</div>
		</section>
	</div> <!--/slider-->
	<div class="container" style="text-align: left;">
		<h2 class="fs-bold">다양한 카테고리에서 원하는 서비스를 찾아보세요!</h2>
		<div class="img-btn-all-wrap">
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn1" onclick="location.href='/ExpertList.do?reqPage=1&selPro=전체'">
					<img class="icon-img" id="icon-img1" name="전체" src="./img/category/전체.png">
					<img class="icon-img2" src="./img/category/전체b.png" style="display: none">
					<h3 id="icon-name1">전체</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn2" onclick="location.href='/ExpertList.do?reqPage=1&selPro=법률'">
					<img class="icon-img" id="icon-img2" name="법률" src="./img/category/법률.png" >
					<h3 id="icon-name2">법률</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn3" onclick="location.href='/ExpertList.do?reqPage=1&selPro=비즈니스'">
					<img class="icon-img" id="icon-img3" name="비즈니스" src="./img/category/비즈니스.png">
					<h3 id="icon-name3">비즈니스</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn4" onclick="location.href='/ExpertList.do?reqPage=1&selPro=심리/헬스'">
					<img class="icon-img" id="icon-img4" name="심리_헬스" src="./img/category/심리_헬스.png">
					<h3 id="icon-name4">심리/헬스</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn5" onclick="location.href='/ExpertList.do?reqPage=1&selPro=학습'">
					<img class="icon-img" id="icon-img5" name="학습" src="./img/category/학습.png">
					<h3 id="icon-name5">학습</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn6" onclick="location.href='/ExpertList.do?reqPage=1&selPro=금융'">
					<img class="icon-img" id="icon-img6" name="금융" src="./img/category/금융.png">
					<h3 id="icon-name6">금융</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn7" onclick="location.href='/ExpertList.do?reqPage=1&selPro=라이프'">
					<img class="icon-img" id="icon-img7" name="라이프" src="./img/category/라이프.png">
					<h3 id="icon-name7">라이프</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn8" onclick="location.href='/ExpertList.do?reqPage=1&selPro=취미'">
					<img class="icon-img" id="icon-img8" name="취미" src="./img/category/취미.png">
					<h3 id="icon-name8">취미</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn9" onclick="location.href='/ExpertList.do?reqPage=1&selPro=어학'">
					<img class="icon-img" id="icon-img9" name="어학" src="./img/category/어학.png">
					<h3 id="icon-name9">어학</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn10" onclick="location.href='/ExpertList.do?reqPage=1&selPro=레저'">
					<img class="icon-img" id="icon-img10" name="레저" src="./img/category/레저.png">
					<h3 id="icon-name10">레저</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn11" onclick="location.href='/ExpertList.do?reqPage=1&selPro=IT/테크'">
					<img class="icon-img" id="icon-img11" name="it" src="./img/category/it.png">
					<h3 id="icon-name11">IT/테크</h3>
				</button>
			</div>
			<div class="img-btn-wrap">
				<button type="button" class="img-btn" id="img_btn12" onclick="location.href='/ExpertList.do?reqPage=1&selPro=자기계발'">
					<img class="icon-img" id="icon-img12" name="자기개발" src="./img/category/자기개발.png">
					<h3 id="icon-name12">자기계발</h3>
				</button>
			</div>
		</div>
	</div>
	
	<hr>
	<div class="recommended_items container">
		<!--recommended_items-->
		<h2 class="fs-bold">인기 있는 상담 &amp; 클래스</h2>
    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
		<c:forEach items="${list}" var="list" varStatus="status">
        <div class="item active">
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="/img/product/ClassList/${list.productImgPath }" />
                  	<h2>${list.productTitle }</h2>
                  <a href="#" class="btn">${list.productIntro}</a><br>
                  ${list.sale }% ${list.cost }원
                </div>
              </div>
            </div>
          </div>
        </div>
    	</c:forEach> 
      </div>
    </div>
  </div>
  <!--/recommended_items-->
  
  	<hr>
	 <div class="recommended_items container">
    <!--recommended_items-->
    <h2 class="fs-bold">신규 클래스</h2>
    <div
      id="recommended-item-carousel"
      class="carousel slide"
      data-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="item active">
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend1.jpg" alt="" />
                  <h2>쉽게배우는 JAVA</h2>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>해당 클래스 바로가기</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend2.jpg" alt="" />
                  <h2>CSS만들기</h2>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>해당 클래스 바로가기</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend3.jpg" alt="" />
                  <h2>jQuery 이렇게만 하면 된다!</h2>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>해당 클래스 바로가기</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend1.jpg" alt="" />
                  <h2>$56</h2>
                  <p>Easy Polo Black Edition</p>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>Add to cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend2.jpg" alt="" />
                  <h2>$56</h2>
                  <p>Easy Polo Black Edition</p>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>Add to cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <img src="images/home/recommend3.jpg" alt="" />
                  <h2>$56</h2>
                  <p>Easy Polo Black Edition</p>
                  <a href="#" class="btn btn-default add-to-cart"
                    ><i class="fa fa-shopping-cart"></i>Add to cart</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a
        class="left recommended-item-control"
        href="#recommended-item-carousel"
        data-slide="prev"
      >
        <i class="fa fa-angle-left"></i>
      </a>
      <a
        class="right recommended-item-control"
        href="#recommended-item-carousel"
        data-slide="next"
      >
        <i class="fa fa-angle-right"></i>
      </a>
    </div>
  </div>
  <!--/recommended_items-->
  
<script>
	//전문가, 클래스, 커뮤니티
	$("#expertView").click(function(){
		window.location.href ='/ExpertList.do?reqPage=1&selPro=전체'
	});	
	$("#classView").click(function(){
		window.location.href ='/ClassList.do?reqPage=1&selPro=전체'
	});
	$("#communityView").click(function(){
		window.location.href ='/commnityList.do?category=2&reqPage=1'
	});	
	
	$(function() {
		$.ajax({
			type : 'GET',
			url : "/indexPageData.do",
			success : function (data){
				
			}
		});
	});
	
	
	$(".icon-img").hover(function(){
        $(this).addClass("blueAdd");
    }, function(){
        $(this).removeClass("blueAdd");
    });
	
</script>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>