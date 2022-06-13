<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/manager.css" />
<style>
</style>
</head>
<div class="manager-leftmenuWrap">
	<nav class="manager-leftmenu">
		<div class="userprofileBox">
			<img class="userprofile" src="/images/home/girl1.jpg">
			<div class="nick-wrap">
				<h2 id="nick">${sessionScope.member.memberNick}</h2>
			</div>
		</div>
		<ul class="menu-list-wrap">
			<li class="menu-list"><a class="manager-menu" href="/manaMember.do?reqPage=1&selectNum=0">회원관리</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaPayment.do?reqPage=1&selectNum=0">주문관리</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaExpert.do?reqPage=1&selectNum=0">전문가승인</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaReport.do?reqPage=1&selectNum=0">신고모니터링</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaQuestion.do?reqPage=1&selectNum=0">1:1상담</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaNotice.do?reqPage=1">공지사항</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaFAQ.do?reqPage=1&selectNum=0">FAQ</a></li>
			<li class="menu-list"><a class="manager-menu" href="/manaChart.do">통계</a></li>
		</ul>
	</nav>
</div>
<body>

</body>
</html>