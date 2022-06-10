<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-content">
		<h1>>상품 상세</h1>
		<c:forEach var="p" items="${list }" varStatus="i">
		<table class="tbl tbl-hover">
			
			<tr class="tr-1">
				<th>payno</th>
				<td>productno</td>
				<td>paystate</td>
				<td>paymethod</td>
				<td>paydate</td>
				<td>payment</td>
				<td>payusepoint</td>
				<td>payaddpoint</td>
			<tr>
			
			<tr class="tr-2">
				<th>${p.payNo }</a></th>
				<td>${p.productNo }</td>
				<td>${p.payState }</td>
				<td>${p.payMethod }</td>
				<td>${p.payDate }</td>
				<td>${p.payment }</td>
				<td>${p.payUsepoint }</td>
				<td>${p.payAddpoint }</td>
			</tr>
			
			
		</table>
		</c:forEach>
	</div>
</body>
</html>