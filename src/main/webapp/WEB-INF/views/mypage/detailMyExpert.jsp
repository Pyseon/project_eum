<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.backPage{
		margin-top: 50px;
		margin-bottom: 50px;
		width: 100%;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
	<div class="page-content container">
		<div class="posting-wrap">
			<h1 class="fc-1 fs-full">>전문가 상세내역</h1>
		<hr>
		<table class="expertTbl expertTbl_top">
			<tr>
				<th>상담분야</th>
				<td>${exp.expertCategory }</td>
			</tr>
			<tr>
				<th>태그</th>
				<td>${exp.expertTag }</td>
			</tr>
			<tr>
				<th>자격</th>
				<td>가입자격은 이거이거가 필요하다</td>
			</tr>
			<tr>
				<th>자격증</th>
				<td>${exp.credential }</td>
			</tr>
			<tr>
				<th>발급기관/취득일시</th>
				<td>${exp.issuingAuthority }</td>
				<td>${exp.acquistionDate }</td>
			</tr>
			<tr>
				<th>자격증 사본</th>
				<td>${exp.certificatePath}</td>
			</tr>
		</table>
		<h2>판매자 정보</h2>
		<table class="expertTbl expertTbl_bottom">
			<tr>
				<th>판매자 이름</th>
				<td>${exp.expertName}</td>
			</tr>
			<tr>
				<th>직업명</th>
				<td>${exp.jobName}</td>
			</tr>
			<tr>
				<th>전문가 번호</th>
				<td>${exp.expertPhone}</td>
			</tr>
			<tr>
				<th>전문가 이메일</th>
				<td>${exp.expertEmail}</td>
			</tr>
		</table>

				<h2>기각</h2>
				<table class="expertTbl">
					<tr>
						<th>기각 사유</th>
						<td>${rexp.refuseContent }</td>
					</tr>
				</table>
		<div class="backPage">
			<button class="btn bc1 bs4" onclick="location.href=/appExpertList.do?memberNo=${sessionScope.member.memberNo}">목록으로</button>
		</div>
	</div>
</div>
</body>
</html>