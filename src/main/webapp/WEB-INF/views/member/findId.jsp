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
		overflow: hidden;
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
	#find-text{
		margin-top: 100px !important;
		text-align: center;
		margin: 0 auto;
	}
	#pw-find{
		margin-top: 20px;
		text-align: center;
	}
	#pw-find>a>div{
		font-family: fs-bold !important;
		font-size: 25px !important;
		color: #3865f2 !important;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="idfindbox">
	<div class="idfindmain fs-bold">아이디/비밀번호 찾기</div>
	<div class="idpwbox">
		<div class="idfind"><a href="/findId.do">아이디찾기</a></div>
		<div class="idpw"><a href="/findPw.do">비밀번호찾기</a></div>
	</div>
	<div class=backgroundcolorsky>
		<div class="idfindbody">
			<div class="explan" id="explan">
				<div>이음은 이메일을 아이디로 사용합니다.</div>
				<div>소유하고 계신 계정을 입력해보세요.</div>
				<div>가입여부를 확인해드립니다.	</div>
			</div>
			<form>
				<input class="input-form inputplus" type="text" id="memberId" name="memberId">
				<button class="btn bc1 bs3 findbtn" id="email-test" type="button">확인</button>
			</form>
			<div class="fs-bold" id="find-text"></div>
			<div id="pw-find">
				<a href="/findPw.do"><div id="pw-text"></div></a>
				<a href="/joinFrm.do"><div id="pw-text2"></div></a>
			</div>
		</div>
	</div>
</div>
<script>
$("#email-test").on("click",function(){
	var email = $("#memberId").val();
	var pwFind = $("#find-text");
	var pwText = $("#pw-text");
	var pwText2 = $("#pw-text2");
	$.ajax({
		   url : "/emailCheck.do?memberId=" + email,
		   type:"POST",
		   data:{},
		   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		   success: function(data){
			   if(data == "1"){
				   	pwFind.text("가입된 아이디 입니다")
				   	pwFind.css("color","#00adb5");
				    pwText.text("비밀번호도 기억이안나다면?");
				    pwText2.text("");
				}else if(data == "0"){
					pwFind.text("가입된 정보가 없습니다")
					pwFind.css("color","#ff2e63");
					pwText2.text("바로 회원가입하러 가기");
					pwText.text("");
				}
		   },
		   error : function(){
			   console.log("서버요청실패");
		   }
		});
});
</script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>