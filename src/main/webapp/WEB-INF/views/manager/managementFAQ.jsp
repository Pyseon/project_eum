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
	<h1>>FAQ</h1>
	<hr>		
		<div class="searchBox">
			<form action="/manaFAQ.do" method="post" id="faqSelectBox">
				<select name="searchType">
					<option value="faqTitle">제목</option>
					<option id="faqCategory" value="faqCategory">유형</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="selectNum" value="0">
				<input id="keyword" type="text" name="keyword">				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
			<div id="categoryList">
<pre>
0: 전체		
1: 서비스 소개		2: 이용방법	
3: 구매 및 영수증	4: 가입 / 인증	
5: 계정 정보/탈퇴	6: 문제 해결	
7: 취소 / 환불		8: 신고 / 패널티</pre>
			</div>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>FAQ번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="faq" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${faq.FAQNo }</td>
					<td>${faq.FAQTitle }</td>
					<td>${faq.FAQDate }</td>
					<td><button class="bc3 bs6" onclick="location.href='/updateFAQFrm.do?FAQNo=${faq.FAQNo}'">수정</button></td>
					<!--<td><button class="bc3 bs6" onclick="location.href='/deleteFAQ.do?FAQNo=${faq.FAQNo}'">삭제</button></td> -->
					<td><button class="btn bc2 bs1 modal-open-btn delFAQ" target="#deleteFAQ-modal" value=${faq.FAQNo }>삭제</button></td>	
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
		<div class="insertFAQBtn">
		<button class="bc1 bs5" onclick="location.href='/insertFAQFrm.do'">글쓰기</button>
		</div>
	</div>
	
	<input type="hidden" id="reqPage" value="${reqPage }">
	
	<div id="deleteFAQ-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>해당 F&Q를 삭제 하시겠습니까?</h2>
				<br>	
			</div>
			<div class="modal-foot">
				<div class="modal-btns-container">
					<button class="btn bc3 modal-close">취소</button>
					<input type="hidden" id="delFAQ">
					<button class="btn bc2" id="delFaQ">공지 삭제</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$(document).ready(function(){
		$("select[name=searchType]").change(function(){
			if($("select[name=searchType]").val() == 'faqCategory' ){
				$('#categoryList').show();
				$('#keyword').attr("type","number");
			}else{
				$('#categoryList').hide();
				$('#keyword').attr("type","text");
			}
		});
	});
	
	const reqPage = $("#reqPage").val();

	$(".delFAQ").on("click", function() {
		$("#delFAQ").val($(this).val());
	});
	$("#delFaQ").on("click", function() {
		const FAQNo = $("#delFAQ").val();
		location.href='/deleteFAQ.do?FAQNo='+FAQNo+'&reqPage='+reqPage;
	});
	
	
</script>
</body>
</html>