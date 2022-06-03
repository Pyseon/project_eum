<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>후기</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	<h3>>후기</h3>
	<div class="page-content">
		<table class="tbl tbl-hover">
			
			<tr class="tr-1">
				<th>제목</th>
				<td>일자</td>
			<tr>
			<c:forEach var="r" items="${list }" varStatus="i">
			<tr class="tr-2">
				<th><a href="/Myreviewdetail.do?reviewNo=${r.reviewNo}">${r.reviewTitle }</a></th>
				<td>${r.reviewDate }</td>
				
			</tr>
			</c:forEach>
		</table>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="https://kit.fontawesome.com/2fade9eaba.js"
	crossorigin="anonymous"></script>
</body>
</html>