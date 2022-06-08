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
	<h1>>1:1 문의 상세</h1>
	<hr>
	<div>
		<h3>질문 번호: ${qst.qstNo }</h3>
		<h3>제목: ${qst.qstTitle }</h3>
		<h3>날짜: ${qst.qstDate.substring(0,10) }</h3>
		<h3>시간: ${qst.qstDate.substring(11,16) }</h3>
		<hr>
		<p>${qst.qstContent }</p>
	</div>
	<div>
		<span class="material-symbols-outlined ansRe">
				subdirectory_arrow_right</span><h2>답변</h2>
		<h3>답변자: ${ans.memberNick }</h3>
		<h3>제목: ${ans.ansTitle }</h3>
		<p>${ans.ansContent }</p>
	</div>
	<button class="btn bs4 bc1" onclick="location.href='/myQuestionList.do?memberNo=${sessionScope.member.memberNo}&reqPage=1&selectNum=0'">돌아가기</button>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>