<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 구매하기</title>
<!-- 결제 라이브러리 경로추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<style>
	.purchasebox{
		margin: 0 auto;
		margin-top: 50px;
		width: 70%;
	}
	.purchasemain{
		font-size: 25px;
		margin-bottom: 40px;
	}
	.purchasesub{
		margin-left:2%;
		font-size: 25px;
		margin-bottom: 40px;
	}
	.purchaseall{
		margin-left: 2%;
	}
	.purchase>div{
		display: inline;
		font-size: 18px;
	}
	.purchase{
		margin-bottom: 40px;
	}
	.price,.price>span{
		color:blue;
		font-size: 20px;
		font-family: fs-bold;
		margin-bottom: 20px;
	}
	.consulting{
		font-size: 18px;
		margin-bottom: 20px;
	}
	.explan{
		margin:0 auto;
		margin-bottom: 40px;
		width: 99%;
		padding: 15px 25px;
		background-color:rgba(211, 84, 0, 0.07);
		border-radius: 10px;
	}
	.explan>div:first-child {
		font-size: 20px;
		font-family:fs-bold;
		color: rgb(211, 84, 0);
		margin-bottom: 15px;
	}
	.explan>div:last-child {
		font-size: 15px;
		margin-left: 15px;
		font-family: fs-reguler;
	}
	.pointbox{
		margin: 0 auto;
		width: 99%;
	}
	.point{
		font-size: 18px;
		margin-bottom: 30px;
	}
	#inputplus{
		display:inline;
		height: 60px;
		width: 75%;
		float: left;
	}
	#pointBtn{
		line-height: 42px;
		display:inline;
		float: right;
		width: 20%;
		font-size: 20px;	
		font-family: fs-regular;
	}
	.pointstock{
		font-family:fs-regular;
		font-size: 20px;
		margin-left: 10px;
		margin-top: 70px;
		margin-bottom: 60px;
	}
	.finalbox{
		margin: 0 auto;
		margin-bottom: 50px;
		width: 99%;
	}
	.final-payment{
		font-size: 20px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	.final-price{
		font-size: 20px;
		height: 60px;
	}
	.checkedbox{
		margin: 0 auto;
		width: 90%;
		font-size: 18px;
	}
	.main-agreement{
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		margin-bottom: 30px;
	}
	.checkbox-s>div>label{
		font-family: fs-light;
	}
	.noice-list{
		width: 90%;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: 30px;
		font-size: 20px;
	}
	.noice-list>div:first-child{
		margin-bottom: 10px;
	}
	.noice-s{
		margin: 0 auto;
		width: 98%;
		font-size: 15px;
		line-height: 30px;
	}
	#purchase-btn{
		font-size: 20px;
		height: 70px;
		margin: 0 auto;
		display:block;
		align-content:center;
		width: 95%;
	}
	#pointText{
		width: 96%;
		margin: 0 auto;
		margin-top:-50px;
		margin-bottom: 20px;
			
	}
	
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="purchasebox">
	<div class="purchasemain fs-bold">
		<c:choose>
			<c:when test="${product.productType eq'1'}">
				상담 결제하기
			</c:when>
			<c:when test="${product.productType eq'2'}">
				클래스 결제하기
			</c:when>
			<c:otherwise>
				상품 결제하기
			</c:otherwise>
		</c:choose>
	</div>
	<div class="purchasesub fs-bold">${product.productTitle }</div> 						<!--상품 product_title  -->
	<div class="purchaseall">														
		<div class="purchase">
			<div class="expert">${expert.expertName }   &nbsp</div>						<!--전문가 expert_name  -->
			<div class="job">&nbsp | &nbsp&nbsp ${expert.jobName }</div>			<!--전문가 job_name -->
		</div>
		<div class="price fs-bold"> <span id="product-cost">${product.cost }</span> 원</div>						<!--상품 cost -->
		<div class="consulting"> <!-- 1:1 상담--> &nbsp <span>${product.productOption } </span> 분</div>					<!--상품 product_opthion -->
		<div class="backgroundcolororange">								<!--  -->
			<div class="purchasebody">
				<div class="explan" id="explan">
					<div>꼭 확인 해주세요!</div>
					<div>실제 상담 시간은 상호 협의하에 진행됩니다.</div>
				</div>
			</div>
			<div class="pointbox">
				<div class="point fs-bold">포인트</div>											<!--멤버 member_point -->
				<form>
					<input class="input-form" id="inputplus" type="text" name="memberPoint" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '')">
					<button class="btn bc1 bs3" id="pointBtn" type="button">사용하기</button>
				</form>
			</div>
			<br>
			<div class="pointstock">사용가능한 포인트 : <span id="sessionMemberPoint">${sessionScope.member.memberPoint }</span></div>
			<div id="pointText"></div>
			<br>
		</div>
		<div class="finalbox">
			<div class="final-payment fs-bold">최종 결제 금액</div>									<!-- 상품 cost - member_poit -->
			<input class="final-price input-form" type="text" id="final-price" value="" readonly>
		</div>
	</div>
	<div class="checkedbox">
		<div class="main-agreement"><input class="main-agreement" type="checkbox"> <label> 아래 내용에 전체 동의합니다</label></div>
		<div class="checkbox-s">
			<div><input type="checkbox" class="agreement"> <label> 상품 구매 조건 확인 및 구매 동의</label></div>
			<div><input type="checkbox" class="agreement"> <label> 환불 제한 및 청약 처로히 등에 관한 안내 확인 및 동의</label></div>
			<div><input type="checkbox" class="agreement"> <label> 하단 유의사항의 확인 및 동의</label></div>
		</div>
	</div>
	<div class="noice-list">
		<div class="fs-bold">유의사항</div>
		<div class="noice-s">
			<div>해당 상품은 상담 과정에서 전문가에게 회원의 개인정보 제공이 필요할 수 있습니다.</div>
			<div>사업자가 아닌 개인 전문가의 상품인 경우, 현금 영수증 발급이 불가합니다.</div>
			<div>청약 철회 등 환불 기준은 상품 상세 페이지의 "청약철회 등 환불 안내"를 참조재 주시기 바랍니다.</div>
		</div>
	</div>
	<button class="btn bc1 bs4" id="purchase-btn"  type="buttion">구매하기</button>
	<br><button class="btn bc4 bs4" id="purchase-btn2"  type="buttion">구매하기테스트!</button>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	//결제api
	$("#purchase-btn").click(function(){
		if(checkInput&&pointUse){
			const payPrice = $("#final-price").val();
			console.log(payPrice);
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			console.log(date);
			IMP.init("imp75861734");				//결제 API 사용을 위한 식별코드 입력
			IMP.request_pay({
				merchant_uid : "${product.productNo}"+date , 			//거래 ID
				name : "${product.productTitle}",					//결제이름
				amount : payPrice,									//결제금액
				buyer_email : "${sessionScope.member.memberId}",	//구매자 email 주소
				buyer_name : "${sessionScope.member.memberNick}",	//구매자이름
				buyer_tel : "${sessionScope.member.memberPhone}",	//구매자 전화번호
				buyer_addr : "온라인",								//구매자 주소
				buyer_postcode : "12345"							//구매자 우편번호
			},function(rsp){
				if(rsp.success){
					console.log("결제가 완료되었습니다.");
					console.log("교유ID : "+rsp.imp_uid);
					console.log("상점거래ID : "+rsp.merchant_uid);
					console.log("결제 금액 : "+rsp.paid_amount);
					console.log("카드승인번호 : "+rsp.apply_num);
					//추가 DB작업이 필요한경우 이 부분에 결제내역을 DB에 저장하는 코드 작성
					const memberNo = ${sessionScope.member.memberNo};
					const productNo = ${product.productNo};
					const payState = 1;
					const payMethod = '카드';
					//const payDate = 오늘날짜;
					const payment = payPrice;
					const payUsepoint =	0;//$("[name=memberPoint]");
					const payAddpoint = 0;//parseInt(payPrice*0.02);
					//counserl_tbl
					//상담번호
					//주문번호
					//회원번호
					const expertNo = ${product.expertNo};
					const limitTime = ${product.productOption};
					const startTime = null;
					//상담 counsel_tbl추가용
					const productType = ${product.productType};
					/*
					if(productType!=1){
						payState = 2;
					}
					*/
					console.log("ajax실행");
					console.log(memberNo);
					console.log(productNo);
					console.log(payState);
					console.log(payMethod);
					console.log(payment);
					console.log(payUsepoint);
					console.log(payAddpoint);
					$.ajax({						
						url: "/paymentResult.do",
						type: "post",
						//dataType: "json",
						data: {
							memberNo:memberNo,
							productNo:productNo,
							payState:payState,
							payMethod:payMethod,
							payment:payment,
							payUsepoint:payUsepoint,
							payAddpoint:payAddpoint,
							expertNo:expertNo,
							limitTime:limitTime,
							startTime:startTime,
							productType:productType
							},
						success: function(data){
							if(data == "1"){
								const title = "결제가 완료되었습니다.";
								const icon = "success";
								const msgTime = 1500;
								toastShow(title,icon, msgTime);
								location.replace("/purchaseSuccess.do?memberNo="+memberNo+"&productNo="+productNo);
							}else if(data == "0"){
								const title = "결제에 실패했습니다.";
								const icon = "error";
								const msgTime = 1500;
								toastShow(title,icon, msgTime);
							}	
						},
						error : function(){
							   console.log("서버요청실패");
						}
					});
				}else{
					alert("에러내용 : "+rsp.err_msg);
				}
				
			});
		}else{
			const title = "서비스 이용 동의가 필요합니다.";
			const icon = "info";
			const msgTime = 1500;
			toastShow(title,icon,msgTime);	
		}
		
	});
	//체크박스 체크하기!
	let checkInput = false;
	$('.main-agreement').on('click',function(){ 
		var checked = $('.main-agreement').is(":checked");
    	if(checked){
    		$('.agreement:not(:disabled)').not(this).prop('checked', true);
    		checkInput = true;
    	}else{
    		$('.agreement:not(:disabled)').not(this).prop('checked', false);
    		checkInput = false;
    	}
	});
	//체크박스 개별요소
	$('.agreement').on('click',function(){ 
	    if($('.agreement:not(:disabled)').length == $('.agreement:checked').length){
	        $('.main-agreement').prop('checked',true);
	        checkInput = true;
	    }else{
	        $('.main-agreement').prop('checked',false);
	        checkInput = false;
	    }
	});
	//보유 포인트 유효성 검사
	let pointUse = true;
	$("[name=memberPoint]").change(function(){
		$("#pointText").text("");
		var memberPoint = ${sessionScope.member.memberPoint };
		var inputPoint = $("[name=memberPoint]").val();
		if(inputPoint>memberPoint){
				console.log(inputPoint);
				console.log(memberPoint);
				$("#pointText").text("포인트를 확인해주세요");
				$("#pointText").css("color","#ff2e63");
				pointUse = false;
		}else if(inputPoint==""){
			$("#pointText").text("");
			pointUse = true;
		}else{
			$("#pointText").text("포인트 사용 가능합니다");
			$("#pointText").css("color","#3865f2");
			pointUse = true;
		}	
	});
	//최종 금액액 불러오기-바로실행
	$(function(){
		var firstPrice = ${product.cost };
		var salePrice = 0.01*${product.sale };
		var saleCost = firstPrice*salePrice;
		var finalcost = firstPrice - saleCost;
		var number = Math.round(finalcost);
		$("#final-price").val(finalcost);
		$("[name=memberPoint]").val(0);
		console.log(pointUse);
	});
	//포인트사용-결제금액 변경
	$("#pointBtn").click(function(){
		var price = ${product.cost };
		var point = $("[name=memberPoint]").val();	
		console.log(price);
		if(pointUse){
			var finalPrice = (Number(price)-Number(point));
			$("#final-price").val(finalPrice);
		}
	});
	//토스트 알림 함수		
	function toastShow(title, icon, msgTime){
		const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: msgTime,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		 	})
	
	  	Toast.fire({
	    title: title,
	    icon: icon
	  })
	
	}
	//임시구매
	$("#purchase-btn2").click(function(){
		if(checkInput&&pointUse){
			const payPrice = $("#final-price").val();
			console.log(payPrice);
	
			const memberNo = ${sessionScope.member.memberNo};
			const productNo = ${product.productNo};
			const payState = 1;
			const payMethod = '카드';
			//const payDate = 오늘날짜;
			const payment = payPrice;
			const payUsepoint =	$("[name=memberPoint]").val();
			const payAddpoint = parseInt(payPrice*0.02);
			//counserl_tbl
			//상담번호
			//주문번호
			//회원번호
			const expertNo = ${product.expertNo};
			const limitTime = ${product.productOption};
			const startTime = null;
			//상담 counsel_tbl추가용
			const productType = ${product.productType};
			console.log("ajax실행");
			console.log(memberNo);
			console.log(productNo);
			console.log(payState);
			console.log(payMethod);
			console.log(payment);
			console.log(payUsepoint);
			console.log(payAddpoint);
			$.ajax({						
				url: "/paymentResult.do",
				type: "post",
				//dataType: "json",
				data: {
					memberNo:memberNo,
					productNo:productNo,
					payState:payState,
					payMethod:payMethod,
					payment:payment,
					payUsepoint:payUsepoint,
					payAddpoint:payAddpoint,
					expertNo:expertNo,
					limitTime:limitTime,
					startTime:startTime,
					productType:productType
					},
				success: function(data){
					if(data == "1"){
						const title = "결제가 완료되었습니다.";
						const icon = "success";
						const msgTime = 1500;
						toastShow(title,icon, msgTime);
						location.replace("/purchaseSuccess.do?memberNo="+memberNo+"&productNo="+productNo);
					}else if(data == "0"){
						const title = "결제에 실패했습니다.";
						const icon = "error";
						const msgTime = 1500;
						toastShow(title,icon, msgTime);
					}	
				},
				error : function(){
					   console.log("서버요청실패");
				}
			});
		}else{
			const title = "서비스 이용 동의가 필요합니다.";
			const icon = "info";
			const msgTime = 1500;
			toastShow(title,icon,msgTime);	
		}
	});
		
</script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>