<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스목록</title>
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
    	width: 240px !important;
    	padding : 0px !important; 
    	height: 385px !important;
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
	margin: 14px 11px 10px 0;
	display: flex;
	justify-content: space-between;
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
	#writeButton{
		margin: 0px 0px 0px 1000px;
		background-color: #ffffff;
		border: 1px solid #a7a7a7;
		padding: 6px 10px;
		border-radius: 4px;
		font-size: 18px;
		line-height: 1.5;
		font-weight: normal;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</head>
<body>
<div>
		<table class="category">
				<tr>
							
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/ClassList.do?reqPage=1&selPro=전체'"><img src="./img/category/전체.png"><h3>전체</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn2" onclick="location.href='/ClassList.do?reqPage=1&selPro=법률'"><img src="./img/category/법률.png"><h3>법률</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn3" onclick="location.href='/ClassList.do?reqPage=1&selPro=비즈니스'"><img src="./img/category/비즈니스.png"><h3>비즈니스</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn4" onclick="location.href='/ClassList.do?reqPage=1&selPro=심리/헬스'"><img src="./img/category/심리_헬스.png"><h3>심리/헬스</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn5" onclick="location.href='/ClassList.do?reqPage=1&selPro=학습'"><img src="./img/category/학습.png"><h3>학습</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn6" onclick="location.href='/ClassList.do?reqPage=1&selPro=금융'"><img src="./img/category/금융.png"><h3>금융</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn7" onclick="location.href='/ClassList.do?reqPage=1&selPro=라이프'"><img src="./img/category/라이프.png"><h3>라이프</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn8" onclick="location.href='/ClassList.do?reqPage=1&selPro=취미'"><img src="./img/category/취미.png"><h3>취미</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn9" onclick="location.href='/ClassList.do?reqPage=1&selPro=어학'"><img src="./img/category/어학.png"><h3>어학</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn10" onclick="location.href='/ClassList.do?reqPage=1&selPro=레저'"><img src="./img/category/레저.png"><h3>레저</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn11" onclick="location.href='/ClassList.do?reqPage=1&selPro=IT/테크'"><img src="./img/category/it.png"><h3>IT/테크</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn12" onclick="location.href='/ClassList.do?reqPage=1&selPro=자기계발'"><img src="./img/category/자기개발.png"><h3>자기계발</h3></button></td>
          		</tr>
          </table>
   </div>
   
   
<div class="container">

	<c:if test="${grade eq null}">
		<button type="button" class="writeButton" id="writeButton" onclick="loginNeed();">등록하기</button>
	</c:if>
	<c:if test="${grade eq 0}">
		<button type="button" class="writeButton" id="writeButton" onclick="manager();">등록하기</button>
	</c:if>
	<c:if test="${grade eq 1}">
		<button type="button" class="writeButton" id="writeButton" onclick="expertNeed();">등록하기</button>
	</c:if>
	<c:if test="${grade eq 2}">
		<button type="button" class="writeButton" id="writeButton" onclick="location.href='/classWriterFrm.do'">등록하기</button>
	</c:if>
	<c:if test="${grade eq 3}">
		<button type="button" class="writeButton" id="writeButton" onclick="blacklist();">등록하기</button>
	</c:if>
			<div class="posting-wrap">

	<c:forEach items="${list }" var="c" varStatus="i">
	<div class="posting-item" style="cursor: pointer;" onclick="location.href='/productDetail.do?productNo=${c.productNo }&expertNo=${c.expertNo }';" >
	<img src="./img/product/ClassList/${c.productImgPath }">
		<div class="posting-connect">
			<ul>
				<li>
					<div class="t1" style="font-family: fs-bold !important;">
						<span class="card-category fs-bold">${c.productTitle }</span>
						<span style="color: #bdbdbd; font-size: 14px !important; line-height: 2;">
						${c.productCategory}
						</span>
					</div>
				</li>
			</ul>
			
			<ul style="margin-top:0px;">
				<li>
					<div class="t3" style="margin-bottom: 5px;" >
					${c.productIntro }
					</div>
					<div style="border-bottom: 1px solid rgba(220, 220, 220, 0.59); ">
					</div>
				</li>
			</ul>
		
		<ul>
			<li>
				<div class="t4">
					<div>
					<span>
						<img src="./img/member/${c.memberPicturepath}">
						&nbsp;
						${c.expertName }
					</span>
					</div>
					
				<div class="t4-right" style="line-height: 2; margin : 0 7px 0 0px">
					<div style="line-height: 2.5;"><span class="material-icons icons-message">message</span></div>
					<div class="t4-info"><span>${c.revCount } </span></div>
					 &nbsp;
					<div style="line-height: 2.5;"><span class="material-icons icons-star">star</span></div>
					<div class="t4-info"><span>${c.reviewStar }</span></div>
				</div>	
					
						 
				</div>
			</li>
		</ul>
		
		<div class="t2" style="margin: 20px 0 0px 0px;" >	
		<c:choose>
		<c:when test="${0 eq c.sale }">	
			<span id="sele" style="width: auto;"></span>
		<span class="t2" style="margin: 0px 0 30px 0px;">
			<span id="price"  class="fc-1" style="width: auto; font-size: 18px; line-height: 1.5;">
			<fmt:formatNumber value="${c.cost }" pattern="#,###,###,###,###"/>원
			</span>
		</span> 
		</c:when>
		<c:otherwise>
		<span id="sele" style="width: auto;">${c.sale}%</span>
	
		<span class="t2" style="margin: 0px 0 30px 0px;">
			<span id="price"  class="fc-7" style="width: auto; font-size: 18px; line-height: 1.5;">
			<fmt:formatNumber value="${c.salecost }" pattern="#,###,###,###,###"/>원
			</span>
			&nbsp;
			<span id="fixed-price" style="width: auto; font-size: 12px; font-style: italic; font-weight: bold; margin: 4px 0 0px 0px;">
			<fmt:formatNumber value="${c.cost }" pattern="#,###,###,###,###"/>원
			</span>
		</span> 
		</c:otherwise>
		</c:choose>
		

		</div><!-- t2 -->
		
		
		</div><!-- posting-connect -->
		
		</div>
	</c:forEach>
		<c:choose>
		<c:when test="${0 eq c.expertNo }">
		<button type="button" class="writeButton" id="writeButton" onclick="location.href='/oginFrm.do'">등록하기</button>
		</c:when>
		<c:otherwise>
		<button type="button" class="writeButton" id="writeButton" onclick="location.href='/classWriterFrm.do'">등록하기</button>
		</c:otherwise>
		</c:choose>
		<input type="text" name="memberNo" value="${grade }">
	</div>													   			
${pageNavi }


</div>
<script>
	function loginNeed(){
	alert('로그인 후 이용해주세요.');
	location.href="/loginFrm.do";
	}
	
	function manager(){
		alert('관리인은 클래스를 등록할 수 없습니다.');
		location.href="/ClassList.do?reqPage=1&selPro=전체";
		}
	
	function expertNeed(){
		alert('전문가 인증을 받고 오세요.');
		location.href="/ClassList.do?reqPage=1&selPro=전체";
	}
	function blacklist(){
		alert('블랙리스트 회원은 등록할 수 없습니다.');
		location.href="/ClassList.do?reqPage=1&selPro=전체";
	}

	$(function(){
		var selPro = '${selPro}';
		console.log(selPro);
		
		for(var i=0; i<12; i++){
			var val = $(".btm_image").eq(i);
			console.log(val);
			if(selPro != '전체'){
				for(var i=1; i<12; i++){
					if(i != 1){
				$(".btm_image").eq(i).addClass("selPro-active");
					}
				break;
				}
			}else{
				$(".btm_image").eq(0).addClass("selPro-active");
				
			}
		
			<!--
			if(selPro == '전체'){
				$(".btm_image").eq(0).addClass("selPro-active");
			}
			if(selPro == '법률'){
				$(".btm_image").eq(1).addClass("selPro-active");
			}
			if(selPro == '비즈니스'){
				$(".btm_image").eq(2).addClass("selPro-active");
			}
			if(selPro == '심리/헬스'){
				$(".btm_image").eq(3).addClass("selPro-active");
			}
			if(selPro == '학습'){
				$(".btm_image").eq(4).addClass("selPro-active");
			}
			if(selPro == '금융'){
				$(".btm_image").eq(5).addClass("selPro-active");
			}
			if(selPro == '라이프'){
				$(".btm_image").eq(6).addClass("selPro-active");
			}
			if(selPro == '취미'){
				$(".btm_image").eq(7).addClass("selPro-active");
			}
			if(selPro == '어학'){
				$(".btm_image").eq(8).addClass("selPro-active");
			}
			if(selPro == '레저'){
				$(".btm_image").eq(9).addClass("selPro-active");
			}
			if(selPro == 'IT/테크'){
				$(".btm_image").eq(10).addClass("selPro-active");
			}
			if(selPro == '자기계발'){
				$(".btm_image").eq(11).addClass("selPro-active");
			}
			-->
				break;
			}
		
	});
		
</script>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</html>