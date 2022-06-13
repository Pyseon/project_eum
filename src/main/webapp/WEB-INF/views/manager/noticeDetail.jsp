<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h3>공지번호: ${ntc.noticeNo }</h3>
			<h4>${ntc.noticeDate }</h4>
		</div>
		<hr>
		<div class="page-mid-content">
			<h1 class="fs-bold">${ntc.noticeTitle }</h1>
			<hr>
		</div>
		<div class="page-bot-content">
			<h2>${ntc.noticeContent }</h2>
		</div>
		<div class="page-end-btn">
			<button class="btn bc1 bs4">목록으로 돌아가기</button>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>