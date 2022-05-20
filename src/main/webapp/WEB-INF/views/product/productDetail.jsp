<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.left-title {
		
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="left">
		<div class="left-title">
			<span>상담제목</span> <span>이름</span> <span>직업명</span> <!-- DB -->
			<hr>
			<span>상담 이용 안내</span>
			<ul>
				<li>실제 상담 시작은 상호 협의하에 진행 됩니다.</li>
				<li>1:1 채팅 상담 이외의 방법으로 상담 진행 시 추후 문제 예방을 위하여 이력을 남겨주시기 바립니다.</li>
			</ul>
		</div>
		<div class="left-product-detaile">
			<div>
				<span>상담소개</span>
				<hr>
				<span>20 년 경력의 세무사가 상담해주는 정확한 상담</span>
				<%--DB --%>
			</div>
			<div>
				<span>상세설명</span>
				<hr>
				<span>최대한 정확하고 신속하게 상담 해드리겠습니다.</span>
				<%--DB--%>
			</div>
			<button>상세설명 더보기</button>
			<div>
				<span>판매자 정보</span>
				<hr>
				<table>
					<tr>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>사업장주소</th>
					</tr>
					<tr>
						<td>홍길동</td>
						<td>hong@naver.com</td>
						<td>010-0000-0000</td>
						<td>서울특별시 영동포구</td>
						<%-- DB --%>
					</tr>
				</table>
			</div>
			<div>
				<span>취소/환불</span>
				<ul>
					<li>전문가와 의뢰인 간의 상호 협의 후 거래 철회가 가능합니다.</li>
					<li>전문가의 귀책사유로 작업을 시작하지 않았거나 이에 준하는 보편적인 관점에서 심각하게 잘못 이행된 경우
						결제 금액 전액 환불이 가능합니다.</li>
					<li>전문가가 지정된 서비스를 제공하지 못할 것이 확실할 경우 서비스 비용을 일할 계산하여 진행 된 작업만큼
						공제하고 잔여 금액을 환불합니다.</li>
				</ul>
			</div>
			<div>
				<span>자주묻는 질문</span>
				<hr>
				<ul>
					<li>질문1</li>
					<%--DB --%>
					<li>답변1</li>
					<%--DB --%>
				</ul>
				<ul>
					<li>질문1</li>
					<%--DB --%>
					<li>답변1</li>
					<%--DB --%>
				</ul>
			</div>
		</div>
	</div>
	<div class="right">
		<div class="right-first-box">
			<span>50,000</span>
			<span>별점</span>
			<span>n회 상담</span>
			<span>신고하기</span>
			<%--DB --%>
			<hr>
			<span>아이콘</span> <span>1:1채팅, 영상 통화 가능</span>
			<span>아이콘</span> <span>기본 상담 30분</span> <%--DB --%>
			<span>아이콘</span> <span>시간 초과 시 추가 비용이 발생할 수 있습니다.</span>
			<button>구매하기</button>
		</div>
		<div class="right-second-box">
			<div>전문가 프로필</div> <%--DB --%>
			<span>전문가이름</span><span>아이콘</span>
			<span>직업명</span>
			<span>자기소개</span>
			<span>회사이름</span>
			<span>직급</span>
			<button>프로필보기</button>
		</div>
		<div class="right-third-box">
			<div class="tag-title">
				<span>아이콘</span>
				<span>태그</span>
			</div>
			<div class="tag-content"> <%--for문 --%>
				<div class="tag"></div> <%--DB --%>
				<div class="tag"></div> <%--DB --%>
				<div class="tag"></div> <%--DB --%>
				<div class="tag"></div> <%--DB --%>
				<div class="tag"></div> <%--DB --%>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>