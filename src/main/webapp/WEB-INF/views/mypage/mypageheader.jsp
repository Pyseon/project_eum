<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage-leftmenuWrap">
	<nav class="mypage-leftmenu">
		<div class="userprofileBox">
			<img class="userprofile" src="/img/member/pngegg.png">
			<h2></h2>
		</div>
		<ul>
			<li><a href="/Mypage.do?memberNo=${sessionScope.member.memberNo}">내정보</a></li>
			<li><a href="/Myproduct.do?memberNo=${sessionScope.member.memberNo}">구매내역</a></li>
			<li><a href="/Mywishlist.do?memberNo=${sessionScope.member.memberNo}">찜내역</a></li>
			<li><a href="/Myreview.do?memberNo=${sessionScope.member.memberNo}">내리뷰</a></li>
			
			<li><a href="/Myproject.do?memberNo=${sessionScope.member.memberNo}">내프로젝트</a></li>
		</ul>
	</nav>
</div>
</body>
</html>