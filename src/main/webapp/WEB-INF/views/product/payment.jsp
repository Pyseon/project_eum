<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>
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
	.price{
		color:blue;
		font-size: 20px;
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
	#pointbtn{
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
		margin-bottom: 50px;
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
	
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="purchasebox">
	<div class="purchasemain fs-bold">상품구매하기</div>
	<div class="purchasesub fs-bold">${productTitle }</div> 						<!--상품 product_title  -->
	<div class="purchaseall">														
		<div class="purchase">
			<div class="expert">전문가이름   &nbsp</div>						<!--전문가 expert_name  -->
			<div class="job">&nbsp | &nbsp&nbsp 직업명or분류</div>			<!--전문가 job_name -->
		</div>
		<div class="price fs-bold"> ${cost } 원</div>						<!--상품 cost -->
		<div class="consulting"> 1:1 상담 &nbsp 30분</div>					<!--상품 product_opthion -->
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
					<input class="input-form" id="inputplus" type="text" name="memberPoint">
					<button class="btn bc1 bs3" id="pointbtn" type="submit">사용하기</button>
				</form>
			</div>
			<br>
			<div class="pointstock">사용가능한 포인트 : <span>${sessionScope.member.memberPoint }</span></div>
		</div>
		<div class="finalbox">
			<div class="final-payment fs-bold">최종 결제 금액</div>									<!-- 상품 cost - member_poit -->
			<input class="final-price input-form" type="text" name="" value="${cost }" readonly>
		</div>
	</div>
	<div class="checkedbox">
		<div class="main-agreement"><input type="checkbox"> <label> 아래 내용에 전체 동의합니다</label></div>
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
	<button class="btn bc1 bs4" id="purchase-btn" onclick="location.href='/purchaseSuccess.do'" type="submit">구매하기</button>
	<button class="btn bc2 bs4" id="purchase-btn" onclick="location.href='/purchaseFailed.do'" type="submit">실패하기</button>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>