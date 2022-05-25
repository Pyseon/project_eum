<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<style>
	.cat-active:focus{
		background-color: #1abc9c !important;
		color: #fff !important;
		border: 1px solid #1abc9c !important;
	}
</style>
</head>
<body>
	<c:if test="${'yes' eq menu }">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="container">
			<div class="comm-header">
				<button class="comm-nav cat-active" value="2">전체</button>
				<button class="comm-nav" value="0">요즘뭐하니</button>
				<button class="comm-nav" value="1">이건어때</button>
			</div>
			<div id=comm-content>
	</c:if>
	<c:forEach items="${list }" var="com" varStatus="i">
		 <!--리스트-->
	      <div class="card-wrap" style="cursor:pointer;" onclick="location.href='/communityDetail.do?comNo=${com.commNo }';">
	        <img
	          class="card-img"
	          src="./img/community/${com.commFilepath }"
	        />
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
	                <i class="fa-solid fa-heart"></i>
	                <span class="noto-sb mb-1 fs-bold">${com.commLike }</span>
	              </div>
	              <div class="card-comment">
	                <i class="fa-solid fa-message"></i>
	                <span class="noto-sb mb-1 fs-bold">${com.cmntCount }</span>
	              </div>
	            </div>
	          </div>
	          <div class="card-title fs-bold">${com.commTitle }</div>
	          <div class="card-intro">${com.commIntro }</div>
	          <div class="card-info card-flex">
	            <div class="card-profile">
	              <div class="card-user-img-wrap">
	                <img class="card-user-img" src="../img/member/${com.memberPicturepath }" alt="" />
	              </div>
	              <span class="card-user-name">${com.memberNick }</span>
	            </div>
	            <div class="card-readcount">
	              <span class="mr-1">조회수</span>
	              <span>${com.readCount }</span>
	            </div>
	          </div>
	        </figcaption>
	      </div>
	  	</c:forEach> 
	  	<div>
	  	 	${pageNavi }  	 	
	  	</div>
   <c:if test="${'yes' eq menu }">
		 </div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</c:if>
	<script>
	$(function() {
	    $(".comm-nav").on("click", function() {
	    	let param = $(this).val();
	    	let urlData = "/communityList.do?menu=no&category="+param+"&reqPage=1"
	    			console.log(urlData);
	    	$.ajax({
				url: urlData,
				success:function(){
					$("#comm-content").load(urlData);
				}
			});
	    });
	});
	</script>
</body>
</html>