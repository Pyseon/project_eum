<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<div class="header-div">
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
</div>
<style>
.writer{
display: flex;
}
	div > img{
	width: 100px;
	height: 100px;
	vertical-align: middle;
	border-radius: 50%;
	}
	.writer{
	
	}
	.Ask{
	 text-align: right;
	}
	.posting-item{
	    box-sizing: border-box;
	    width: 170px !important;
	    padding: 10px !important;
	    height: 250px !important;
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
	.posting-connect > img{
	width:100px;
	height:100px;
	vertical-align: middle;
	border-radius: 50%;
	margin: 5px 0px 20px 0px;
	}
	.expertName{
	font-size: 20px;
	margin: 0px 0px 7px 0px;
	}
	.expertCategory{
	color: #878686; 
	font-size: 16px;
	}
</style>
<link rel="stylesheet" href="css/report.css" />
<script src="js/report.js"></script>
<body>
	
	<div class="container">
		<div class="category">
			<h1>${req.reqCategory}</h1>
		</div>
		<div class="title">
			<h2>${req.reqTitle }</h2>
		</div>
		<div class="writer" style="margin: 0px 0px 0px 0px;">
		<div>		
			<img src="./img/member/${req.memberPicturepath}">
		</div>
		<div style="margin: 20px 0px 0px 30px;">
		<div class="writername">
			${req.reqNick }
		</div>
		<div class="date" style="margin: 10px 0px 0px 0px;">
			요청일자 : ${req.reqDate }
		</div>
		</div>
		<div style="margin: 70px 0px 0px 680px; display: flex; justify-content: space-between;">
		
		<button type="button" class="writeButton btn bc1 bs4" id="writeButton" onclick="#" style="width:100%; height:40px;">수정하기</button>
		
		<button type="button" class="writeButton btn bc1 bs4" id="writeButton" onclick="#" style="width:100%; height:40px; margin-left:10px;">취소하기</button>
	
		</div>
		</div>
		<div class="content">
		 <h1>요구사항</h1>
		 <div>
		 ${req.reqContent }
		 </div>
		</div>
		
			<form action="/insertreqask.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
				<div class="Ask">
				<input type="hidden" name="expertNo" value="${expertNo }">
				<input type="hidden" name='reqNo' value="${req.reqNo }">
				
				<input type="submit" class="btn bc1 bs4" value="제안하기" style="width:10%; height:40px; margin: 0px 0px 20px 0px">
				</div>
			</form>
		
		
		<div class="tag-list-wrap">
			<ul>
			<c:forEach items="${Tag}" var="tag" step="1">
				<li class="tag-li">
				${tag }
				</li>
			</c:forEach>
			</ul>
		</div>
		
		
		<div class="reportbutton">
		<ul>
			<li><img id="icon-report" src="img/product/icon-report.png"></li>
			<c:choose>
				<c:when test="${memberNo ne 0 }">
					<li>
						<span id="report">
							<a onclick="report('${req.memberNo }','2','${req.reqNo }')">신고</a>
						</span>
					</li>
				</c:when>
				<c:otherwise>
					<li><span id="report"><a onclick="loginNeed();">신고</a></span></li>
				</c:otherwise>
			</c:choose>
			</ul>
			</div>
			
	
	<c:if test="${memberNo eq req.memberNo}">
		<h1>제안한 전문가</h1>
	<div class="posting-wrap">
	<c:forEach items="${list }" var="c" varStatus="i">
	
		<div class="posting-item" style="cursor: pointer;">
		<div class="posting-connect" style="text-align: center;">
		<img src="./img/member/${c.memberPicturepath}">
		<div class="expertName fs-bold">
		${c.expertName }
		</div>
		<div class="expertCategory">
		${c.expertCategory }
		</div>
		<div>
		<input type="button" class="btn bc1" value="프로필 보기" >
		</div>
		</div>
		</div>
	</c:forEach>
	</div>
	</c:if>
	
	<c:if test="${memberNo ne req.memberNo }">
	<h1>제안한 전문가</h1>
	<div class="posting-wrap">
	<c:forEach items="${list }" var="c" varStatus="i">
	
		<div class="posting-item" style="cursor: pointer;">
		<div class="posting-connect" style="text-align: center;">
		<img src="./img/member/${c.memberPicturepath}">
		<div class="expertName fs-bold">
		${c.expertName }
		</div>
		<div class="expertCategory">
		${c.expertCategory }
		</div>
		</div>
		</div>
	</c:forEach>
	</div>
	</c:if>
	</div>
<div class="footer-div">
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>

</html>