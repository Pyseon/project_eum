<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 구매실패</title>
</head>
<style>
	.failbox{
		width:100%;
		margin: 0 auto;
		text-align: center;
		
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="failbox">
	<div class="">
		<div>구매 실패하였습니다</div>
	</div>
	<button class="btn bc1 bs3" id="" type="">홈으로</button>
	<button class="btn bc1 bs3" id="" type="">이전 페이지로</button>
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