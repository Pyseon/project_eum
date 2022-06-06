<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매완료</title>
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
		<div>주문일시:</div>
		<div>주문번호:</div>
		<div>결제금액:</div>
	</div>
	<button class="btn bc1 bs3" id="" type="">홈으로</button>
	<button class="btn bc1 bs3" id="" type="">구매내역확인</button>
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