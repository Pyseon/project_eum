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
			<c:choose>
				<c:when test="${category == 0 }">
					<jsp:include page="/productDetail.do?productNo=${rpt.reportIndex }&expertNo=${rpt.defendant }"></jsp:include>
				</c:when>
				<c:when test="${category == 1 }">
					상품 후기
				</c:when>
				<c:when test="${category == 2 }">
					개설 요청
				</c:when>
				<c:when test="${category == 3 }">
					커뮤니티
				</c:when>
				<c:when test="${category == 0 }">
					커뮤니티 댓글
				</c:when>
			</c:choose>
		</div>
	<hr>
	<div class="answerReport">
	<span class="material-symbols-outlined ansRe">
		subdirectory_arrow_right</span><h2>답변</h2>
			<div>
				<form method="post" action="/answerReport.do" id="answerReport">
					<h3>제목</h3>
					<textarea rows="1" cols="150" name="answerTitle"></textarea>
					<br> 
					<h3>내용</h3>
					<textarea rows="5" cols="150" name="answerReport"></textarea>
					<input type="hidden" value=${rpt.reportNo } name="reportNo">
					<input type="hidden" value=${rpt.reportCategory } name="category">
					<input type="hidden" value=${rpt.reportIndex } name="index">
					<br> 
					<input type="submit" value="답변 등록" class="btn bc3 reportSubmit">
				</form>
			</div>
		</div>
	<div class="resultReport">
		<button class="btn bc1" onclick="location.href='/reportMember.do?memberNo=${rpt.defendant}&category=${rpt.reportCategory }&index=${rpt.reportIndex }&reportNo=${rpt.reportNo }&selNo=1'">사형</button>
		<button class="btn bc1" onclick="location.href='/manaReport.do?reqPage=1&selectNum=0'">봐줌</button>
	</div>
	</c:forEach>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(".header-div").css("display","none");
		$(".footer-div").css("display","none");
		$("#purchaseBtn").css("display", "none");
	</script>
</body>
</html>