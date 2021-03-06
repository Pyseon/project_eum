<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
<style>
.tbl .tr-3 {
	dispay: none;
}
</style>
</head>
<body>
	<div class="page-content" style="min-height: 600px;">

		<div class="posting-wrap">





			<div class="page-content">
				<h1>>후기</h1>
				<table class="tbl tbl-hover">

					<tr class="tr-1">
						<th>제목</th>
						<td>별점</td>
						<td>일자</td>
					</tr>
					<c:if test="${fn:length(list) eq 0}">
						<tr>
							<th></th>
							<td>내역이 없습니다.</td>
							<td></td>
						</tr>
					</c:if>
					<c:forEach var="r" items="${list }" varStatus="i">
						<tr class="tr-2">
							<th><a
								href="/imgVerProductDetail.do?productNo=${r.productNo}&&expertNo=${r.expertNo}">${r.reviewTitle }</a></th>
							<td>${r.reviewStar }</td>
							<td>${r.reviewDate }</td>
							<td>${r.reviewContent}</td>

						</tr>

					</c:forEach>
				</table>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="https://kit.fontawesome.com/2fade9eaba.js"
		crossorigin="anonymous">
		$(document).ready(function() {
			$(".tr-2>a").click(function() {
				$(this).next("tr-3").toggleClass("hide");
			});
		});
	</script>
</body>
</html>