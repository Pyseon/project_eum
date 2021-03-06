<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<link rel="stylesheet" href="css/mypage.css" />
</head>
<body>
	<div class="col-lg-4 sidebar-widgets">
		<div class="all-wrap">
				<div class="member-img-wrap">
					<img class="member-img" src="/img/member/${sessionScope.member.memberPicturePath }">
					<div class="nickname">${sessionScope.member.memberNick}</div>
					<h2></h2>
				</div>
			<div class="menu-wrap">
				
				
				<div class="menu-detail"><a href="/Mypage.do?memberNo=${sessionScope.member.memberNo}">내정보</a></div>
				<div class="menu-detail"><a href="/Myproduct.do?memberNo=${sessionScope.member.memberNo}">구매내역</a></div>
				<div class="menu-detail"><a href="/Mywishlist.do?memberNo=${sessionScope.member.memberNo}">찜내역</a></div>
				<div class="menu-detail"><a href="/Myreview.do?memberNo=${sessionScope.member.memberNo}">내리뷰</a></div>
				<div class="menu-detail"><a href="/myQuestionList.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&selectNum=0">1:1 문의 내역</a></div>
				
				<c:if test="${sessionScope.member.grade eq 1 }">
					<div class="menu-detail"><a href="/appExpertList.do?memberNo=${sessionScope.member.memberNo}">전문가 신청내역</a></div>
				</c:if>
				
				<c:if test="${sessionScope.member.grade eq 1}">
					<div class="menu-detail"><a href="/Myproject.do?memberNo=${sessionScope.member.memberNo}">내프로젝트</a></div>
				</c:if>
				
			</div>
		</div>
	</div>
</body>

</html>