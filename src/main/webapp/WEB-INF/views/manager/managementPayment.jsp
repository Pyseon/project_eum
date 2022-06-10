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
		<div>
			<ul>
				<li><button class="btn bc3" onclick="location.href='manaPayment.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn bc3" onclick="location.href='manaPayment.do?reqPage=1&selectNum=1'">예약</button></li>
				<li><button class="btn bc3" onclick="location.href='manaPayment.do?reqPage=1&selectNum=2'">완료</button></li>
				<li><button class="btn bc3" onclick="location.href='manaPayment.do?reqPage=1&selectNum=3'">예약 취소</button></li>
			</ul>
		</div>
		<div class="searchBox">
			<form action="/manaPayment.do" method="post">
				<select name="searchType">
					<option value="payNo">주문번호</option>
					<option value="memberId">이메일</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="selectNum" value="0">
				<input type="text" name="keyword">				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>주문번호</th>
					<th>주문자</th>
					<th>결제금액</th>
					<th>결제방법</th>
					<th>주문 상태</th>
					<th>결제 일자</th>
					<th>상세 보기</th>
					<th>주문 취소</th>
				</tr>
				<c:forEach items="${list }" var="pay" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${pay.payNo }</td>
					<td>${pay.memberId }</td>
					<td>${pay.payment }</td>
					<td>${pay.payMethod }</td>
					<c:choose>
						<c:when test="${pay.payState==1 }">
							<td>예약 완료</td>
						</c:when>
						<c:when test="${pay.payState==2 }">
							<td>구매 확정</td>
						</c:when>
						<c:when test="${pay.payState==3 }">
							<td>예약 취소</td>
						</c:when>
					</c:choose>
					<td>${pay.payDate }</td>
					<td><button class="btn bc3 bc1" onclick="location.href='/detailPayment.do?payNo=${pay.payNo}&reqPage=${reqPage }'">상세보기</button></td>
					<c:choose>
						<c:when test="${pay.payState==3 }">
						<td><button class="btn bc1 bs1 modal-open-btn payRes" target="#payReserv-modal" value=${pay.payNo }>다시 예약</button></td>
						</c:when>
						<c:otherwise>
							<td><button class="btn bc2 bs1 modal-open-btn payCan" target="#payCancel-modal" value=${pay.payNo }>주문 취소</button></td>
						</c:otherwise>
					</c:choose>
					
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
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
		location.href = '/updatePayState.do?updateNo=0&payNo='+payNo+'&reqPage='+reqPage;
	});
	
	$(".payRes").on("click", function() {
		$("#payRes").val($(this).val());
	});
	$("#payReserv").on("click", function() {
		const payNo = $("#payRes").val();
		location.href='/updatePayState.do?updateNo=1&payNo='+payNo+'&reqPage='+reqPage;
	});
	
	
</script>
</body>
</html>