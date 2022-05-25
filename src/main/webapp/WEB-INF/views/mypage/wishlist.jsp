<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>찜 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>찜한상품이름</th><th>가격</th>
		</tr>
		<tr>
		<c:forEach var="w" items="${list }" varStatus="i">
		
		
		<td>${w.productTitle} </td>
		
		<td>${w.payMent }</td> 
		
		</tr>
		
		</c:forEach>
	</table>
</body>
</html>