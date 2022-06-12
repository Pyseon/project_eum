<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/manager.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">
	<h1 id="main-title">> 1:1상담</h1>
	<hr>
		<div class="selectListBtn sl-btn">
			<ul>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaQuestion.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn btn99 select-btn" onclick="location.href='manaQuestion.do?reqPage=1&selectNum=1'">대기</button></li>
			</ul>
		</div>	
		<div id="resultTbl" class="qstTbl">
			<table class="tbl tbl-hover">
				<tr class="tr-1">
					<th>번호</th>
					<th>질문번호</th>
					<th>제목</th>
					<th>일자</th>
					<th>답변상태</th>
					<th>답변하기</th>
				</tr>
				<c:forEach items="${list }" var="q" varStatus="i">
					<tr class="tr-2">
						<td>${(reqPage-1)*10 + i.count }</td>
						<td>${q.qstNo }</td>
						<td>${q.qstTitle }</td>
						<td>${q.qstDate.substring(0,10) }</td>
						<c:choose>
							<c:when test="${q.ansState == 0}">
								<td class="fc-9">답변 안함</td>
							</c:when>
							<c:otherwise>
								<td class="fc-7">답변함</td>
							</c:otherwise>
						</c:choose>
						<td><button class="btn bc3 bs1" onclick="location.href='/insertAnswerFrm.do?qstNo=${q.qstNo}'">답변하기</button></td>
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