<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>내 구매내역</title>
<style>
.page-content {
    	width: 1200px;
    	margin: 0 auto;
    	margin-bottom: 10px;
    	flex-grow: 1;
	}
	.posting-wrap {
    	display: flex;
    	flex-wrap: wrap;
	}
	.posting-item{
	    box-sizing: border-box;
    	width: calc(100% / 5);
    	padding: 13px;
    	height: 250px;
	}
	
	.t1{
	float: left;
	}
	.t2{
	float: right;
	}
	.posting-item > img{
	width: 100%;
	height: 100px;
		
	}
	.category{
	width: 1000px;
    margin-top: 20px;
    margin-right: auto;
    margin-bottom: 10px;
    margin-left: auto;
    margin-bottom: 10px;
    flex-grow: 1;
	}
	.category > tbody > tr > td > button >img{
	width: 50px;
	height: 50px;
	}
	.category > tbody > tr > td > button{
	padding: 0;
	border: none;
	background: none;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>	
</head>

<body>

<div>
		<table class="category">
				<tr>
							
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/Myproduct.do?reqPage=1&selPro=전문가상담'"><h3>전문가상담</h3></button></td>
				
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/Myproduct.do?reqPage=1&selPro=클래스'"><h3>클래스</h3></button></td>
					
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/Myproduct.do?reqPage=1&selPro=지식마켓'"><h3>지식마켓</h3></button></td>
				</tr>
          </table>
   </div>
	<div class="page-content">
	<div class="posting-wrap">
		<c:forEach var="p" items="${list }" varStatus="i">
		
		<div class="posting-item" style="cursor: pointer;" onclick="location.href='/productDetail.do?productNo=${p.productNo }';" >
			<div class="posting-connect">
			<ul>
				<li>
					<img src="./img/test/testimg1.png">
					<div class="t1" style="font-family: fs-bold !important;">
						<span class="card-category fs-bold">${p.productTitle }</span>
						<span style="color: #bdbdbd;">${p.payMent}</span>
						<span style="color: #bdbdbd;">${p.payState}</span>
					</div>
				</li>
			</ul>
			</div>
		</div>
		
		
		
		<!--  
		<td><a href=" ">${p.productType}</a> </td>
		<td>${p.payDate} </td>
		
		<td>${p.productTitle }</td> 
		<td>${p.payMent} </td>
		<td>${p.payState} </td>
		</tr>
		-->
		</c:forEach>
	</table>

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