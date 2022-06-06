<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="expertbox">
	<div class="expert-profile">
		<div>프로필</div>
		<div>전문가이름</div>
		<div>직업명or분류</div>
		<div>자기 소개입니다. 저는 이러한걸 합니다.</div>
		<div>회사이름</div>
	</div>
	<div>자기소개서</div>
	<hr>
	<div>학력 / 자격 / 경력</div>
	<hr>
	<div>연관 태그</div>
	<hr>
	<div>태그목록</div>
	<br>
	<div>등록상품</div>
	<hr>
	<div>상담</div>
	<div>상담</div>
	<div>상담</div>
	<br>
	<div>전체</div>
	<br>
	<div>상담 후기</div>
	<hr>
	<button>더보기</button>
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