<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>내 구매내역</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>시작하기</th><th>구매일자</th><th>상품명</th><th>상품가격</th><th>주문상태</th>
		</tr>
		<tr>
		<c:forEach var="p" items="${list }" varStatus="i">
		
		<td><a href=" ">${p.productType}</a> </td>
		<td>${p.payDate} </td>
		
		<td>${p.productTitle }</td> 
		<td>${p.payMent} </td>
		<td>${p.payState} </td>
		</tr>
		
		</c:forEach>
	</table>

</body>
</html>