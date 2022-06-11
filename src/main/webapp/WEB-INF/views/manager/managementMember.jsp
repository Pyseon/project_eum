<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">
		<div>
			<ul>
				<li><button class="btn bc3" onclick="location.href='manaMember.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn bc3" onclick="location.href='manaMember.do?reqPage=1&selectNum=1'">전문가</button></li>
				<li><button class="btn bc3" onclick="location.href='manaMember.do?reqPage=1&selectNum=2'">일반회원</button></li>
				<li><button class="btn bc3" onclick="location.href='manaMember.do?reqPage=1&selectNum=3'">블랙리스트</button></li>
			</ul>
		</div>
		<div class="searchBox">
			<form action="/manaMember.do" method="post">
				<select id="searchType" name="searchType">
					<option value="memberNo">회원번호</option>
					<option value="memberId">이메일</option>
					<option value="memberNick">닉네임</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="selectNum" value="0">
				<input type="number" name="keyword" id="keyword">
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>회원번호</th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>등급</th>
					<th>포인트</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>신고 누적 횟수</th>
					<th>블랙리스트 관리</th>
				</tr>
				<c:forEach items="${list }" var="member" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${member.memberNo }</td>
					<td>${member.memberId }</td>
					<td>${member.memberNick }</td>
					<td>
					<c:choose>
						<c:when test="${member.grade == 1 }">
							전문가
						</c:when>
						<c:when test="${member.grade == 2 }">
							일반 회원
						</c:when>
						<c:when test="${member.grade == 3 }">
							블랙리스트
						</c:when>
					</c:choose>
					</td>
					<td>${member.memberPoint }</td>
					<td>${member.memberPhone }</td>
					<td>${member.enrollDate }</td>
					<td>${member.memberReportCount }</td>
					<c:choose>
						<c:when test="${member.grade==3 }">
							<td><button class="btn bc1 bs1 modal-open-btn rlsBlk" target="#rlsBlackList-modal" value=${member.memberNo }>블랙리스트 해제</button></td>
						</c:when>
						<c:otherwise>
							<td><button class="btn bc2 bs1 modal-open-btn regBlk" target="#regBlackList-modal" value=${member.memberNo }>블랙리스트 등록</button></td>
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
	
	<div id="rlsBlackList-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 회원을 블랙리스트에서 해제 하시겠습니까?</h2>
				<br>
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="rlsBlack">
					<button class="btn bc1" id="rlsBlackList">블랙리스트해제</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="regBlackList-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 회원을 블랙리스트에 등록 하시겠습니까?</h2>
				<br>	
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="regBlack">
					<button class="btn bc1" id="regBlackList">블랙리스트 등록</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
<script>
$("#searchType").change(function() {
	const searchType = $("#searchType").val();
	if(searchType == 'memberNo'){
		$("#keyword").attr("type","number");	
	}else{
		$("#keyword").attr("type","text");	
	}
});
	const reqPage = $("#reqPage").val();
	
	$(".rlsBlk").on("click", function() {
		$("#rlsBlack").val($(this).val());
	});
	$("#rlsBlackList").on("click", function() {
		const memberNo = $("#rlsBlack").val();
		location.href = '/updateBlackList.do?updateNo=0&memberNo='+memberNo+'&reqPage='+reqPage;
	});
	
	$(".regBlk").on("click", function() {
		$("#regBlack").val($(this).val());
	});
	$("#regBlackList").on("click", function() {
		const memberNo = $("#regBlack").val();
		location.href = '/updateBlackList.do?updateNo=1&memberNo='+memberNo+'&reqPage='+reqPage;
	});
	
	
</script>
</body>
</html>