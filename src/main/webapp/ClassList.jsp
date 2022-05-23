<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스목록</title>
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
</head>
<body>
<div>
		<table class="category">
				<tr>
					<td><button type="button" class="btm_image" id="img_btn1"><img src="./img/category/전체.png"></button><h3>전체</h3></td>
					<td><button type="button" class="btm_image" id="img_btn2"><img src="./img/category/법률.png"></button><h3>법률</h3></td>
					<td><button type="button" class="btm_image" id="img_btn3"><img src="./img/category/비즈니스.png"></button><h3>비즈니스</h3></td>
					<td><button type="button" class="btm_image" id="img_btn4"><img src="./img/category/심리_헬스.png"></button><h3>심리/헬스</h3></td>
					<td><button type="button" class="btm_image" id="img_btn5"><img src="./img/category/학습.png"></button><h3>학습</h3></td>
					<td><button type="button" class="btm_image" id="img_btn6"><img src="./img/category/금융.png"></button><h3>금융</h3></td>
					<td><button type="button" class="btm_image" id="img_btn7"><img src="./img/category/라이프.png"></button><h3>라이프</h3></td>
					<td><button type="button" class="btm_image" id="img_btn8"><img src="./img/category/취미.png"></button><h3>레저</h3></td>
					<td><button type="button" class="btm_image" id="img_btn9"><img src="./img/category/어학.png"></button><h3>어학</h3></td>
					<td><button type="button" class="btm_image" id="img_btn10"><img src="./img/category/레저.png"></button><h3>레저</h3></td>
					<td><button type="button" class="btm_image" id="img_btn11"><img src="./img/category/it.png"></button><h3>IT/테크</h3></td>
					<td><button type="button" class="btm_image" id="img_btn12"><img src="./img/category/자기개발.png"></button><h3>자기계발</h3></td>
          			</tr>
          			</table>
   </div>
   
<div class="page-content">
<div class="posting-wrap">
	<c:forEach items="${list }" var="c" varStatus="i">
	<div class="posting-item">
			<img src="./img/test/testimg1.png">
				<div class="t1">
					<h2>이름</h2>
				</div>
				<div class="t2">
					<h2>가격</h2>
				</div>
				<h3>내용</h3>
			</tr>			
	</div>
	
	</c:forEach>
</div>
</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>