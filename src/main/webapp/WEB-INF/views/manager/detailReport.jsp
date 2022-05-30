<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	
	<div class="manaContentWrap">
	<h1 class="fc-1 fs-full">>신고 상세정보</h1>
	<hr>
	<c:forEach items="${report }" var="rpt" varStatus="i">
		<h2 class="fc-1 fs-bold">신고자: ${report.plaintiffId }</h2>
		<h2 class="fc-1 fs-bold">${report.reportTitle }</h2>
		<hr>
		<h3 class="fc-1 fs-medium">${report.reportContent }</h3>
		<hr>
		
	</c:forEach>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>