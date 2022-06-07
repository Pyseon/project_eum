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
				<li><button class="btn bc3" onclick="location.href='manaAnswer.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn bc3" onclick="location.href='manaAnswer.do?reqPage=1&selectNum=1'">대기</button></li>
			</ul>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>답장번호</th>
					<th>일자</th>
					<th>시간</th>
					<th>답변상태</th>
					<th>답변하기</th>
				</tr>
				<c:forEach items="${list }" var="ans" varStatus="i">
					<tr class="tr-2">
						<td>${(reqPage-1)*10 + i.count }</td>
						<td>${ans.ansNo }</td>
						<td>${ans.ansDate.substring(0,10) }</td>
						<td>${ans.ansDate.substring(11,16) }</td>
						<td>${ans.ansState }</td>
						<td><button>답변하기</button></td>
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