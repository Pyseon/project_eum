<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
	<div class="page-content container"   style="min-height: 600px;">
		<div class="posting-wrap">

			<table class="tbl tbl-hover">
				<tr class="tr-1">
					<th>번호</th>
					<th>질문번호</th>
					<th>제목</th>
					<th>일자</th>
					<th>답변상태</th>
				</tr>
				<c:if test="${fn:length(list) eq 0}">
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>내역이 없습니다</th>
						<th></th>
						<th></th>
					</tr>
				</c:if>
				<c:forEach items="${list }" var="q" varStatus="i">
					<tr class="tr-2">
						<td>${(reqPage-1)*10 + i.count }</td>
						<td>${q.qstNo }</td>
						<td><a href="/detailQuestion.do?qstNo=${q.qstNo }">${q.qstTitle }</a></td>
						<td>${q.qstDate.substring(0,10) }</td>
						<td><c:choose>
								<c:when test="${q.ansState == 0 }">
									답변 대기중
								</c:when>
								<c:otherwise>
									답변 완료
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">${pageNavi }</div>
		<div>
			<button class="bc1 bs5"
				onclick="location.href='/insertQuestionFrm.do'">질문하러가기</button>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>