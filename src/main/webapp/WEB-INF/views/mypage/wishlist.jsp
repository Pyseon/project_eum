<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
<style>

li{
   list-style:none;
   padding-left:0px;
   }


	.posting-wrap {
    	display: flex;
    	flex-wrap: wrap;
    	margin-left: 46px;
	}
	
	.posting-item{
	    box-sizing: border-box;
    	width: 241px !important;
    	padding : 0px !important; 
    	height: 312px !important;
    	margin: 25px 10px 25px 10px;
    	background-color: #ffffff;
    	box-shadow: 3px 3px 3px 3px #e7dede;
	}
	
	
	.t1{
	font-size:18px;
	font-family: fs-bold !important;
	display: flex;
	margin: 20px 0 0px 0;
	justify-content: space-between;
	}
	
	.t1 > img{
	width:20px;
	height:20px;
	}
	.t2{
	display: flex;
	justify-content: space-between;
	
	
	}
	
	.t3{
        overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 100%;
  		height: 30px;
  		font-size:17px;
  		
	}
	.t4{
	margin: 14px 0 10px 0;
	display: flex;
	}

	.t4 > span{
	 text-align: center;
	 line-height: 1;
	}
	.t4 > div > span > img{
	width:30px;
	height:30px;
	vertical-align: middle;
	border-radius: 50%;
	}
	.t4-right{
	display: flex;
 	margin-left: auto;
 	width: 30%;
    }
	
	.posting-item > img{
	width: 100%;
	height: 180px;
	
	}
	
	.posting-connect{
    	padding-top: 10px;
    	padding-right: 20px;
   		padding-bottom: 20px;
    	padding-left: 20px;
}
	.posting-connect > ul {
		margin: 0px !important;
		margin-top: 3px !important;
		padding: 0px !important;
	}
	
	
	.category{
	width: 1000px;
    margin-top: 20px;
    margin-right: auto;
    margin-bottom: 10px;
    margin-left: auto;
    margin-bottom: 10px;
    flex-grow: 1;
    border-bottom: 1px solid rgba(220, 220, 220, 0.59);
    
	}
	.category > tbody > tr > td > button >img{
	width: 70%;
	height: 70%;
	}
	
	.category > tbody > tr > td > h3{
	text-align:center;
	}
	.category > tbody > tr > td > button{
	padding: 0;
	border: none;
	background: none;
	}
	.category > tbody > tr > td{
	position: center;
	}
	.star-wrap span {
    float: left;
    color: #ff990d;
    }
    .t4-info{
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
	.icons-star{
	 color: #ff990d;
	}
	
	#sele {
	font-size: 20px;
	color: #3865f2;
	font-style: italic;
	font-weight: bold;
	}

	#price{
		
		font-size: 14px;
		font-weight: bold;
		line-height: 2;
	}
	
	#fixed-price{
		
		text-decoration: line-through;
		font-size: 13px;
		line-height: 2;
	}
	#im_btn1{
	border-bottom: 1px solid rgba(220, 220, 220, 0.59);
	}
	.selPro-active{
	border-bottom: 5px solid rgb(56 101 242) !important;
	}
</style>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>	
</head>

<body>
	

	<div class="page-content">
		
	<div class="posting-wrap">
		
	
		<c:forEach var="w" items="${list }" varStatus="i">
		
		<div class="posting-item" style="cursor: pointer;" >
			<img src="./img/product/ClassList/${w.productImgPath }">
			<div class="posting-connect">
			<ul>
				<li>
					
					<div>
						<span class="card-category fs-bold">${w.productTitle }</span>
					</div>
					<div>
						<c:if test="${w.productType eq 1}">
								<span style="color: #3865f2;">상담</span>
						</c:if>
						<c:if test="${w.productType eq 2}">
								<span style="color: #3865f2;">클래스</span>
						</c:if>
						<c:if test="${w.productType eq 3}">
								<span style="color: #3865f2;">지식마켓</span>
						</c:if>
						
						
					</div>
					
					
				</li>
			</ul>
			</div>
			<div>
				<button class="btn bc5 bs7" id="login-btn" type="button" onclick="location.href='/imgVerProductDetail.do?productNo=${w.productNo}&&expertNo=${w.expertNo}'">보러가기</button>
				
				<button class="btn bc3 bs7" id="login-btn" type="button" onclick="location.href='/DeleteMywish.do?wishNo=${w.wishNo}&&memberNo=${sessionScope.member.memberNo}'">찜삭제</button>
						
				
			</div>
		</div>
	
		</c:forEach>
	</table>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>