<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.page-top-content{
		color: #999;
		text-align: right;
		margin-right: 15px;
		margin-top: 10px;
		margin-bottom: 5px;
	}
	.page-top-content > h3, h4{
		line-height: 5px;
	}
	.page-mid-content{
		text-align: center;
	}
	.page-bot-content{
		width: 90%;
		margin-left: 20px;
	}
	.page-end-btn{
		margin-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="container">
		<div class="page-top-content">
			
		</div>
		<hr>
		<div class="page-mid-content">
		<h2>
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
		</h2>
			<hr>
			<h1 class="fs-bold">${faq.FAQTitle }</h1>
			<hr>
		</div>
		<div class="page-bot-content">
			<h2>${faq.FAQContent }</h2>
		</div>
		<div class="page-end-btn">
			<button class="btn bc1 bs4" onclick="location.href='/faqList.do?reqPage=1&faqType=0'">목록으로 돌아가기</button>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>