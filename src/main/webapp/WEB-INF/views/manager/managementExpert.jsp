<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 관리자</title>
<link rel="stylesheet" href="css/manager.css" />
<style>
	.fc-13{
		color: #6AA61E;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">
	<h1 id="main-title">> 전문가 승인</h1>
	<hr>
		<div class="selectListBtn">
			<ul>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaExpert.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaExpert.do?reqPage=1&selectNum=1'">대기</button></li>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaExpert.do?reqPage=1&selectNum=2'">승인</button></li>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaExpert.do?reqPage=1&selectNum=3'">기각 </button></li>
			</ul>
		</div>
		<div class="searchBox">
			<form action="/manaExpert.do" method="post">
				<div class="select-wrap">
					<select id="searchType" name="searchType">
						<option value="expertName">이름</option>
						<option value="category">분야</option>
					</select>
				</div>	
					<input type="hidden" name="reqPage" value="1">
					<input type="hidden" name="selectNum" value="0">
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
					<th>이름</th>
					<th>분야</th>
					<th>직업명</th>
					<th>승인상태</th>
					<th>상세보기</th>
				</tr>
				<c:forEach items="${list }" var="expert" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${expert.expertName }</td>
					<td>${expert.expertCategory }</td>
					<td>${expert.jobName }</td>
					<c:choose>
						<c:when test="${expert.expertApp == 0 }"><td class="fc-13">승인 대기</td></c:when>
						<c:when test="${expert.expertApp == 1 }"><td class="fc-7">승인 완료</td></c:when>
						<c:when test="${expert.expertApp == 2 }"><td class="fc-9">기각</td></c:when>
					</c:choose>
					<td><button class="btn bc1" onclick="location.href='/detailExpert.do?expertNo=${expert.expertNo}&expertApp=${expert.expertApp }'">상세보기</button></td>
				</tr>
					</c:forEach>
			</table>
		</div>
		<div class="memberPageNavi">
			${pageNavi }
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$(function(){
	    let sel= ${selectNum};
	    console.log(sel);
	    $(".select-btn").eq(sel).addClass("manager-btn1");
	});
</script>
</body>
</html>