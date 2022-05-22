<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 : 이음</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<section id="slider">
		<!--slider-->
		<div class="container">
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
								<div class="col-sm-6">
									<h1>
										<span>전문가 상담</span>
									</h1>
									<h2>1:1로 전문가의 노하우, 방법 등을 물어볼 수 있는곳</h2>
									<p>서비스가 필요한 고객과 서비스를 제공하는 전문가를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다.
										맘에 쏙 드는 전문가의 맞춤형 서비스를 받아보세요.</p>
									<button type="button" class="btn bc1 bs3 get">전문가 상담</button>
								</div>
								<div class="col-sm-6">
									<img src="./img/mainpage/indexCounseling.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>클래스</span>
									</h1>
									<h2>각 분야 전문가와 오프라인으로 직접 만나 배워보세요!</h2>
									<p>자신이 원하는 분야가 배우고 싶다면 직접 만나보세요!</p>
									<button type="button" class="btn bc1 bs3 get">클래스</button>
								</div>
								<div class="col-sm-6">
									<img src="./img/mainpage/indexClass.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>커뮤니티</span>
									</h1>
									<h2>요즘뭐하니, 이거어때?</h2>
									<p>자신의 취미를 공유하거나 배워보고 싶은 취미가 있다면 사람들에게 말해보세요!</p>
									<button type="button" class="btn bc1 bs3 get">커뮤니티</button>
								</div>
								<div class="col-sm-6">
									<img src="./img/mainpage/indexCommunity.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>
						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/slider-->
    <hr>
	<div class="container" style="text-align: left;">
		<p class="fs-bold">88개 카테고리에서 원하는 서비스를 찾아보세요!</p>
		<div>
			<table class="cate-icon">
				<tr>
					<td><img src="./img/category/전체.png"><h3>전체</h3></td>
					<td><img src="./img/category/법률.png"><h3>전체</h3></td>
					<td><img src="./img/category/비즈니스.png"><h3>전체</h3></td>
					<td><img src="./img/category/심리_헬스.png"><h3>전체</h3></td>
					<td><img src="./img/category/학습.png"><h3>전체</h3></td>
					<td><img src="./img/category/금융.png"><h3>전체</h3></td>
          			</tr>
          			<tr>
					<td><img src="./img/category/라이프.png"><h3>전체</h3></td>
					<td><img src="./img/category/취미.png"><h3>전체</h3></td>
					<td><img src="./img/category/어학.png"><h3>전체</h3></td>
					<td><img src="./img/category/레저.png"><h3>전체</h3></td>
					<td><img src="./img/category/it.png"><h3>전체</h3></td>
					<td><img src="./img/category/자기개발.png"><h3>전체</h3></td>
				</tr>
			</table>
		</div>
	</div>


</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>