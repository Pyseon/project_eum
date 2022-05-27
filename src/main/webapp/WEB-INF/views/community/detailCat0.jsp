<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
	 <div class="article-wrap">
		<!-- article-header -->
		<div class="article-header">
			<div class="article-list">
				<a href="/communityList.do?category=0&reqPage=1" class="fc-7">요즘 뭐하니 ></a>
			</div>
			<div class="article-title">
				<h2 style="font-size: 26px">${cm.commTitle}</h2>
			</div>
			<div class="article-profile"></div>
			<div class="info-box border-down">
				<div class="writer-info">
					<div class="card-user-img-wrap fll">
						<img class="card-user-img" src="./img/toeic.png"
							style="width: 40px; height: 40px;" />
					</div>
					<div class="nick-box">
						<span class="writer-nick"><strong style="font-size: 15px">${cm.memberNick }</strong></span>
						
						<span class="material-icons verified-icon">verified</span>
					</div>
					<div class="article-date">
						<span class="date fc-11">${cm.commDate }</span> <span
							class="article-info"><span class="fc-3" style="margin-left: 10px;">조회수 </span> <span class="num fc-3">${cm.readCount }</span>
						</span>
					</div>
				</div>
				<div class="article-info-box">
					<span class="article-info"> <i class="fa-regular fa-heart"></i>
						<i class="fa-solid fa-heart"></i> <span>좋아요</span> <strong
						class="num">${cm.commLike }</strong>
					</span> <span class="article-info"> <i
						class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
						class="num">${cm.cmntCount }</strong>
					</span>
				</div>
			</div>
		</div>
		<!-- article-content -->
		<div class="article-content-wrap">
			<div class="article-intro">
				<i class="fa-solid fa-circle-question"></i> <span
					class="title-text fs-medium fc-10">요즘 뭐하니?</span>
				<p>${cm.commIntro }</p>
			</div>
			<div class="attr-wrap">
				<!-- ADVANTAGE -->
				<div class="attr-box">
					<div class="attr-title">
						<i class="fa-regular fa-thumbs-up fc-7"></i> <span class="fc-2">이런
							분들에게 추천해요!</span>
					</div>
					<div class="attribute adv">
						<i class="fa-regular fa-face-laugh-squint attr-icon"></i> <span>자신감
							상승 뜸뿍자신감 상승 뜸뿍자신감 상승 뜸뿍자신감 상승 뜸뿍자신감 상승 뜸뿍자신감 상승 뜸뿍</span>
					</div>
					<div class="attribute adv">
						<i class="fa-regular fa-face-laugh-squint attr-icon"></i> <span>자신감
							상승 뜸뿍</span>
					</div>
					<div class="attribute adv">
						<i class="material-icons attr-icon">task_alt</i> <span>자신감
							상승 뜸뿍</span>
					</div>
					<div class="attribute adv">
						<i class="material-symbols-outlined attr-icon">select_check_box</i>
						<span>자신감 상승 뜸뿍</span>
					</div>
				</div>

				<!-- WEAKNESS -->
				<div class="attr-box">
					<div class="attr-title">
						<i class="fa-regular fa-thumbs-down fc-9 attr-thumbs"></i> <span
							class="fc-2">이런 분들에게 비추해요!</span>
					</div>
					<div class="attribute weak">
						<i class="fa-regular fa-face-sad-tear attr-icon"></i> <span>자신감
							상실.............</span>
					</div>
					<div class="attribute weak">
						<i class="material-symbols-outlined attr-icon">select_check_box</i>
						<span>자신감 상실.............</span>
					</div>
					<div class="attribute weak">
						<i class="material-icons attr-icon">task_alt</i> <span>자신감
							상실.............</span>
					</div>
				</div>
			</div>

			<div class="article-cotent">${cm.commContent }</div>
			<div class="report-wrap">
				<i class="material-symbols-outlined">e911_emergency</i> <span>신고하기</span>
			</div>
		</div>
		</div>
		<!--article-content-wrap end-->

		<!-- comment start -->
		<div class="article-bottom info-box">
			<div class="comments-info">
				<i class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
					class="num">${cm.cmntCount }</strong>
			</div>
		</div>
		<!--comment-->
		<div class="comments-area">
			<div class="comment-list">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="thumb">
							<img src="img/blog/c1.jpg" alt="" class="card-user-img" />
						</div>
						<div class="desc">
							<span class="writer-nick">
								<strong style="font-size: 15px">코딩의신</strong>
							</span>
							<span class="material-icons verified-icon">verified</span>
							<p class="comment">안녕하세요 아름다운 밤이에요.</p>
							<p class="date fs-light">2022.05.26. 15:34</p>
						</div>
					</div>
					<div class="reply-btn">
						<a href="" class="btn-reply">답글쓰기</a>
					</div>
				</div>
			</div>
			<!--comment end-->
			<!--Re-comment-->
			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="thumb">
							<img src="img/blog/c2.jpg" alt="" class="card-user-img" />
						</div>
						<div class="desc">
							<span class="writer-nick">
							 <strong style="font-size: 15px">코린이</strong>
							</span>
							<p class="comment">안녕하세요 아름다운 밤이에요.</p>
							<p class="date fs-light">2022.05.26. 15:34</p>
						</div>
					</div>
					<div class="reply-btn">
						<a href="" class="btn-reply text-uppercase">답글쓰기</a>
					</div>
				</div>
			</div>
			<!--Re-comment end-->
		</div>
		<!--comment-area-->
		<!-- comment end -->
	</div>
	<!--container end-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>