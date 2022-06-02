<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호찾기</title>
<style>
	.backgroundcolorsky{
		background-color: rgb(237, 248, 255);
		height: 500px;
	}
	.idfindbody{
		margin: 0 auto;
		width: 35%;
	}
	.idfindbody>pre{
		background-color: transparent;
		border: none;
	}
	.explan{
		padding-top: 15%;
		margin-top: 5%;
		margin-bottom: 5%;
	}
	.explan>div{
		font-size: 18px;
		font-family: fs-bold;
	}
	.idfindbody>form{
		
	}
	.inputplus{
		display: inline;
		float: left;
		width: 72% !important;
		margin-bottom: 5px;
		height: 60px;
	}
	.findbtn{
		display: inline;
		float: right;
		width: 25%;
		vertical-align: middle;
		margin:  10px 0px;
		
	}
	.idfindmain{
		font-size: 30px;
		margin: 0 auto;
		width: 70%;
	}
	.idpwbox{
		width: 70%;
		margin: 0 auto;
		margin-bottom: 3%;
		margin-top: 5xp;
	}
	.idpwbox>div{
		float: left;
		text-align: center;
	}
	.idfind{
		font-family: fs-bold;
		font-size:15px;
		width: 8%;
	}
	.idfind>a{
		font-family: fs-bold;
	}
	.idfind:after{
		content : "";
		display: block;
		width   : 90%;
		margin: 0 auto;
		border-bottom:4px solid #3865f2;
	}
	.idpw{
		font-size:15px;
		width: 10%;
	}
	.idpw>a{
		font-family: fs-bold;
	}
	.idpw:after{
		content : "";
		display: block;
		width   : 85%;
		margin: 0 auto;
		border-bottom:4px solid gray;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<div class="idfindbox">
	<div class="idfindmain fs-bold">아이디/비밀번호 찾기</div>
	<div class="idpwbox">
		<div class="idfind"><a href="/findId.do">아이디찾기</a></div>
		<div class="idpw"><a href="#">비밀번호찾기</a></div>
	</div>
	<div class=backgroundcolorsky>
		<div class="idfindbody">
			<div class="explan" id="explan">
				<div></div>
				<div>가입하셨던 이메일 계정을 입력하시면,</div>
				<div>임시비밀번호를 이메일로 발송해 드립니다.</div>
			</div>
			<form>
				<input class="input-form inputplus" type="text" name="memberId">
				<button class="btn bc1 bs3 findbtn" type="submit">확인</button>
			</form>
		</div>
	</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>