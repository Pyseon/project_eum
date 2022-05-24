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
	<div class="memberWrap">
		<div>
			<ul>
				<li><button class="btn selectMemberBtn bc3" value=0>전체</button></li>
				<li><button class="btn selectMemberBtn bc3" value=1>전문가</button></li>
				<li><button class="btn selectMemberBtn bc3" value=2>일반회원</button></li>
				<li><button class="btn selectMemberBtn bc3" value=3>사업자</button></li>
				<li><button class="btn selectMemberBtn bc3" value=4>블랙리스트</button>
			</ul>
		</div>
		<div id="resultTbl">
			<table class="tbl tbl-hover">
				<tr class="tr-1">
					<th>번호</th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>포인트</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>신고 누적 횟수</th>
					<th>블랙리스트 관리</th>
				</tr>
				<c:forEach items="${list }" var="member" varStatus="i">
				<tr class="tr-2">
					<td>${member.memberNo }</td>
					<td>${member.memberId }</td>
					<td>${member.memberNick }</td>
					<td>${member.memberPoint }</td>
					<td>${member.memberPhone }</td>
					<td>${member.enrollDate }</td>
					<td>${member.memberReportCount }</td>
					<td><button class="btn bc1 bs1" onclick="location.href='/updateBlackList.do?updateNo=0&memberNo=${member.memberNo}'">블랙리스트 등록</button></td>
					</tr>
					</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>