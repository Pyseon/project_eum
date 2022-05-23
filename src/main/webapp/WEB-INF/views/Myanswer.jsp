<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>1:1문의 내역</title>
</head>
<body>
	<h1>>1:1문의 내역</h1>
	<hr>
	
	<table border="1">
		<tr>
			<th>제목</th><th>일자</th><th>답변상태</th>
		</tr>
		<tr>
		<c:forEach var="a" items="${list }" varStatus="i">
		<td><a href="/answerView.do?answerNo=${a.ansNo}">${a.ansTitle }</a></td>
		<td>${a.ansDate} </td>
		<!-- 답변상태확인 -->
		<!-- <td>${a.answer }</td> -->
		
		</tr>
		</c:forEach>
	</table>
</body>
</html>