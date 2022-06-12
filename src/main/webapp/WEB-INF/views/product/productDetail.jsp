<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/product.css" />
<link rel="stylesheet" href="css/report.css" />
<script src="js/report.js"></script>
</head>
<body>
	<div class="header-div"><%@ include file="/WEB-INF/views/common/header.jsp"%></div>
	<section class="post-content-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="left-title">
						<div class="line-top">
							<span class="title">${p.productTitle} </span><br> 
							<span class="material-icons icon-confirm confirm">verified</span>&nbsp;
							<div class="top-box-name">
								<span class="title-2">${expert.expertName}&nbsp;&nbsp;/</span>&nbsp;
								<span class="title-2">${expert.jobName}</span> 
							</div>
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
							<span data-tab="tab-1" class="detail-title title1 tab-link current">상세내용</span>
							<span data-tab="tab-2" class="detail-title title2 tab-link">후기<span class="tab-review-count"> (${reviewCount})</span></span> <!-- 후기 수 DB -->
						</div>	
						<div class="product-content">
						
							<div id="tab-1" class="tab-content current">
								<div class="detail-wrap">
									<span class="detail-sub-title">상담소개</span>
									<hr class="sub-title-bottom-line">
									<span class="detail-content">${p.productIntro}</span>
									<!-- DB -->
								</div>
								<div class="detail-wrap">
									<span class="detail-sub-title">상세설명</span>
									<hr class="sub-title-bottom-line">
									<div class="detail-main-content">
										<div class="detail-content">
										${p.productContent}
										</div>
										<div class="cover"></div>
										<!-- DB --><br>
									</div>
									<button class="btn bc3" id="moreBtn">상세설명 더보기</button>
								</div>
								<div class="detail-wrap">
									<span class="detail-sub-title">자주 묻는 질문</span>
									<hr class="sub-title-bottom-line">
									<ul class="detail-content content-bg ">
										<c:forEach items="${productQNA}" var="productQNA" varStatus="status">
												<li>
												<c:out value="${productQNA}"/>
												</li>
										</c:forEach>
									</ul>
								</div><!-- detail-wrap -->
								<div class="detail-wrap">
									<span class="detail-sub-title"></span>
									<hr class="sub-title-bottom-line">
									<table class="detail-content tbl" border="1">
										<tr>
											<th>대표자</th>
											<td>${expert.expertName}</td>
											<th>사업장주소</th>
											<td>${p.productAddr}</td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>${expert.expertPhone}</td>
											<th>이메일</th>
											<td>${expert.expertEmail}</td>
										</tr>
									</table>
								</div>
								<div class="detail-wrap">
									<span class="detail-sub-title">취소/환불</span>
									<hr class="sub-title-bottom-line">
									<ul class="detail-content content-bg">
										<li>1. 전문가와 의뢰인 간의 상호 협의 후 거래 철회가 가능합니다.</li>
										<li>2. 전문가의 귀책사유로 작업을 시작하지 않았거나 이에 준하는 보편적인 관점에서
											심각하게 잘못 이행된 경우 결제 금액 전액 환불이 가능합니다.</li>
										<li>3. 전문가가 지정된 서비스를 제공하지 못할 것이 확실할 경우 서비스 비용을 일할 계산하여 
											진행 된 작업만큼 공제하고 잔여 금액을 환불합니다.</li>
									</ul>
								</div>
							</div><!-- tab-content current -->
							
							
							
							
							<!-- //////////////////////////////후기 -->
							<div id="tab-2" class="tab-content">
								<div class="topbox-summary">
									<div class="review-count">
										<div class="summary-content s-con-1">
											<div class="con1">상품 후기 수</div><br>
											<div class="con2">${reviewCount}</div>
										</div>
									</div>
									<div class="review-score-aver">
										<div class="summary-content">
											<div class="con1">상품 평균 별점</div><br>
											<div class="con2"><span class="material-icons icon-star">star</span></div>
											<div class="con2 con-star-score"><span>${reviewAvr}</span></div>
										</div>
									</div>
								</div>
								<div class="real-review-wrap">
								 <c:if test="${reviewCount eq 0}">
								 	<div class="reviewNull">등록된 후기가 없습니다.</div>
								 </c:if>
								</div><!-- real review wrap-->
								<div class="page-nav"></div>
								<!-- 페이징///////////////////////////// -->
								<div class="detail-wrap">
									<span class="detail-sub-title">상품정보 제공 고시</span>
									<hr class="sub-title-bottom-line">
									<table class="detail-content tbl reviewpagetbl" border="1">
										<tr>
											<th width=150px>서비스 제공 사업자</th>
											<td>상품 상세 참조</td>
										</tr>
										<tr>
											<th>인증/허가사항</th>
											<td>상품 상세 참조</td>
										</tr>
										<tr>	
											<th>이용조건</th>
											<td>상품 상세 참조</td>
										</tr>	
										<tr>
											<th>취소/환불 조건</th>
											<td>상품 상세 참조</td>
										</tr>
									</table>
								</div>
								<div class="detail-wrap">
									<span class="detail-sub-title">이음파이낸셜(결제대금예치업 등록번호 : 02-0001-9999)</span>
									<hr class="sub-title-bottom-line">
									<ul class="detail-content content-bg">
										<li>이음은 전자금융거래법에 따라 결제대금 예치업을 운영할 수 있는 전자금융업자로 금융위원회에 등록되었으며, 구매안전서비스를 적용하고 있습니다.</li>
									</ul>
								</div>
							
							</div><!-- tab-content -->
						</div><!-- product-content -->
					</div> <!--left-product-detaile-->
				</div><!-- col-lg-8 posts-list -->
				
				
				
				
				
				
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="right-first-box">
							<div class="product-summary">
								<span id="sele">${p.sale}%</span>
								<span id="price"><fmt:formatNumber value="${cost }" pattern="#,###"/>원</span><span id="fixed-price"><fmt:formatNumber value="${p.cost }" pattern="#,###"/>원</span><br>
								<div class="pro-star-wrap star-wrap">
									<!-- 별점  -->
									<div class="star-sub-wrap">
										<span class="material-icons icons-star">star</span>
									</div>
									<c:if test="${reviewCount ne 0 }">
										<div class="star-sub-wrap">
											<span id="star-score">${reviewAvr }</span>
										</div>
									</c:if>
									<div class="star-sub-wrap">
										<span id="help-number">총 ${paymentCount}회 상담</span>
										<br>
									</div>	
								</div>
								<!-- DB -->
								<div class="pro-report-wrap">
									<ul>
										<li><img id="icon-report" src="img/product/icon-report.png"></li>
										<c:choose>
											<c:when test="${memberNo ne 0}">
												<li><span id="report"><a onclick="report('${expert.memberNo }','0','${p.productNo }')">신고</a></span></li>
											</c:when>
											<c:otherwise>
												<li><span id="report"><a onclick="loginNeed();">신고</a></span></li>
											</c:otherwise>										
										</c:choose>
									</ul>
								</div>
							</div><!-- product-summary -->
							<div class="product-check">
								<ul>
									<li><span class="material-icons icons-check">done</span> <span class="check-content">1:1채팅, 영상 통화 가능</span></li>
									<c:if test="${p.productOption ne 0}">
										<li><span class="material-icons icons-check">done</span> <span class="check-content">기본 상담 ${p.productOption }분</span> <%--DB --%></li>
									</c:if>
									<li><span class="material-icons icons-check">done</span> <span class="check-content">시간 초과 시 추가 비용이 발생할 수 있습니다.</span></li>
								</ul>
							</div>
							<c:choose>
								<c:when test="${memberNo ne 0}">
									<form action="/purchase.do" method="get">
									<input type="hidden" name="productNo" value="${p.productNo }"/>
									<input type="hidden" name="expertNo" value="${expert.expertNo }"/>
									<button type="submit" class="bc1" id="purchaseBtn">구매하기</button>
									</form>
								</c:when>
								<c:otherwise>
									<button type="submit" class="bc1" id="purchaseBtn" onclick="loginNeed();">구매하기</button>
								</c:otherwise>
							</c:choose>
						</div><!--right-first-box-->
					<div class="single-sidebar-widget">
						<div class="right-wish-box">
							<div class="wish-title-wrap">
								<c:choose>
									<c:when test="${wishMemberCheck eq 0 }">
										<div><span class="material-icons icon-wish">favorite_border</span></div>								
									</c:when>
									<c:otherwise>
										<div><span class="material-icons icon-wish">favorite</span></div>
									</c:otherwise>
								</c:choose>
								<div class="wish-count">${wishCount }</div>
							</div>
						</div>	<!-- right-wish-box -->
					</div><!-- single-sidebar-widget -->
						
					</div><!-- widget-wrap -->
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<div class="right-second-box">
							<!-- DB -->
								<div class="picture">
									<a href="#"><img class="testimg" src="/img/member/${expertM.memberPicturePath }"></a>	<!-- 추후 프로필 수정 -->
								</div>
								<div class="expert-profile-wrap">
									<div class="expert-profile">
										<h3 class="expert-info">${expert.expertName }</h3>					
									</div>	
									<div class="expert-profile">
										<span class="material-icons icon-confirm confirm2">verified</span>
									</div>	
								</div><!-- expert-profile -->
								<div class="info-wrap">
									<h5 class="extpert-info info2"><span>${expert.jobName }</span></h5>			
									<h5 class="extpert-info info2"><span>${expert.expertIntro }</span></h5>
								</div><!-- info-wrap -->
							</div><!-- right-second-box -->
						</div><!-- single-sidebar-widget user-info-widget -->
					</div> <!-- widget-wrap -->	
					
					<div class="single-sidebar-widget">
						<div class="right-third-box">
							<div class="tag-title-wrap">
								<ul>
									<li><span class="material-icons icon-tag">tag</span></li>
									<li><span class="tag-title">태그</span></li>
								</ul>
							</div>
							<!-- DB, for문 -->
							<div class="tag-list-wrap">
								<ul>
									<c:forEach items="${tag}" var="tag" step="1">
										<li class="tag-li">
											<a href="#">
												${tag }
											</a>	
										</li>
									</c:forEach>
								</ul>
							</div><!-- tag-list-wrap -->
						</div>	<!-- right-third-box -->
					</div><!-- single-sidebar-widget -->
					
					
					<div class="single-sidebar-widget">
						<div class="right-fourth-box">
							<div class="likeranking">
								<ul>
									<li><span class="likeranking-title">좋아요 순 상담&amp;클래스 TOP 10</span></li>
									<li><span class="material-icons icon-ranking">signal_cellular_alt</span></li>
								</ul>
							</div>
							<hr id="ranking-line">
							<div class="likeranking-list-wrap">
								<c:forEach items="${wishList}" var="wishList" step="1" varStatus="status">
									<ul>
										<li class="ranking-number"><c:out value="${status.index+1}"/></li>
										<li class="likeranking-li"> 
											<c:choose>
												<c:when test="${wishList.productType eq 1}">
													<a class="rankingurl" href="/productDetail.do?productNo=${wishList.productNo }&expertNo=${wishList.expertNo}">${wishList.productTitle }</a> 
												</c:when>
												<c:otherwise>
													<a class="rankingurl" href="/imgVerProductDetail.do?productNo=${wishList.productNo }&expertNo=${wishList.expertNo}">${wishList.productTitle }</a> 
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
								</c:forEach>
							</div><!-- likeranking-list-wrap -->
						</div>	<!-- right-fourth-box -->
					</div><!-- single-sidebar-widget -->
					
					
				</div><!-- col-lg-4 sidebar-widgets -->
			</div><!-- row -->
		</div><!-- container -->
	</section>

	<div class="footer-div"><%@ include file="/WEB-INF/views/common/footer.jsp"%></div>
<script>
	function deletereview(param) {
		const check = confirm('삭제하시겠습니까?');
		if(check == true) {
			$.ajax({
				url : "/deleteReview.do",
				data : {reviewNo:param},
				success : function(data) {
					alert('후기가 삭제되었습니다.');
					if(${p.productType} == 1 || ${p.productType} ==2) {
						location.href="/productDetail.do?productNo=${p.productNo}&expertNo=${expert.expertNo}"						
					}else if(${p.productType} == 3) {
						location.href="/imgVerProductDetail.do?productNo=${p.productNo}&expertNo=${expert.expertNo}"
					}
				},
				error : function() {
					alert('잘못된 접근입니다.');
				}
			});
		}
	}


	$(function(){
		
		const productNo = ${p.productNo};
		const tatalCount = ${reviewCount};
		let isLoadedReview = false;
		
		//상세설명 더보기
		$('#moreBtn').on('click',function(){
			<%--조언 : 내부컨텐츠 만큼 높이값을 잡아라 부모는 높이값이 없고, 자식은 높이값이 있으면 자식만큼 되니까--%>
			const content = $('.detail-main-content');
			if(content.css('-webkit-line-clamp','10')){
				content.css('-webkit-line-clamp','unset');
				const btn = $(this);
				const cover = $('.cover');
				btn.hide();
				cover.hide();
			}
		});
		
		//탭이동
		$('.tab-link').click(function() {
			let tab_id = $(this).attr('data-tab');

			$('.tab-link').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			
			// 후기를 클릭했을 경우
			if(tab_id === 'tab-2') {
				if(!isLoadedReview) {
					// ajax call
					getReviewList(1);
				}
			} 
			

		});
		
		//탭 border-bottom
		$('.title1').click(function() {
			$('.title1').css("border-bottom","3px solid #3865f2");
			$('.title2').css("border","none");
		
		});
		
		$('.title2').click(function() {
			$('.title2').css("border-bottom","3px solid #3865f2");
			$('.title1').css("border","none");
		});
		
		//리뷰 페이징 ajax
		function getReviewList(pageNum) {
			$.ajax({
				url : "/review.do",
				data : {
					productNo : productNo,
					reqPage : pageNum 
				},
				success : function(data) {
					isLoadedReview = true;
					console.log('data>>>>', data);
					putReviewList(data.prm);
					setPageNav(data.pageNavi);
				}
			});
		}
		
		function setPageNav(pageNavi) {
			$(".pagination").off().remove();
			const nav = $(pageNavi);
			nav.find(".page-item").on('click', pageChange);
			$(".page-nav").append(nav);
		}
		
		function pageChange(event) {
			let pageNum = $(this).attr('data-page');
			getReviewList(pageNum);
		}
		
		function getStarPoint(point){
			let span = "";
			for(let i = 1; i <= 5; i++) {
				let starType = 'star';
				if (i > point) {
					starType += '_border';
				}
				span += `<span class="material-icons">\${starType}</span>`;
			}
			span += `<span class="star-score star-score-2">\${point}.0</span>`
			return `<div class="star-wrap star-wrap-2">\${span}</div>`;
		}
		
		function putReviewList(prm) {
			const memberNo = ${memberNo};
			// 기존 페이지 리뷰 제거
			$(".real-review").off().remove();
			
			// 새 페이지 리뷰 삽입 //추후 프로필 수정
			for(let i = 0; i < prm.length; i++) {
				const item = prm[i];
				const productNo = ${p.productNo};
				const review = $(`
					<div class="real-review">
						<div class="member-picture">
							<img class="reviewPicture" src="/img/member/\${item.memberPicturePath }">
						</div>
						<div class="info">
							<div class="info-one">
								<span class="nickname">\${item.memberNick}</span>
									<div class="review-btn-2">
										\${item.memberNo != memberNo 
											? '<br>' 
											: `<a href="/modifyReviewFrm.do?reviewNo=\${item.reviewNo}">수정</a> <a href="#" onclick="deletereview(\${item.reviewNo})">삭제</a> <br>`
										  }	
									</div>
								\${getStarPoint(item.reviewStar)}
								<div class="span-wrap">
									<span class="text">|&nbsp;&nbsp;</span>
									<span class="text">\${item.reviewDate}</span>
									<span class="text">&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
								<div class="review-btn">
									<div class="report-wrap">
										<ul>
											<li><img id="icon-report" src="img/product/icon-report.png"></li>
											<li><span id="report"><a onclick="report('\${item.memberNo }','1','\${reviewNo}')">신고</a></span></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review-content">\${item.reviewContent}</div>
						</div>
					</div>
				`);
				$('.real-review-wrap').append(review);
			}
		}
		
		//좋아요(wish)
		$('.icon-wish').on("click", function() {
			 var memberNo = ${memberNo};
			 var currentValue = this.innerText;
	         if(currentValue == "favorite_border" && memberNo != 0) {
	         	this.innerText = "favorite";
	         	wish();
	         }else {
	            this.innerText = "favorite_border";
	            wishRemove();
	         }
		});
		
		//좋아요(wish) insert
		function wish() {
		var memberNo = ${memberNo};
		//var afterWishCount = Number($('.wish-count').text())+1;
			if(memberNo != 0) {
				$.ajax({
					url : "/insertWish.do",
					data : {
						productNo : productNo,
						memberNo : memberNo
					},
					success : function(data) {
						$('.wish-count').text(data);
						console.log('좋아요!');
					},
					error : function() {
						console.log('에러');
					}
				});	
			}else {
				alert('로그인 후 이용해주세요.');
				location.href="/loginFrm.do";
			}				
		};
		
		//좋아요(wish) delete
		function wishRemove() {
		var memberNo = ${memberNo};
		var afterWishCount = ${wishCount }-1;
			if(memberNo != 0) {
				$.ajax({
					url : "/deleteWish.do",
					data : {
						productNo : productNo,
						memberNo : memberNo
					},
					success : function(data) {
						$('.wish-count').text(data);
						console.log('관심없어요!');
					},
					error : function() {
						console.log('에러');
					}
				});	
			}else {
				alert('로그인 후 이용해주세요.');
				location.href="/loginFrm.do";
			}				
		};
	}); 
</script>
</body>
</html>