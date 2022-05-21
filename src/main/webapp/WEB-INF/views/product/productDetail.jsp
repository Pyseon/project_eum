<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/product.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<section class="post-content-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="left-title">
						<div class="line-top">
							<span class="title">상담제목</span><br> 
							<img class="icon-shield" src="img/product/icon-shield1.png">&nbsp;
							<span class="title-2">유재석&nbsp;&nbsp;&nbsp;/</span>&nbsp;&nbsp;&nbsp;
							<span class="title-2">변호사</span> <!-- DB -->
						</div><!-- line-top -->
						<hr>
						<div class="line-bottom">
							<span class="title-3">상담 이용 안내</span>
							<ul>
								<li class="title-2">· 실제 상담 시작은 상호 협의하에 진행 됩니다.</li>
								<li class="title-2">· 1:1 채팅 상담 이외의 방법으로 상담 진행 시 추후 문제 예방을 위하여 이력을 남겨주시기 바랍니다.</li>
							</ul>
						</div><!-- line-bottom" -->
					</div><!--left-title"-->
					
					<div class="left-product-detail">
						<div class="detail-1">
							<span class="detail-title">상세내용</span>
						</div>
						<div>
							<span>상담소개</span>
							<hr>
							<span>20 년 경력의 세무사가 상담해주는 정확한 상담</span>
							<!-- DB -->
						</div>
						<div>
							<span>상세설명</span>
							<hr>
							<span>최대한 정확하고 신속하게 상담 해드리겠습니다.</span>
							<!-- DB -->
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
									<!-- DB -->
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
								<!-- DB -->
								<li>답변1</li>
								<!-- DB -->
							</ul>
							<ul>
								<li>질문1</li>
								<!-- DB -->
								<li>답변1</li>
								<!-- DB -->
							</ul>
						</div>
					</div> <!--left-product-detaile-->
				</div><!-- col-lg-8 posts-list -->
				
				
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="right-first-box">
							<span>50,000</span>
							<span>별점</span>
							<span>n회 상담</span>
							<span>신고하기</span>
							<!-- DB -->
							<span>아이콘</span> <span>1:1채팅, 영상 통화 가능</span>
							<span>아이콘</span> <span>기본 상담 30분</span> <%--DB --%>
							<span>아이콘</span> <span>시간 초과 시 추가 비용이 발생할 수 있습니다.</span>
							<button>구매하기</button>
						</div><!--right-first-box-->
					</div><!-- widget-wrap -->
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<img src="img/testpicture.png" alt="">
							<h3>
								<a href="#">
									전문가이름
								</a>
							</h3>
							<p>
								직업명
							</p>
							<p>
								자기소개
							</p>
							<p>
								회사이름
							</p>
						</div><!-- single-sidebar-widget user-info-widget -->
					</div> <!-- widget-wrap -->	
					<div class="widget-wrap">
						<div class="right-third-box">
							<div class="tag-title">
								<span>아이콘</span>
								<span>태그</span>
							</div>
							<div class="tag-content"> <!-- DB, for문 -->
								<div class="tag"></div> 
								<div class="tag"></div> 
								<div class="tag"></div> 
								<div class="tag"></div> 
								<div class="tag"></div> 
							</div>
						</div><!--right-third-box-->
					</div><!--widget-wrap-->	
				</div><!-- col-lg-4 sidebar-widgets -->
			</div><!-- row -->
		</div><!-- container -->
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>