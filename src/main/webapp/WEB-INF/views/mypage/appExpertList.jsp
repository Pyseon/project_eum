<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<style>
	#resultTbl{
		width: 100%;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
	<div class="page-content container">
		<div class="posting-wrap">
			<div id="resultTbl">
				<table class="tbl tbl-hover">
					<tr class="tr-1">
						<th>신청번호</th>
						<th>분야</th>
						<th>신청 현황</th>
						<th>상세보기</th>
					</tr>
				<c:forEach items="${list }" var="exp" varStatus="i">
					<tr class="tr-2">
						<td>${exp.expertNo }</td>
						<td>${exp.expertCategory }</td>
						<td>
							<c:choose>
								<c:when test="${exp.expertApp == 0 }">
									처리중
								</c:when>
								<c:when test="${exp.expertApp == 1 }">
									승인 완료
								</c:when>
								<c:when test="${exp.expertApp == 2 }">
									기각
								</c:when>
							</c:choose>
						</td>
						<td><button class="bc3 bs1" onclick="location.href='detailMyExpert.do?expertNo=${exp.expertNo}'">상세보기</button>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>