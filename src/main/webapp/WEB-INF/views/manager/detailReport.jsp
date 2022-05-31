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
		<h2 class="fc-1 fs-bold">신고자: ${rpt.plaintiffId }</h2>
		<hr>
		<h2 class="fc-1 fs-bold">제목: ${rpt.reportTitle }</h2>
		<hr>
		<h3 class="fc-1 fs-medium">내용: ${rpt.reportContent }</h3>
		<hr>
		<div class="reportDetail">
			<jsp:include page="/productDetail.do?productNo=${rpt.reportIndex }&expertNo=${rpt.defendant }"></jsp:include>
		</div>
	</c:forEach>
	<hr>
	<div class="answerReport">
	<span class="material-symbols-outlined">
		subdirectory_arrow_right
	</span><h1>답변</h1>
		<form method="post" action="/answerReport.do">
			<textarea rows="1" cols="150" name="answerTitle"></textarea>
			<br>
			<textarea rows="5" cols="150" name="answerReport"></textarea>
			<br>
			<input type="submit" value="전송">
		</form>
	</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(".header-div").css("display","none");
		$(".footer-div").css("display","none");
		$("#purchaseBtn").css("display", "none");
	</script>
</body>
</html>