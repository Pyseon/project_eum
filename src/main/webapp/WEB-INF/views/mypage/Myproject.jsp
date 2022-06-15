<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<style>
li {
	list-style: none;
	padding-left: 0px;
}

.posting-wrap {
	display: flex;
	flex-wrap: wrap;
	margin-left: 46px;
}

.posting-item {
	box-sizing: border-box;
	width: 241px !important;
	padding: 0px !important;
	height: 312px !important;
	margin: 25px 10px 25px 10px;
	background-color: #ffffff;
	box-shadow: 3px 3px 3px 3px #e7dede;
}

.t1 {
	font-size: 18px;
	font-family: fs-bold !important;
	display: flex;
	margin: 20px 0 0px 0;
	justify-content: space-between;
}

.t1>img {
	width: 20px;
	height: 20px;
}

.t2 {
	display: flex;
	justify-content: space-between;
}

.t3 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	height: 30px;
	font-size: 17px;
}

.t4 {
	margin: 14px 0 10px 0;
	display: flex;
}

.t4>span {
	text-align: center;
	line-height: 1;
}

.t4>div>span>img {
	width: 30px;
	height: 30px;
	vertical-align: middle;
	border-radius: 50%;
}

.t4-right {
	display: flex;
	margin-left: auto;
	width: 30%;
}

.posting-item>img {
	width: 100%;
	height: 180px;
}

.posting-connect {
	padding-top: 10px;
	padding-right: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.posting-connect>ul {
	margin: 0px !important;
	margin-top: 3px !important;
	padding: 0px !important;
}

.category {
	width: 1000px;
	margin-top: 20px;
	margin-right: auto;
	margin-bottom: 10px;
	margin-left: auto;
	margin-bottom: 10px;
	flex-grow: 1;
	border-bottom: 1px solid rgba(220, 220, 220, 0.59);
}

.category>tbody>tr>td>button>img {
	width: 70%;
	height: 70%;
}

.category>tbody>tr>td>h3 {
	text-align: center;
}

.category>tbody>tr>td>button {
	padding: 0;
	border: none;
	background: none;
}

.category>tbody>tr>td {
	position: center;
}

.star-wrap span {
	float: left;
	color: #ff990d;
}

.t4-info {
	display: flex;
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 18px !important;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	-webkit-font-feature-settings: 'liga';
	-webkit-font-smoothing: antialiased;
}

.icons-star {
	color: #ff990d;
}

#sele {
	font-size: 20px;
	color: #3865f2;
	font-style: italic;
	font-weight: bold;
}

#price {
	font-size: 14px;
	font-weight: bold;
	line-height: 2;
}

#fixed-price {
	text-decoration: line-through;
	font-size: 13px;
	line-height: 2;
}

#im_btn1 {
	border-bottom: 1px solid rgba(220, 220, 220, 0.59);
}

.selPro-active {
	border-bottom: 5px solid rgb(56, 101, 242) !important;
}
	#p-title-2{
		overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 180px;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
</head>

<body>


	<div class="page-content" style="min-height: 600px;">
ㄱ
		<div class="posting-wrap">
			<c:if test="${fn:length(list) eq 0}">
				<div style="text-align: center; margin: 50px auto;">
					<h3>구매내역이 없습니다.</h3>
				</div>
			</c:if>



			<c:forEach var="p" items="${list }" varStatus="i">

				<div class="posting-item" >
					<!--<img src="./img/test/testimg1.png">-->
 <c:if test="${p.productType eq 1}">
			 	<img src="./img/ExpertList/coun1.png" style="width:245px; height:180px;">
			 </c:if>
			 <c:if test="${p.productType eq 2}">
				 <img src="./img/product/ClassList/${p.productImgPath }">
			 </c:if>
			 <c:if test="${p.productType eq 3}">
			 	 <img src="./img/ExpertList/idmar.png" style="width:245px; height:180px;">
			 </c:if>
					<div class="posting-connect">
						<ul>
							<li>

								<div id="p-title-2">
									<span class="card-category fs-bold">${p.productTitle }</span>
								</div>
								<div id="p-title-2">
									<span class="card-category">${p.productIntro }</span>

								</div>


								
				</li>
				
			</ul>
			</div>
			<div>
				<button class="btn bc1 bs3" id="login-btn" type="button" onclick="location.href='/MyprojectDetail.do?productNo=${p.productNo}'">수정</button>
				<button class="btn bc2 bs2" id="login-btn" type="button" onclick="location.href='/DeleteMyproject.do?productNo=${p.productNo}&&memberNo=${p.memberNo}'">삭제</button>
				
				<c:if test="${p.productType eq 1}">
					<button class="btn bc5 bs3" id="login-btn" type="button" onclick="location.href='/expertCounsel.do?payNo=${p.payNo}'">시작</button>
		  		</c:if>
		  </div>

				</div>

			</c:forEach>

		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>