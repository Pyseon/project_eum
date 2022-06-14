<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
</head>
<style>
	.successbox{
		width:100%;
		margin: 0 auto;
		text-align: center;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="successbox">
	<div class="">
		<div>구매가 완료되었습니다.</div>
		<div>상담/클래스 제목</div>
	</div>
	<div class="">
	<c:forEach var="p" items="${list }" varStatus="i">
		<div>주문번호:${p.payNo }</div>
		<div>주문일시:${p.payDate }</div>
		<div>결제금액:${p.payment }</div>
		<div>결제방법:${p.payMethod }</div>
		<div>사용포인트:${p.payUsepoint }</div>
		<div>적립포인트:${p.payAddpoint }</div>
		
	</c:forEach>
	</div>
	<button class="btn bc3 bs7" id="login-btn" type="button" onclick="location.href='/Myproduct.do?memberNo=${sessionScope.member.memberNo}'">이전으로</button>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>

</html>