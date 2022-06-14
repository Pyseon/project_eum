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
	#report{
	 line-height: 3;
	 font-size : 16px;
	}
</style>
<link rel="stylesheet" href="css/report.css" />
<script src="js/report.js"></script>
<body>
	
	<div class="container">
		<div class="category">
			<h1 style="font-weight:bold;">${req.reqCategory}</h1>
		</div>
		<div class="title">
			<h2>${req.reqTitle }</h2>
		</div>
		<div class="writer" style="margin: 0px 0px 20px 0px;">
		<div>		
			<img src="./img/member/${req.memberPicturepath}">
		</div>
		<div style="margin: 20px 0px 0px 30px;">
		<div class="writername" style="font-weight:bold; font-size:16px;">
			${req.reqNick }
		</div>
		<div class="date" style="margin: 10px 0px 0px 0px;">
			요청일자 : ${req.reqDate }
		</div>
		</div>
		<div style="margin: 70px 0px 0px 680px; display: flex; justify-content: space-between;">
		
		<c:if test="${sessionScope.member.memberNo eq req.memberNo }">
			<c:if test="${sei eq 0 }">
				<button class="btn bc1 bs4 reqbtn" onclick="location.href='/updateRequestFrm.do?reqNo=${req.reqNo }'" style="width:100%; height:40px;">수정하기</button>
				
				<button class="btn bc1 bs4 reqbtn" onclick="location.href='/deleteRequest.do?reqNo=${req.reqNo}'" style="width:100%; height:40px; margin-left:10px;">취소하기</button>	
			</c:if>
		</c:if>
	
		</div>
		</div>
		<div class="content" style="border-top: 2px solid rgba(220, 220, 220, 0.59);">
		 <h1 style="font-weight:bold;">요구사항</h1>
		 <div style="min-height: 300px; margin: 30px 0px 0px 0px; font-size:20px">
		 ${req.reqContent }
		 </div>
		</div>
		<c:if test="${sessionScope.member.memberNo ne req.memberNo }">
		<c:if test="${sessionScope.member.grade == 1 }">
			<c:if test="${se eq 0 }">
				<c:if test="${sei eq 0 }">
					<form action="/insertreqask.do" method="post"
						onsubmit="checkForm();return false" enctype="multipart/form-data">
						<div class="Ask">
							<input type="hidden" name="expertNo" value="${expertNo }">
							<input type="hidden" name='reqNo' value="${req.reqNo }">
							<input type="submit" id="submit" class="btn bc1 bs4" value="제안하기"
								style="width: 10%; height: 40px; margin: 0px 0px 20px 0px">
						</div>
					</form>
				</c:if>
			</c:if>
		</c:if>
		</c:if>
		<div style="display: flex; justify-content: space-between; border-bottom: 2px solid rgba(220, 220, 220, 0.59);">
		<div class="tag-list-wrap">
			<ul>
			<c:forEach items="${Tag}" var="tag" step="1">
				<li class="tag-li" style="font-size:20px; line-height: 2.5;">
				${tag }
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="reportbutton">
		<ul style="padding-left: 0px; width: 130px; display: flex; justify-content: space-between;">
		<li>
			<span>
			<img id="icon-report" src="img/product/icon-report.png">
			<c:choose>
				<c:when test="${memberNo ne 0 }">
					<li>
						<span id="report">
							<a onclick="report('${req.memberNo }','2','${req.reqNo }')">신고하기</a>
						</span>
					</li>
				</c:when>
				<c:otherwise>
					<li><span id="report" ><a onclick="loginNeed();" style="cursor: pointer;">신고하기</a></span></li>
				</c:otherwise>
			</c:choose>
			</span>
			</ul>
			</div>
			</div>
			
	
	<c:choose>
	<c:when test="${se eq 0 }">
		<h1 style="font-weight:bold;">제안한 전문가</h1>
	</c:when>
	<c:otherwise>
	<h1 style="font-weight:bold;">채택된 전문가</h1>
	</c:otherwise>
	</c:choose>
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
		<c:if test="${sessionScope.member.memberNo eq req.memberNo}">
		<c:if test="${c.selectExpert eq 0 }">
			<button class="btn bc1" onclick="location.href='selectExpert.do?reqNo=${c.reqNo}&expertNo=${c.expertNo }'" >선택하기</button>
		</c:if>
		</c:if>
		
		</div>
		</div>
		</div>
	</c:forEach>
	</div>
	</div>
<div class="footer-div">
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>

</html>