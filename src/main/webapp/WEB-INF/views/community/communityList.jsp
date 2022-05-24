<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
<body>
 <div class="container">
      <div class="comm-header">
        <button class="comm-nav">전체</button>
        <button class="comm-nav">요즘뭐하니</button>
        <button class="comm-nav">이건어때</button>
      </div>
	<c:forEach items="${list }" var="com" varStatus="i">
		 <!--리스트-->
	      <div class="card-wrap">
	        <img
	          class="card-img"
	          src="./img/community/${com.comFilepath }"
	        />
	        <figcaption>
	        <!-- 2022-05-01 형식의 데이터를 2022.05.01로 바꿔줌 -->
	        <c:set var="oldDate" value="${com.comDate }" />
	        <%
				String oldDate = (String) pageContext.getAttribute("oldDate");      
	        	String newDate = oldDate.replace('-', '.');
	        %>
	          <div class="card-date-right card-reg"><%=newDate %></div>
	          <div class="card-caption card-flex">
	          <c:if test="${com.comCategory eq 0}">
	            <span class="card-category fs-bold">요즘뭐하니</span>         
	          </c:if>
	          <c:if test="${com.comCategory eq 1}">
	            <span class="card-category fs-bold">이거어때</span>         
	          </c:if>
	            <div class="card-icon card-flex">
	              <div class="card-like">
	                <i class="fa-solid fa-heart"></i>
	                <span class="noto-sb mb-1 fs-bold">${com.comLike }</span>
	              </div>
	              <div class="card-comment">
	                <i class="fa-solid fa-message"></i>
	                <span class="noto-sb mb-1 fs-bold">${com.cmntCount }</span>
	              </div>
	            </div>
	          </div>
	          <div class="card-title fs-bold">${com.comTitle }</div>
	          <div class="card-content">${com.comContent }</div>
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
	  </div>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>