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
  background: #3865f2 !important;
  color: #fff !important;
  box-shadow: 0 3px 10px rgba(0,0,0,0.2), inset 1px 1px 7px 2px #284aaf !important; 
  letter-spacing: 1px;
}


</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
	  <div class=comm-wrap>
		<div class="comm-header">
			<button class="comm-nav" onclick="location.href='/communityList.do?category=2&reqPage=1'">전체</button>
			<button class="comm-nav" onclick="location.href='/communityList.do?category=0&reqPage=1'" >요즘뭐하니</button>
			<button class="comm-nav" onclick="location.href='/communityList.do?category=1&reqPage=1'" >이건어때</button>
			<div class="do-write">
				<c:if test="${empty sessionScope.member }">
					<button class="do-write-btn" onclick="login();">
						<span class='material-symbols-outlined fc-2 do-write-icon'>drive_file_rename_outline</span> 
						<span class="do-write-text" onclick=>글쓰기</span>			
					</button>
				</c:if>
				<c:if test="${not empty sessionScope.member }">
					<button class="do-write-btn" onclick="location.href='/communityWriteFrm.do?category=${category }'">
						<span class='material-symbols-outlined fc-2 do-write-icon'>drive_file_rename_outline</span> 
						<span class="do-write-text">글쓰기</span>			
					</button>
				</c:if>
		</div>
		</div>
		<div id=comm-content>
			<c:forEach items="${list }" var="com" varStatus="i">
				<!--리스트-->
				<div class="card-wrap" style="cursor: pointer;"
					onclick="location.href='/communityDetail.do?commNo=${com.commNo }&category=${com.commCategory }';">
					<img class="card-img" src="./img/community/${com.commFilepath }" />
					<figcaption>
						<!-- 2022.05.01 11:11 형식의 데이터를 2022.05.01로 바꿔줌 -->
						<c:set var="oldDate" value="${com.commDate }" />
						<%
							String oldDate = (String) pageContext.getAttribute("oldDate");      
	        				String newDate = oldDate.substring(0, 10);
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
									<i class="fa-solid fa-message"></i> 
									<c:if test="${com.commCategory eq 0}">
									<span class="noto-sb mb-1 fs-bold">${com.cmntCount }</span>
									</c:if>
									<c:if test="${com.commCategory eq 1}">
									<span class="noto-sb mb-1 fs-bold">${com.pickCount }</span>
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-title fs-bold">${com.commTitle }</div>

							<c:if test="${com.commCategory eq 0}">
								<div class="card-intro">${com.commIntro }</div>
							</c:if>
							<c:if test="${com.commCategory eq 1}">
								<div class="card-intro2" style="display:flex; min-height:40px; margin-bottom:20px;">
								<c:choose>
									<c:when test="${com.pick0Count eq 0 and com.pick1Count eq 0}">
										<div style="text-align:center; padding: 10px; background-color:#cdd8fc; flex-grow:1;">
											<i class="fa-regular fa-face-laugh-squint" style="font-size:18px;margin-right:5px; color:#3666f1;"></i>
											<span class="fs-full" style="font-size:18px; color:#3666f1;">${com.pick0Count}</span>
										</div>
										<div style="text-align:center; padding: 10px; background-color:#fcd4d4; flex-grow:1;">
											<span class="fs-full" style="font-size:18px; color:#f05454;">${com.pick0Count}</span>
											<i class="fa-regular fa-face-smile-wink" style="font-size:18px;margin-left:5px; color:#f05454;"></i>
										</div>
									</c:when>
									<c:otherwise>
										<div style="text-align:center; padding: 10px; background-color:#cdd8fc; flex-grow:${com.pick0Count};">
											<i class="fa-regular fa-face-laugh-squint" style="font-size:18px;margin-right:5px; color:#3666f1;"></i>
											<span class="fs-full" style="font-size:18px; color:#3666f1;">${com.pick0Count}</span>
										</div>
										<div style="text-align:center; padding: 10px; background-color:#fcd4d4; flex-grow:${com.pick1Count};">
											<span class="fs-full" style="font-size:18px; color:#f05454;">${com.pick1Count}</span>
											<i class="fa-regular fa-face-smile-wink" style="font-size:18px;margin-left:5px; color:#f05454;"></i>
										</div>
									</c:otherwise>
								</c:choose>
								
								</div>
							</c:if>

							<div class="card-info card-flex">
							<div class="card-profile">
								<div class="card-user-img-wrap">
									<img class="card-user-img"
										src="../img/member/${com.memberPicturepath }" alt="" style="width:30px; height:30px;"/>
								</div>
								<span class="card-user-name">${com.memberNick }</span>
							<c:if test="${com.memberGrade eq 1}">
								<span class="material-icons" id="verified-icon-list">verified</span>
							</c:if>
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
	</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(function(){
			let cat = '${category }';
			if(cat != 2){
				cat++;
				$(".comm-nav").eq(cat).addClass("cat-active");
			}else{
				$(".comm-nav").eq(0).addClass("cat-active");
			}
		})
		
	 //sweeatalert2 confirm 함수
			function login() {
	 			Swal.fire({
                  title: '로그인이 필요합니다',
                  text: "로그인 하시겠습니까?",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: '로그인 하기',
                  cancelButtonText: '취소',
                  reverseButtons: false, // 버튼 순서 거꾸로
                  
                }).then((result) => {
                  if (result.isConfirmed) {
                	  location.href="/loginFrm.do";
                  }
                })
			}
	</script>	
</body>
</html>