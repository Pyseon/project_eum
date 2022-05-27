<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
    	margin-left: 20px;
	}
	
	.posting-item{
	    box-sizing: border-box;
    	width: 250px !important;
    	padding : 0px !important; 
    	height: 480px !important;
    	margin: 25px 15px 55px 10px;
    	background-color: #f9f9f9;
    	box-shadow: 3px 3px 3px 3px #e7dede;
	}
	
	.t1{
	font-size:18px;
	font-family: fs-bold !important;
	display: flex;
	margin: 20px 0 10px 0;
	justify-content: space-between;
	}
	
	.t1 > img{
	width:20px;
	height:20px;
	}
	.t2{
	display: flex;
	
	
	}
	
	.t3{
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 200px;
  		height: 30px;
	}
	.t4{
	margin: 10px 0 10px 0;
	display: flex;
	justify-content: space-between;
	}
	
	.t4 > span > img{
	width:30px;
	height:30px;
	}
	.posting-item > img{
	width: 100%;
	height: 300px;
	
	}
	.posting-connect{
	    padding: 10px;
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
    	display: inline;
    }
    
    ul, li {
    	padding: 0 !important;
    	margin: 0 !important;
    }
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</head>
<body>
<div style="border-bottom: 1px solid rgba(220, 220, 220, 0.59);">

		<table class="category">
				<tr>
					<td><button type="button" class="btm_image" id="img_btn1" onclick="location.href='/ClassList.do?reqPage=1&selPro=전체'"><img src="./img/category/전체.png"></button><h3>전체</h3></td>
					<td><button type="button" class="btm_image" id="img_btn2" onclick="location.href='/ClassList.do?reqPage=1&selPro=법률'"><img src="./img/category/법률.png"></button><h3>법률</h3></td>
					<td><button type="button" class="btm_image" id="img_btn3" onclick="location.href='/ClassList.do?reqPage=1&selPro=비즈니스'"><img src="./img/category/비즈니스.png"></button><h3>비즈니스</h3></td>
					<td><button type="button" class="btm_image" id="img_btn4" onclick="location.href='/ClassList.do?reqPage=1&selPro=심리/헬스'"><img src="./img/category/심리_헬스.png"></button><h3>심리/헬스</h3></td>
					<td><button type="button" class="btm_image" id="img_btn5" onclick="location.href='/ClassList.do?reqPage=1&selPro=학습'"><img src="./img/category/학습.png"></button><h3>학습</h3></td>
					<td><button type="button" class="btm_image" id="img_btn6" onclick="location.href='/ClassList.do?reqPage=1&selPro=금융'"><img src="./img/category/금융.png"></button><h3>금융</h3></td>
					<td><button type="button" class="btm_image" id="img_btn7" onclick="location.href='/ClassList.do?reqPage=1&selPro=라이프'"><img src="./img/category/라이프.png"></button><h3>라이프</h3></td>
					<td><button type="button" class="btm_image" id="img_btn8" onclick="location.href='/ClassList.do?reqPage=1&selPro=취미'"><img src="./img/category/취미.png"></button><h3>취미</h3></td>
					<td><button type="button" class="btm_image" id="img_btn9" onclick="location.href='/ClassList.do?reqPage=1&selPro=어학'"><img src="./img/category/어학.png"></button><h3>어학</h3></td>
					<td><button type="button" class="btm_image" id="img_btn10" onclick="location.href='/ClassList.do?reqPage=1&selPro=레저'"><img src="./img/category/레저.png"></button><h3>레저</h3></td>
					<td><button type="button" class="btm_image" id="img_btn11" onclick="location.href='/ClassList.do?reqPage=1&selPro=IT/테크'"><img src="./img/category/it.png"></button><h3>IT/테크</h3></td>
					<td><button type="button" class="btm_image" id="img_btn12" onclick="location.href='/ClassList.do?reqPage=1&selPro=자기계발'"><img src="./img/category/자기개발.png"></button><h3>자기계발</h3></td>
          			</tr>
          			</table>
   </div>
   
   
<div class="container">
<div class="posting-wrap">
	<c:forEach items="${list }" var="c" varStatus="i">
	<div class="posting-item" style="cursor: pointer;" onclick="location.href='/productDetail.do?productNo=${c.productNo }&expertNo=${c.expertNo }';" >
	<img src="./img/test/testimg1.png">
		<div class="posting-connect">
			<ul>
				<li>
					<div class="t1" style="font-family: fs-bold !important;">
						<span class="card-category fs-bold">${c.productTitle }</span>
						<fmt:formatNumber value="${c.cost }" pattern="#,###,###,###,###"/>원
					</div>
				</li>
			</ul>
			
			<ul>
				<li>
					<div class="t3" style="border-bottom: 1px solid rgba(220, 220, 220, 0.59);">
					${c.productIntro }
					</div>
				</li>
			</ul>
		
		<ul>
			<li>
				<div class="t4">
					<span>
						<img src="./img/category/자기개발.png">${c.expertName }
					</span>
					<div class="t4-info"><span>${c.revCount }</span></div>
					<div><span class="material-icons icons-star">star</span></div>
					<div class="t4-info"><span>${c.reviewStar }</span></div>		 
				</div>
			</li>
		</ul>
		
		<div class="t2">
			${c.productCategory}
		</div> <!-- t2 -->
		
		
		</div><!-- posting-connect -->
		
		</div>
	</c:forEach>

	</div>													   			
${pageNavi }

</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>