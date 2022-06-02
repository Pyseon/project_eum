<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#categoryList{
	display: none;
	position: relative;
	text-align: left;
	margin-top: -60px;
	margin-left: -185px;
	background: #ccc;
	width: 310px;
}
.searchBox>form{
	float: right;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">		
	<h1>>FAQ</h1>
		<div class="searchBox">
			<form action="/manaFAQ.do" method="post" id="faqSelectBox">
				<select name="searchType">
					<option value="faqTitle">제목</option>
					<option id="faqCategory" value="faqCategory">유형</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="selectNum" value="0">
				<input type="text" name="keyword">				
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
					<td><button onclick="">수정</button></td>
					<td><button>삭제</button></td>			
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
			<button onclick="location.href='/insertFAQFrm.do'">글쓰기</button>
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$(document).ready(function(){
		$("select[name=searchType]").change(function(){
			if($("select[name=searchType]").val() == 'faqCategory' ){
				$('#categoryList').show();
			}else{
				$('#categoryList').hide();
			}
		});
	});
</script>
</body>
</html>