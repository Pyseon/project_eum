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
	border-bottom: 2px solid rgba(220, 220, 220, 0.59);
	}
	.reportbutton{
	border-bottom: 2px solid rgba(220, 220, 220, 0.59);
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
		<div class="writer">
		<div>
		
			<img src="./img/member/${req.memberPicturepath}">
		
		</div>
		<div>
		<div class="writername">
			${req.reqNick }
		</div>
		<div class="date">
			요청일자 : ${req.reqDate }
		</div>
		</div>
		<div>
		<button type="button" class="writeButton" id="writeButton" onclick="#">수정하기</button>
		<button type="button" class="writeButton" id="writeButton" onclick="#">취소하기</button>
		</div>
		</div>
		<div class="content">
		 <h1>오구사항</h1>
		 ${req.reqContent }
		</div>
		<div>
			<button type="button" class="writeButton" id="writeButton" onclick="#">제안하기</button>
		</div>
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
			<c:choose>
				<c:when test="${memberNo ne 0 }">
					<li>
						<span id="report"><a onclick="report('${req.memberNo }','2','${req.reqNo }')">신고</a></span>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<span id="report"><a onclick="loginNeed();">신고</a></span>
					</li>
				</c:otherwise>
			</c:choose>
			<form action="/insertreqask.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
				<div>
				<input type="text" name="expertNo" value="${expertNo }">
				<input type="text" name='reqNo' value="${req.reqNo }">
				
				<input type="submit" class="btn bc1 bs4" value="등록하기">
				</div>
			</form>
		</div>
	<c:forEach items="${list }" var="c" varStatus="i">
		<div>
		${expertNo }
		</div>
	</c:forEach>
	</div>
<div class="footer-div">
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>

</html>