<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
	 <div class="article-wrap">
		<!-- article-header -->
		<div class="article-header">
			<div class="article-list">
				<a href="/communityList.do?category=0&reqPage=1" class="fc-7">요즘 뭐하니 ></a>
				<button class="btn bc6 bs5 fc-1" onclick="location.href='communityUpdateFrm.do?commNo=${comm.commNo}'">수정</button>
				<button class="btn bc6 bs5 fc-1" onclick="location.href='communityDelete.do?commNo=${comm.commNo}'">삭제</button>
			</div>
			<div class="article-title">
				<h2 style="font-size: 26px">${comm.commTitle}</h2>
			</div>
			<div class="article-profile"></div>
			<div class="info-box border-down">
				<div class="writer-info">
					<div class="card-user-img-wrap fll">
						<img class="card-user-img" src="./img/member/${comm.memberPicturepath }"
							style="width: 40px; height: 40px;" />
					</div>
					<div class="nick-box">
						<span class="writer-nick"><strong style="font-size: 15px">${comm.memberNick }</strong></span>
						<c:if test="${comm.memberGrade eq 1 }">
						<span class="material-icons verified-icon">verified</span>
						</c:if>
					</div>
					<div class="article-date">
						<span class="date fc-11">${comm.commDate }</span> <span
							class="article-info"><span class="fc-3" style="margin-left: 10px;">조회수 </span> <span class="num fc-3">${comm.readCount }</span>
						</span>
					</div>
				</div>
				<div class="article-info-box">
					<span class="article-info"> <i class="fa-regular fa-heart"></i>
						<i class="fa-solid fa-heart"></i> <span>좋아요</span> <strong
						class="num">${comm.commLike }</strong>
					</span> <span class="article-info"> <i
						class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
						class="num">${comm.cmntCount }</strong>
					</span>
				</div>
			</div>
		</div>
		<!-- article-content -->
		<div class="article-content-wrap">
			<div class="article-intro">
				<i class="fa-solid fa-circle-question"></i> <span
					class="title-text fs-medium fc-10">요즘 뭐하니?</span>
				<p>${comm.commIntro }</p>
			</div>
			<div class="attr-wrap">
				<!-- ADVANTAGE -->
				<div class="attr-box">
					<div class="attr-title bg-7">
						<i class="fa-solid fa-thumbs-up fc-5 attr-thumbs-up"></i> 
						<span class="fc-5">이런분들에게 추천해요!</span>
					</div>
					<c:forTokens var="adv" items="${comm.advantage}" delims="|" varStatus="i" >
						<div class="attribute adv">
							<i class="fa-regular fa-face-laugh-squint adv-icon"></i>
							<span>${adv }</span>
						</div>
					</c:forTokens>
				</div>

				<!-- WEAKNESS -->
				<div class="attr-box">
					<div class="attr-title bg-9">
						<i class="fa-solid fa-thumbs-down fc-5 attr-thumbs-down"></i> <span
							class="fc-5">이런 분들에게 비추해요!</span>
					</div>
				<c:forTokens var="weak" items="${comm.weakness}" delims="|" varStatus="i" >
					<div class="attribute weak">
						<i class="fa-regular fa-face-sad-tear weak-icon"></i>
						<span>${weak }</span>
					</div>
				</c:forTokens>
				</div>
			</div>

			<div class="article-cotent">${comm.commContent }</div>
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
					class="num">${comm.cmntCount }</strong>
			</div>
		</div>
		<div class="comments-area">
		<c:forEach items="${cmntList }" var="cmnt">
			<c:choose>
				<c:when test="${cmnt.cmntLev eq 0 }">
					<!--comment-->
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="./img/member/${cmnt.memberPicturepath }" alt="" class="card-user-img" />
								</div>
								<div class="desc">
									<span class="writer-nick">
										<strong style="font-size: 15px">${cmnt.memberNick }</strong>
									</span>
									<c:if test="${cmnt.memberGrade eq 1 }">
									<span class="material-icons verified-icon">verified</span>
									</c:if>
									<c:if test="${cmnt.memberNo eq comm.memberNo }">
									<span class="reply-writer">작성자</span>
									</c:if>
									<p class="comment">${cmnt.cmntContent }</p>
									<p class="date fs-light">${cmnt.cmntDate }</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply">답글쓰기</a>
							</div>
						</div>
					</div>
			<!--comment end-->
				</c:when>
				<c:when test="${cmnt.cmntLev ne 0 }">
				<!--Re-comment-->
					<div class="comment-list left-padding">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="./img/member/${cmnt.memberPicturepath }" alt="" class="card-user-img" />
								</div>
								<div class="desc">
									<span class="writer-nick">
									 <strong style="font-size: 15px">${cmnt.memberNick }</strong>
									 <c:if test="${cmnt.memberGrade eq 1 }">
									<span class="material-icons verified-icon">verified</span>
									</c:if>
									<c:if test="${cmnt.memberNo eq comm.memberNo }">
									<span class="reply-writer">작성자</span>
									</c:if>
									</span>
									<c:if test="${cmnt.cmntLev eq 1 }">
									<p class="comment">${cmnt.cmntContent }</p>
									</c:if>
									<c:if test="${cmnt.cmntLev eq 2 }">
									<p class="comment"><span class="ref-nick">@${cmnt.cmntRefNick } </span>${cmnt.cmntContent }</p>
									</c:if>
									<p class="date fs-light">${cmnt.cmntDate }</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply text-uppercase">답글쓰기</a>
							</div>
						</div>
					</div>
			<!--Re-comment end-->
				</c:when>
			</c:choose>
		</c:forEach>
		</div>
		<!--comment-area-->
		<!-- comment end -->
	</div>
	<!--container end-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	
</script>


</html>