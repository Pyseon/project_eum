<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<th>제목</th><th>작성일</th><th>답변상태</th>
		</tr>
		<tr>
		<c:forEach var="q" items="${list }" varStatus="i">
		<td><a href="/questionView.do?questionNo=${q.qstNo}">${q.qstTitle }</a></td> 
		<td>${q.qstDate} </td>
		</tr>
		
		</c:forEach>
	</table>
	
</body>
</html>