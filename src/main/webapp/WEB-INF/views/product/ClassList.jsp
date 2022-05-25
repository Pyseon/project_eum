<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	}
	.posting-item{
	    box-sizing: border-box;
    	width: calc(100% / 5);
    	padding: 13px;
    	height: 250px;
    	margin: 30px 8px 55px 8px;
	}
	
	.t1{
	float: left;
	font-size:16px;
	}
	.t1 > h4{
	font-family: fs-bold;
	}
	.t1 > img{
	width:20px;
	height:20px;
	}
	.t2{
	float: right;
	font-size:15px
	}
	.t3{
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 200px;
  		height: 30px;
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
</head>
<body>
<div>
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
	<div class="posting-item">
			<img src="./img/test/testimg1.png">
				<li>
				<div class="t1">
					<h4>${c.productTitle }</h4>
				</div>
				<div class="t2">
					<h4>${c.cost }원</h4>
				</div>
				</li>
				<li>
				<div class="t3">
				${c.productIntro }
				</div>
				</li>
				<li>
				<div class="t1">
				<img src="./img/category/자기개발.png">
				${c.expertName }
				</li>
				<li>
				<div class="t2">
					${c.productCategory}
				</div>
				</li>		
	</div>
	</c:forEach>
</div>
${pageNavi }
<div>
</div>
</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>