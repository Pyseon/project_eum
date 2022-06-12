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
		<h1 class="fc-1 fs-full">>전문가 상세내역</h1>
		<hr>
		<table class="expertTbl expertTbl_top">
			<tr>
				<th>상담분야</th>
				<td colspan="2">${exp.expertCategory }</td>
			</tr>
			<tr>
				<th>태그</th>
				<td colspan="2">${exp.expertTag }</td>
			</tr>
			<tr>
				<th>자격</th>
				<td colspan="2">가입자격은 이거이거가 필요하다</td>
			</tr>
			<tr>
				<th>자격증</th>
				<td colspan="2">${exp.credential }</td>
			</tr>
			<tr>
				<th>발급기관/취득일시</th>
				<td id="iss">${exp.issuingAuthority }</td>
				<td id="acq">${exp.acquistionDate }</td>
			</tr>
			<tr>
				<th>자격증 사본</th>
				<td colspan="2">${exp.certificatePath}</td>
			</tr>
		</table>
		<h2>판매자 정보</h2>
		<table class="expertTbl expertTbl_bottom">
			<tr>
				<th>판매자 이름</th>
				<td>${exp.expertName}</td>
			</tr>
			<tr>
				<th>직업명</th>
				<td>${exp.jobName}</td>
			</tr>
			<tr>
				<th>전문가 번호</th>
				<td>${exp.expertPhone}</td>
			</tr>
			<tr>
				<th>전문가 이메일</th>
				<td>${exp.expertEmail}</td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${exp.expertApp == 2 }">
				<h2>기각</h2>
				<table class="expertTbl">
					<tr>
						<th>기각 사유</th>
						<td>${refuseContent }</td>
					</tr>
				</table>
				<div class="managerBtn">
					<button class="btn bc1" onclick="location.href='/manaExpert.do?reqPage=1&selectNum=0'">목록으로</button>
				</div>
			</c:when>
			<c:when test="${exp.expertApp == 1 }">
				<div class="managerBtn">
					<button class="btn bc1" onclick="location.href='/manaExpert.do?reqPage=1&selectNum=0'">목록으로</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="managerBtn">
					<button class="btn bc4" onclick="location.href='/manaExpert.do?reqPage=1&selectNum=0'">목록으로</button>
					<button class="btn bc2 modal-open-btn" target="#refuse-modal">기각</button>
					<button class="btn bc1" onclick="location.href='/updateExpertApp.do?expertNo=${exp.expertNo}'">전문가 승인</button>
				</div>
			</c:otherwise>
		</c:choose>
</div>

<div id="refuse-modal" class="modal-bg">
	<div class="modal-wrap">
		<div class="modal-head">
			<h2>전문가 승인을 거부하시겠습니까?</h2>
			<br>
		</div>
		<div class="modal-content">
			<table class="modal-content-tbl">
				<tr>
					<th class="modal-tbl-th">전문가 번호</th>
					<td class="modal-tbl-td">${exp.expertNo }</td>
					<input type="hidden" id="expertNo" value="${exp.expertNo }">
				</tr>
				<tr>
					<th class="modal-tbl-th">분야</th>
					<td class="modal-tbl-td">${exp.expertCategory }</td>
				</tr>
				<tr>
					<th class="modal-tbl-th">기각 사유</th>
					<td class="modal-tbl-td"><form><textarea class="modal-textarea refuseContent" placeholder="최대 100자까지"></textarea></form></td>
				</tr>
			</table>
		<div class="modal-foot">
			<div class="modal-btns-container">
				<button class="btn bc3 modal-close">취소</button>
				<button class="btn bc1" id="refuseExpert">승인 기각</button>
			</div>
		</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
$("#refuseExpert").on("click", function(){
	const expertNo = $("#expertNo").val();
	const refuseContent = $(".refuseContent").val();
	
	let newForm = document.createElement('form');
	newForm.name = 'newForm';
	newForm.method = 'post';
	newForm.action = '/refuseExpert.do';
	
	const input1 = document.createElement('input');
	const input2 = document.createElement('input');
	
	input1.setAttribute("type", "hidden");
	input2.setAttribute("type", "hidden");
	input1.setAttribute("name", "expertNo");
	input2.setAttribute("name", "refuseContent");
	input1.setAttribute("value", expertNo);
	input2.setAttribute("value", refuseContent);
	
	newForm.appendChild(input1);
	newForm.appendChild(input2);
	
	document.body.appendChild(newForm);
	
	newForm.submit();
});
</script>
</body>
</html>

