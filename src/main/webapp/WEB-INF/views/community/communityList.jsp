<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<style>
.cat-active {
	background-color: #1abc9c !important;
	color: #fff !important;
	border: 1px solid #1abc9c !important;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
		<div class="comm-header">
			<button class="comm-nav" onclick="location.href='/communityList.do?category=2&reqPage=1'">전체</button>
			<button class="comm-nav" onclick="location.href='/communityList.do?category=0&reqPage=1'" >요즘뭐하니</button>
			<button class="comm-nav" onclick="location.href='/communityList.do?category=1&reqPage=1'" >이건어때</button>
		</div>
		<div id=comm-content>
			<c:forEach items="${list }" var="com" varStatus="i">
				<!--리스트-->
				<div class="card-wrap" style="cursor: pointer;"
					onclick="location.href='/communityDetail.do?comNo=${com.commNo }';">
					<img class="card-img" src="./img/community/${com.commFilepath }" />
					<figcaption>
						<!-- 2022-05-01 형식의 데이터를 2022.05.01로 바꿔줌 -->
						<c:set var="oldDate" value="${com.commDate }" />
						<%
							String oldDate = (String) pageContext.getAttribute("oldDate");      
	        				String newDate = oldDate.replace('-', '.');
	        			%>
						<div class="card-date-right card-reg"><%=newDate %></div>
						<div class="card-caption card-flex">
							<c:if test="${com.commCategory eq 0}">
								<span class="card-category fs-bold">요즘뭐하니</span>
							</c:if>
							<c:if test="${com.commCategory eq 1}">
								<span class="card-category fs-bold">이거어때</span>
							</c:if>
							<div class="card-icon card-flex">
								<div class="card-like">
									<i class="fa-solid fa-heart"></i> <span
										class="noto-sb mb-1 fs-bold">${com.commLike }</span>
								</div>
								<div class="card-comment">
									<i class="fa-solid fa-message"></i> <span
										class="noto-sb mb-1 fs-bold">${com.cmntCount }</span>
								</div>
							</div>
						</div>
						<div class="card-title fs-bold">${com.commTitle }</div>
						<div class="card-intro">${com.commIntro }</div>
						<div class="card-info card-flex">
							<div class="card-profile">
								<div class="card-user-img-wrap">
									<img class="card-user-img"
										src="../img/member/${com.memberPicturepath }" alt="" />
								</div>
								<span class="card-user-name">${com.memberNick }</span>
							</div>
							<div class="card-readcount">
								<span class="mr-1">조회수</span> <span>${com.readCount }</span>
							</div>
						</div>
					</figcaption>
				</div>
			</c:forEach>
			<div>${pageNavi }</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(function(){
			let cat = '${category }';
			if(cat == 0){
				
			}
		})
	</script>
</body>
</html>