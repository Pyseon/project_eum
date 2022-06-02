<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>내 구매내역</title>
<style>

li{
   list-style:none;
   padding-left:0px;
   }


	.posting-wrap {
    	display: flex;
    	flex-wrap: wrap;
    	margin-left: 46px;
	}
	
	.posting-item{
	    box-sizing: border-box;
    	width: 241px !important;
    	padding : 0px !important; 
    	height: 312px !important;
    	margin: 25px 10px 25px 10px;
    	background-color: #ffffff;
    	box-shadow: 3px 3px 3px 3px #e7dede;
	}
	
	
	.t1{
	font-size:18px;
	font-family: fs-bold !important;
	display: flex;
	margin: 20px 0 0px 0;
	justify-content: space-between;
	}
	
	.t1 > img{
	width:20px;
	height:20px;
	}
	.t2{
	display: flex;
	justify-content: space-between;
	
	
	}
	
	.t3{
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 100%;
  		height: 30px;
  		font-size:17px;
  		
	}
	.t4{
	margin: 14px 0 10px 0;
	display: flex;
	}

	.t4 > span{
	 text-align: center;
	 line-height: 1;
	}
	.t4 > div > span > img{
	width:30px;
	height:30px;
	vertical-align: middle;
	border-radius: 50%;
	}
	.t4-right{
	display: flex;
 	margin-left: auto;
 	width: 30%;
    }
	
	.posting-item > img{
	width: 100%;
	height: 180px;
	
	}
	
	.posting-connect{
    	padding-top: 10px;
    	padding-right: 20px;
   		padding-bottom: 20px;
    	padding-left: 20px;
}
	.posting-connect > ul {
		margin: 0px !important;
		margin-top: 3px !important;
		padding: 0px !important;
	}
	
	
	.category{
	width: 1000px;
    margin-top: 20px;
    margin-right: auto;
    margin-bottom: 10px;
    margin-left: auto;
    margin-bottom: 10px;
    flex-grow: 1;
    border-bottom: 1px solid rgba(220, 220, 220, 0.59);
    
	}
	.category > tbody > tr > td > button >img{
	width: 70%;
	height: 70%;
	}
	
	.category > tbody > tr > td > h3{
	text-align:center;
	}
	.category > tbody > tr > td > button{
	padding: 0;
	border: none;
	background: none;
	}
	.category > tbody > tr > td{
	position: center;
	}
	.star-wrap span {
    float: left;
    color: #ff990d;
    }
    .t4-info{
    	display: flex;
    }
    
    
    
    .material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 18px !important;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
    
}
	.icons-star{
	 color: #ff990d;
	}
	
	#sele {
	font-size: 20px;
	color: #3865f2;
	font-style: italic;
	font-weight: bold;
	}

	#price{
		
		font-size: 14px;
		font-weight: bold;
		line-height: 2;
	}
	
	#fixed-price{
		
		text-decoration: line-through;
		font-size: 13px;
		line-height: 2;
	}
	#im_btn1{
	border-bottom: 1px solid rgba(220, 220, 220, 0.59);
	}
	.selPro-active{
	border-bottom: 5px solid rgb(56 101 242) !important;
	}

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>	
</head>

<body>
	<table class="category">
				<tr>
							
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/ClassList.do?reqPage=1&selPro=전체'"><h3>전문가상담</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn2" onclick="location.href='/ClassList.do?reqPage=1&selPro=법률'"><h3>클래스</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn3" onclick="location.href='/ClassList.do?reqPage=1&selPro=비즈니스'"><h3>지식마켓</h3></button></td>
				</tr>
      </table>

	<div class="page-content">
		
	<div class="posting-wrap">
		
	
		<c:forEach var="p" items="${list }" varStatus="i">
		
		<div class="posting-item" style="cursor: pointer;" >
			<img src="./img/test/testimg1.png">
			<div class="posting-connect">
			<ul>
				<li>
					
					<div>
						<span class="card-category fs-bold">${p.productTitle }</span>
					</div>
					<div>
						<span style="color: #bdbdbd;">${p.payMent} 원</span>
						
					</div>
					<div class="paystate">
						<c:if test="${p.payState eq 1}">
								<span style="color: #1abc9c;">예약완료</span>
						</c:if>
						<c:if test="${p.payState eq 2}">
								<span style="color: #3865f2;">구매확정</span>
						</c:if>
						<c:if test="${p.payState eq 3}">
								<span style="color: #f05454;">취소완료</span>
						</c:if>
					</div>
					
				</li>
			</ul>
			</div>
			<div>
						<button class="btn bc3 bs7" id="login-btn" type="button" onclick="location.href='/Myproductdetail.do?payNo=${p.payNo}'">${p.payNo}</button>
						
						<button class="btn bc3 modal-open-btn" target="#test-modal">주문취소</button>
						
						<button class="btn bc5 bs7" id="login-btn" type="button" value="${p.payNo}"  onclick="location.href='/.do'">시작하기</button>
			</div>
		</div>
		
		</c:forEach>
	</table>
<div id="test-modal" class="modal-bg">
	<div class="modal-wrap">
		<div class="modal-head">
			<h2>취소하시겠습니까?</h2>
			<br>
		</div>
		<div class="modal-content">
			<table class="modal-content-tbl">
				<tr>
					<th class="modal-tbl-th">주문내역</th>
					<br>
					<td class="modal-tbl-td">${p.productTitle }</td>
				</tr>
				
				<tr>
					<th class="modal-tbl-th">환불가격</th>
					<td class="modal-tbl-td">${p.payMent} 원</td>
				</tr>
			</table>
		</div>
		<div class="modal-foot">
			<p>
				수업 진행후 취소시에 환불이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
				영업일 2-3일 내로 처리될 예정입니다.
			</p>
			<div class="modal-btns-container">
				<button class="btn bc3" id="modal-btns-item" onclick="location.href='/DeleteMyproduct.do'">구매취소</button>
				<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		var selPro = '${selPro}';
		console.log(selPro);
		
		for(var i=0; i<3; i++){
			var val = $(".btm_image").eq(i);
			console.log(val);
			if(selPro != '전체'){
				for(var i=1; i<3; i++){
					if(i != 1){
				$(".btm_image").eq(i).addClass("selPro-active");
					}
				break;
				}
			}else{
				$(".btm_image").eq(0).addClass("selPro-active");
				
			}
			break;
			}
		
	});
		
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>