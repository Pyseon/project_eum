<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매완료</title>
</head>
<style>
	.successbox{
		width: 80%;
		margin: 0 auto;
		margin-top: 50px;
		padding-top: 100px;
		text-align: center;	
		background-color: #e9ecef;
	}
	.mainText{
		text-align: left;
		margin: 0 auto;
		margin-left: 40%;
		margin-top: 50px;
		margin-bottom: 30px;
	}
	.mainSuccess{
		font-size: 25px;
		font-family: fs-bold;
		margin-top: 20px;
	}
	.payResult{
		margin-left: 40%;
		margin-bottom: 20px;
		text-align: left;
		font-size: 18px;
	}
	.payResult>div{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.btnMaster{
		margin: 0 auto;
		margin-top: 50px !important;
		padding-bottom: 120px;
	}
	.btnMaster>button{
		font-size: 20px;
		font-family: fs-regular;
		padding: 8px 18px !important;
	}
	#home{
		margin-right: 50px;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="successbox">
	<div class="mainText">
		<div class="mainSuccess">구매가 완료되었습니다.</div>
		<div class="mainSuccess">${pay.product.PRODUCT_TITLE }</div>
	</div>
	<div class="payResult">
		<div>주문일시: ${pay.payment.PAYDATE }</div>
		<div>주문번호: ${pay.payment.PAYNO }</div>
		<div>결제금액: ${pay.payment.PAYMENT } 원</div>
	</div>
	<div class="btnMaster">
		<button class="btn bc3 bs3" id="home" type="button">홈으로</button>
		<button class="btn bc1 bs3" id="paymentPage" type="button">구매내역확인</button>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$("#home").click(function(){
		window.location.href ='/'
	});	
	$("#paymentPage").click(function(){
		const memberNo = ${sessionScope.member.memberNo};
		window.location.href = "/Myproduct.do?memberNo="+memberNo;//"/Mypage.do";
		//"/Myproduct.do?memberNo="+memberNo
		/*const memberNo = ${sessionScope.member.memberNo}
		$.ajax({						
			url: "/Myproduct.do?memberNo="+memberNo,
			type: "post",
			//dataType: "json",
			data: {},
			success: function(data){
					console.log("성공")			
			},
			error : function(){
				   console.log("서버요청실패");
			}
		});*/		
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