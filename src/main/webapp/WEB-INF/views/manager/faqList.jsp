<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1 id="main-title">> 자주 묻는 질문</h1>
	<hr>		
		<div class="searchBox">
			<form action="/faqList.do" method="post">
				<div class="select-wrap">
					<select id="searchType" name="searchType">
						<option value="faqTitle">제목</option>
					</select>
					<select id="faqType" name="faqType">
						<option value=0>전체</option>
						<option value=1>서비스 소개</option>
						<option value=2>이용방법</option>
						<option value=3>구매 및 영수증</option>
						<option value=4>가입/인증</option>
						<option value=5>정보/탈퇴</option>
						<option value=6>문제 해결</option>
						<option value=7>취소/환불</option>
						<option value=8>신고/패널티</option>
					</select>
				</div>
				<input type="hidden" name="reqPage" value="1">
				<div class="keyword-wrap" style="float: left">
					<input type="text" id="keyword" name="keyword">
				</div>				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl-wrap">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>유형</th>
					<th>제목</th>
				</tr>
				<c:forEach items="${list }" var="faq" varStatus="i">
				<tr class="tr-2" onclick="location.href='faqDetail.do?faqNo=${faq.FAQNo}'">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>
					
					<c:choose>
						<c:when test="${faq.FAQType == 1 }">
							서비스 소개
						</c:when>
						<c:when test="${faq.FAQType == 2 }">
							이용방법
						</c:when>
						<c:when test="${faq.FAQType == 3 }">
							구매 및 영수증
						</c:when>
						<c:when test="${faq.FAQType == 4 }">
							가입 / 인증	
						</c:when>
						<c:when test="${faq.FAQType == 5 }">
							계정 정보/탈퇴
						</c:when>
						<c:when test="${faq.FAQType == 6 }">
							문제 해결
						</c:when>
						<c:when test="${faq.FAQType == 7 }">
							취소 / 환불
						</c:when>
						<c:when test="${faq.FAQType == 8 }">
							신고 / 패널티
						</c:when>
					</c:choose>
					
					</td>
					<td>${faq.FAQTitle }</td>
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