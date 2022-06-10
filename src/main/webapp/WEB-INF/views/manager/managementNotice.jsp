<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>>공지사항</h1>
	<hr>		
		<div class="searchBox">
			<form action="/manaNotice.do" method="post">
				<select name="searchType">
					<option value="noticeTitle">제목</option>
					<option value="memberId">등록한 매니저</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="text" name="keyword">				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>공지번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>등록한 매니저</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="ntc" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${ntc.noticeNo }</td>
					<td>${ntc.noticeTitle }</td>
					<td>${ntc.noticeDate }</td>
					<td>${ntc.memberId }</td>
					<td><button class="bc3 bs6" onclick="location.href='/updateNoticeFrm.do?noticeNo=${ntc.noticeNo}'">수정</button></td>
					<!--<td><button class="bc3 bs6" onclick="location.href='/deleteNotice.do?noticeNo=${ntc.noticeNo}'">삭제</button></td> -->
					<td><button class="btn bc2 bs1 modal-open-btn delNtc" target="#deleteNotice-modal" value=${ntc.noticeNo }>삭제</button></td>
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
		<div class="insertFAQBtn">
		<button class="bc1 bs5" onclick="location.href='/insertNoticeFrm.do'">글쓰기</button>
		</div>
	</div>
	
	<input type="hidden" id="reqPage" value="${reqPage }">
	
	<div id="deleteNotice-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 공지를 삭제 하시겠습니까?</h2>
				<br>	
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="delNtc">
					<button class="btn bc2" id="delNotice">공지 삭제</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	const reqPage = $("#reqPage").val();

	$(".delNtc").on("click", function() {
		$("#delNtc").val($(this).val());
	});
	$("#delNotice").on("click", function() {
		const noticeNo = $("#delNtc").val();
		location.href = '/deleteNotice.do?noticeNo='+noticeNo+'&reqPage='+reqPage;
});
</script>
</body>
</html>