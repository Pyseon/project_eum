<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<style>
	.backPage{
		margin-top: 50px;
		margin-bottom: 50px;
		width: 100%;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
	<div class="page-content container">
		<div class="posting-wrap">
			<h1 class="fc-1 fs-full">>전문가 상세내역</h1>
		<hr>
			<c:forEach var="p" items="${list }" varStatus="i">
		<table class="expertTbl expertTbl_top">
			<tr>
				<th>주문번호</th>
				<td>${p.payNo }</td>
			</tr>
			<tr>
				<th>주문일시</th>
				<td>${p.payDate }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${p.payment }</td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>${p.payMethod }</td>
			</tr>
			<tr>
				<th>사용포인트</th>
				<td>${p.payUsepoint }</td>
				
			</tr>
			<tr>
				<th>적립포인트</th>
				<td>${p.payAddpoint }</td>
			</tr>
		</table>
		
				</c:forEach>
		<div class="backPage">
			<button class="btn bc1 bs4" onclick="location.href=/appExpertList.do?memberNo=${sessionScope.member.memberNo}">목록으로</button>
		</div>
	</div>
</div>
</body>
</html>
