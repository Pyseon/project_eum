<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 개설요청</title>
<style>

#writeButton{
    	width: 210px;
    	height: 38px;
		margin: 0px 0px 0px 865px;
	    background-color: #3865f2;
	    border: #3865f2;
   		color : #ffffff;
		padding: 6px 10px;
		border-radius: 4px;
		font-size: 18px;
		line-height: 1.5;
		font-weight: normal;
	}
	.posting-item{
	    box-sizing: border-box;
	    width: 350px !important;
	    padding: 20px !important;
	    height: 280px !important;
	    margin: 25px 10px 25px 10px;
	    border-radius: 6px;
	    background-color: #ffffff;
	    box-shadow: 3px 3px 3px 3px #a1a1a1;
	}
	.posting-connect{
    	padding-top: 10px;
    	padding-right: 20px;
   		padding-bottom: 20px;
    	padding-left: 20px;
}
	img{
		width: 90px;
		height: 90px;
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
	.selReq-active{
	border-bottom: 5px solid rgb(56 101 242) !important;
	}
	.reqcategory{
	font-size : 25px;
	margin-left: 20px;
	}
	.reqtitle{
	font-size : 15px;
	margin-top: 20px;
	}
	.reqdate{
	margin-top: 20px;
	font-size : 18px;
	text-align:right;
	}
	.reqtag{
	margin-top: 20px;
	font-size : 15px;
	text-align:right;
	}
</style>
<div class="header-div">
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</div>
</head>
<body>
	<div>
		<table class="category">
			<tr>
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/requestList.do?reqPage=1&selReq=전체'"><img src="./img/category/전체.png"><h3>전체</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn2" onclick="location.href='/requestList.do?reqPage=1&selReq=법률'"><img src="./img/category/법률.png"><h3>법률</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn3" onclick="location.href='/requestList.do?reqPage=1&selReq=비즈니스'"><img src="./img/category/비즈니스.png"><h3>비즈니스</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn4" onclick="location.href='/requestList.do?reqPage=1&selReq=심리/헬스'"><img src="./img/category/심리_헬스.png"><h3>심리/헬스</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn5" onclick="location.href='/requestList.do?reqPage=1&selReq=학습'"><img src="./img/category/학습.png"><h3>학습</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn6" onclick="location.href='/requestList.do?reqPage=1&selReq=금융'"><img src="./img/category/금융.png"><h3>금융</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn7" onclick="location.href='/requestList.do?reqPage=1&selReq=라이프'"><img src="./img/category/라이프.png"><h3>라이프</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn8" onclick="location.href='/requestList.do?reqPage=1&selReq=취미'"><img src="./img/category/취미.png"><h3>취미</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn9" onclick="location.href='/requestList.do?reqPage=1&selReq=어학'"><img src="./img/category/어학.png"><h3>어학</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn10" onclick="location.href='/requestList.do?reqPage=1&selReq=레저'"><img src="./img/category/레저.png"><h3>레저</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn11" onclick="location.href='/requestList.do?reqPage=1&selReq=IT/테크'"><img src="./img/category/it.png"><h3>IT/테크</h3></button></td>
					<td><button type="button" class="btm_image" id="img_btn12" onclick="location.href='/requestList.do?reqPage=1&selReq=자기계발'"><img src="./img/category/자기개발.png"><h3>자기계발</h3></button></td>
			</tr>
		</table>
	</div>
	<div class="container">
	<h1 style="font-family: fs-bold !important;">개설 요청</h1>
	<c:choose>
	<c:when test="${memberNo eq 0}">
	<button type="button" class="writeButton" id="writeButton" onclick="loginNeed();">요청하기</button>
	</c:when>
	<c:otherwise>
	<button type="button" class="writeButton" id="writeButton" onclick="location.href='/requestWriterFrm.do'">요청하기</button>
	</c:otherwise>
	</c:choose>
<div class="posting-wrap">
<c:forEach items="${list }" var="c" varStatus="i">
<div class="posting-item" style="cursor: pointer;" onclick="location.href='/requestDetail.do?reqNo=${c.reqNo}&memberNo=${c.memberNo }';">
	<div class="posting-connect">
		<ul>
			<li>
			<h1>${sessionScope.reqask.selectExpert }</h1>
				<div class="t1" style="font-family: fs-bold !important;">
					<img src="#">
					<span class="reqcategory fs-bold">${c.reqCategory}</span>

				</div>
			</li>
		</ul>
		<ul>
			<li>
			<div class="reqtitle">
			${c.reqTitle }
			</div>
			</li>
		</ul>
		<ul>
			<li>
			<div class="reqdate">
				${c.reqDate }
			</div>
			</li>
		</ul>
		<ul>
			<li>
			<div class="reqtag">
				${c.reqTag}
			</div>
			</li>
		</ul>
		
	</div>
</div>
</c:forEach>
</div>
</div>
${pageNavi }
</body>
<script>
function loginNeed(){
	alert('로그인 후 이용해주세요.');
	location.href="/loginFrm.do";
	}


$(function(){
	var selReq = '${selReq}';
	console.log(selReq);
	
	for(var i=0; i<12; i++){
		var val = $(".btm_image").eq(i);
		console.log(val);
		if(selReq != '전체'){
			for(var i=1; i<12; i++){
				if(i != 1){
			$(".btm_image").eq(i).addClass("selReq-active");
				}
			break;
			}
		}else{
			$(".btm_image").eq(0).addClass("selReq-active");
		}
		break;
	}
});
</script>
<div class="footer-div">
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</html>