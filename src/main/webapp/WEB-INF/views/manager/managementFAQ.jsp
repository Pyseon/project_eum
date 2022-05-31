<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">
		<select name="faqType">
			<option value="0">전체</option>
			<option value="1">서비스소개</option>
			<option value="2">이용방법</option>
			<option value="3">구매 및 영수증</option>
			<option value="4">가입/인증</option>
			<option value="5">계정 정보/탈퇴</option>
			<option value="6">문제해결</option>
			<option value="7">취소/환불</option>
			<option value="8">신고/패널티</option>
		</select>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>FAQ번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="faq" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${faq.FAQNo }</td>
					<td>${faq.FAQTitle }</td>
					<td>${faq.FAQDate }</td>
					<td><button>수정</button></td>
					<td><button>삭제</button></td>			
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>