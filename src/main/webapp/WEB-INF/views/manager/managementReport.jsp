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
				<li><button class="btn bc3" onclick="location.href='manaReport.do?reqPage=1&selectNum=0'">전체</button></li>
				<li><button class="btn bc3" onclick="location.href='manaReport.do?reqPage=1&selectNum=1'">답변대기</button></li>
				<li><button class="btn bc3" onclick="location.href='manaReport.do?reqPage=1&selectNum=2'">답변완료</button></li>
			</ul>
		</div>
		<div class="searchBox">
			<form action="/manaReport.do" method="post">
				<select name="searchType">
					<option value="reportTitle">글제목</option>
					<option value="memberId">이메일</option>
				</select>
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="selectNum" value="0">
				<input type="text" name="keyword">				
				<input id="searchBoxSubmit" type="submit" value="검색" class="btn bc3">
			</form>
		</div>
		<div id="resultTbl">
			<table class = "tbl tbl-hover resultTbl">
				<tr class="tr-1">
					<th>번호</th>
					<th>신고번호</th>
					<th>글제목</th>
					<th>신고받은회원</th>
					<th>카테고리</th>
					<th>신고글번호</th>
					<th>신고일</th>
					<th>답변여부</th>
					<th>상세보기</th>
					<th>답변 거부</th>
				</tr>
				<c:forEach items="${list }" var="rpt" varStatus="i">
				<tr class="tr-2">
					<td>${(reqPage-1)*10 + i.count }</td>
					<td>${rpt.reportNo }</td>
					<td>${rpt.reportTitle }</td>
					<td>${rpt.defendantId }</td>
					<td>
					<c:choose>
						<c:when test="${rpt.reportCategory == 0}">
							상품						
						</c:when>
						<c:when test="${rpt.reportCategory == 1}">
							상품후기
						</c:when>
						<c:when test="${rpt.reportCategory == 2}">
							개설요청													
						</c:when>
						<c:when test="${rpt.reportCategory == 3}">
							커뮤니티						
						</c:when>
						<c:when test="${rpt.reportCategory == 4}">
							커뮤니티댓글						
						</c:when>
					</c:choose>
					</td>
					<td>${rpt.reportIndex }</td>
					<td>${rpt.reportDate }</td>
					<td id="reportIs">
					<c:choose>
						<c:when test="${rpt.reportIs == 0}">
							답변 대기						
						</c:when>
						<c:when test="${rpt.reportIs == 1}">
							답변 완료						
						</c:when>
						<c:when test="${rpt.reportIs == 2}">
							답변 거부						
						</c:when>
					</c:choose>
					</td>
					<td><button class="btn bc1" onclick="location.href='/detailReport.do?reportNo=${rpt.reportNo}&categoryNo=${rpt.reportCategory }&reportIndex=${rpt.reportIndex }'">상세보기</button></td>
					<td><button class ="btn bc1" onclick="location.href=/refuseReport.do?reportNo=${rpt.reportNo}&selNo=2">답변거부</button></td>
					
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