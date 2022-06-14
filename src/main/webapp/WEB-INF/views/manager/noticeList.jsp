<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 공지사항</title>
<link rel="stylesheet" href="css/manager.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1 id="main-title">> 공지사항</h1>
	<hr>		
		<div class="searchBox">
			<form action="/noticeList.do" method="post">
				<div class="select-wrap">
					<select id="searchType" name="searchType">
						<option value="noticeTitle">제목</option>
						<option value="memberId">등록한 매니저</option>
					</select>
				</div>
				<input type="hidden" name="reqPage" value="1">
				<div class="keyword-wrap">
					<input type="text" id="keyword" name="keyword">
				</div>				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl-wrap">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>공지번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>등록한 매니저</th>
				</tr>
				<c:forEach items="${list }" var="ntc" varStatus="i">
				<tr class="tr-2" onclick="location.href='noticeDetail.do?noticeNo=${ntc.noticeNo}'">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${ntc.noticeNo }</td>
					<td>${ntc.noticeTitle }</td>
					<td>${ntc.noticeDate }</td>
					<td>${ntc.memberId }</td>
					</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>