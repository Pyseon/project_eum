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
		<h1 class="fc-1 fs-full">>주문관리 상세내역</h1>
		<hr>
		<c:forEach items="${pay }" var="pay" varStatus="i">
		<h2 class="fc-1 fs-bold">주문번호: ${pay.payNo }</h2>
		<h3 class="fc-1 fs-bold">${pay.payDate }</h3>
		<hr>
			<table class="detailTbl tbl">
			<tr>
				<th><h3 class="fc-1 fs-bold">상품이미지</h3></th>
				<th><h3 class="fc-1 fs-bold">상품명</h3></th>
				<th><h3 class="fc-1 fs-bold">주문상태</h3></th>
			</tr>
			<tr>
				<td>${pay.productImgPath }</td>
				<td><h3 class="fc-1 fs=midium">${pay.productTitle }</h3></td>
				<td><h3 class="fc-1 fs=midium">${pay.payState }</h3></td>
			</tr>
			</table>
		<div class="detailBox">
			<h2 class="fs-bold fc-7">최종 결제 금액: ${pay.payment - pay.payUsepoint }</h2>
			<h3>결제방법: ${pay.payMethod }</h3><br>
			<h3>상품가격: ${pay.payment }</h3><br>
			<h3>포인트 사용금액: ${pay.payUsepoint }</h3><br>
			<h3>포인트 적립 예정 금액: ${pay.payAddpoint }</h3>
		</div>
		<c:choose>
			<c:when test="${pay.payState == 3 }">
				<div class="managerBtn">
					<button class="btn bc3" onclick="location.href='/manaPayment.do?reqPage=1&payState=0'">목록으로</button>
					<button class="btn bc1 bs1 modal-open-btn payRes" target="#payReserv-modal" value=${pay.payNo }>다시 예약</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="managerBtn">
					<button class="btn bc3" onclick="location.href='/manaPayment.do?reqPage=1&payState=0'">목록으로</button>
					<button class="btn bc2 bs1 modal-open-btn payCan" target="#payCancel-modal" value=${pay.payNo }>주문 취소</button>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</div>
	
	<input type="hidden" id="reqPage" value="${reqPage }">
	
	<div id="payCancel-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 주문을 취소 하시겠습니까?</h2>
				<br>	
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="payCan">
					<button class="btn bc1" id="payCancel">주문 취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="payReserv-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 주문을 다시 예약 하시겠습니까?</h2>
				<br>	
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="payRes">
					<button class="btn bc1" id="payReserv">다시 예약</button>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
const reqPage = $("#reqPage").val();

$(".payCan").on("click", function() {
	$("#payCan").val($(this).val());
});
$("#payCancel").on("click", function() {
	const payNo = $("#payCan").val();
	console.log(payNo);
	location.href = '/updatePayState.do?updateNo=0&payNo='+payNo+'&reqPage='+reqPage;
});
$(".payRes").on("click", function() {
	$("#payRes").val($(this).val());
});
$("#payReserv").on("click", function() {
	const payNo = $("#payRes").val();
	console.log(payNo);
	location.href='/updatePayState.do?updateNo=1&payNo='+payNo+'&reqPage='+reqPage;
});
</script>
</body>
</html>