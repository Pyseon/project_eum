<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 관리자</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	
	<div class="manaContentWrap">
	<h1 class="fc-1 fs-full">>신고 상세정보</h1>
	<hr>
		<h2 class="fc-1 fs-bold">신고자: ${rpt.plaintiffId }</h2>
		<hr>
		<h2 class="fc-1 fs-bold">제목: ${rpt.reportTitle }</h2>
		<hr>
		<h3 class="fc-1 fs-medium">내용: ${rpt.reportContent }</h3>
		<hr>
		<div class="reportDetail">
		<c:choose>
			<c:when test="${scout eq -1 }">
				<h1>이미 삭제되어있는 글입니다.</h1>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${category == 0 }">
					<jsp:include page="/productDetail.do?productNo=${rpt.reportIndex }&expertNo=${rpt.defendant }"></jsp:include>
				</c:when>
				<c:when test="${category == 1 }">
					${reviewTitle }
					${reviewContent }
				</c:when>
				<c:when test="${category == 2 }">
					<jsp:include page="/requestDetail.do?reqNo=${rpt.reportIndex }"></jsp:include>
				</c:when>
				<c:when test="${category == 3 }">
					<jsp:include page="/communityDetail.do?commNo=${rpt.reportIndex }&category=${commCategory }"></jsp:include>
				</c:when>
				<c:when test="${category == 0 }">
					${cmntContent }
				</c:when>
				</c:choose>
			</c:otherwise>
		</c:choose>
		</div>
	<hr>
	<div class="answerReport">
	<span class="material-symbols-outlined ansRe">
		subdirectory_arrow_right</span><h2>답변</h2>
		<c:choose>
			<c:when test="${rpt.reportIs == 0 }">
				<div>
				<form method="post" action="/answerReport.do" id="answerReport">
					<h3>제목</h3>
					<textarea rows="1" cols="150" name="answerTitle"></textarea>
					<br> 
					<h3>내용</h3>
					<textarea rows="5" cols="150" name="answerContent"></textarea>
					<input type="hidden" value=${rpt.reportNo } name="reportNo">
					<input type="hidden" value=${rpt.reportCategory } name="category">
					<input type="hidden" value=${rpt.reportIndex } name="index">
					<br> 
					<input type="submit" disabled="disabled" value="답변 등록" id="reportSubmit" class="btn bc1">
					
				</form>
				</div>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>제목</th>
						<td>${ansrpt.ansrptTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${ansrpt.ansrptContent }</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		<input type="hidden" id="reportIs" value=${rpt.reportIs }>
		<input type="hidden" id="ansResult" value=${rpt.ansResult }>
		</div>
	<div class="resultReport">
		<button class="btn bc2 result-btn" disabled="disabled" onclick="location.href='/reportMember.do?memberNo=${rpt.defendant}&category=${rpt.reportCategory }&index=${rpt.reportIndex }&reportNo=${rpt.reportNo }&selNo=1'">사형</button>
		<button class="btn bc3 result-btn" disabled="disabled" onclick="location.href='/updateAnsResult.do?selectNum=2&reportNo=${rpt.reportNo}'">봐줌</button>
	</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	$(function() {
		const reportIs = $("#reportIs").val();
		const ansResult = $("#ansResult").val();
		if(reportIs == 1){
			$(".result-btn").attr("disabled",false);
		}
		if(ansResult != 0){
			$(".resultReport").css("display","none");
		}
	});
	
	$("textarea[name=answerContent]").change(function() {
		const answerTitle = $("textarea[name=answerTitle]").val();
		const answerContent = $("textarea[name=answerContent]").val();
		if(answerTitle.length > 0 && answerContent.length > 0){
			$("#reportSubmit").attr("disabled", false);
		}
	});
	
	
		//공통
		$(".header-div").css("display","none");
		$(".footer-div").css("display","none");
		
		//상품
		$(".report-wrap").css("display","none");
		$(".right-second-box").css("display", "none");
		$(".right-third-box").css("display", "none");
		$(".right-fourth-box").css("display", "none");
		$(".single-sidebar-widget").css("display", "none");
		$(".wish-title-wrap").css("display", "none");
		$("#purchaseBtn").css("display", "none");
		
		//커뮤니티
		$(".article-list").css("display", "none");
		$(".article-info-box").css("display", "none");
		$(".haja-like").css("pointer-events", "none");
		$(".button-wrap").css("display", "none");
		$(".comments-area").css("display", "none");
		
		//개설요청
		$(".reportbutton").css("display", "none");
		$("#submit").css("display", "none");
		$(".reqbtn").css("display", "none");
	</script>
</body>
</html>