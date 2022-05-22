<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>커뮤니티</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list }" var="c" varStatus="i">
		<tr>
			<td>${c.comNo }</td>
			<td>${c.comTitle }</td>
			<td>${c.memberNick }</td>
			<td>${c.comDate }</td>
			<td>${c.readCount }</td>
		</tr>	
		</c:forEach>
		
	</table>
</body>
</html>