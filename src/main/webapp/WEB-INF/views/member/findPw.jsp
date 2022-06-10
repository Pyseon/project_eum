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
		width: 25%;
		height: 120px;
		vertical-align: middle;
		margin: 5px;
		
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
		border-bottom:4px solid gray;
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
		border-bottom:4px solid #3865f2;
	}
	#pw-find{
		overflow: hidden;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<div class="idfindbox">
	<div class="idfindmain fs-bold">아이디/비밀번호 찾기</div>
	<div class="idpwbox">
		<div class="idfind"><a href="/findId.do">아이디찾기</a></div>
		<div class="idpw"><a href="/findPw.do">비밀번호찾기</a></div>
	</div>
	<div class=backgroundcolorsky>
		<div class="idfindbody">
			<div class="explan" id="explan">
				<div></div>
				<div>가입하셨던 이메일 계정을 입력하시면,</div>
				<div>임시비밀번호를 이메일로 발송해 드립니다.</div>
			</div>
			<form id="pw-find">
				<input class="input-form inputplus" type="text" id="memberId" name="memberId" placeholder="이메일을 입력하세요.">
				<input class="input-form inputplus" type="text" id="memberPhone" name="memberPhone" placeholder="연락처를 입력해주세요(010-xxxx-xxxx)" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.\-]/g, '').replace(/(\..*)\./g, '$1');">
				<button class="btn bc1 bs3 findbtn" type="button" id="email-pw">확인</button>
			</form>
			<div id="email-text"></div>
			<div id="phone-text"></div>
		</div>
	</div>
</div>
<script>
//체인지로바꿔야할듯
$("#email-pw").on("click",function(){
	var email = $("#memberId").val();
	var memberPhone = $("#membePhone").val();
	var emailtext = $("#email-text");
	var phonetext = $("#phone-text");
	$.ajax({
		   url : "/emailCheck.do?memberId=" + email,
		   type:"POST",
		   data:{},
		   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		   success: function(data){
			   if(data == "1"){
				   	emailtext.text("")
				   	emailtext.css("color","#00adb5");
				   	
					var memberPhone = $("#memberPhone").val();
					//연락처 중복 검사
					$.ajax({
						   url : "/phoneCheck.do?memberPhone=" + memberPhone,
						   type:"POST",
						   data:{},		
						   success: function(data){
							   if(data == "1"){
									phonetext.text("");
									phonetext.css("color","#ff2e63");
									//연락처 중복 검사
									$.ajax({
										   url : "/pwCheck.do", 
										   type:"POST",
										   data:{memberId:email, memberPhone:memberPhone},		
										   success: function(data){
											   if(data == "1"){
													phonetext.text("메일전송 완료");
													phonetext.css("color","#ff2e63");
													
												}else if(data == "0"){
													phonetext.text("메일전송 실패");
													phonetext.css("color","#00adb5");
													
												}
										   },
										   error : function(){
											   console.log("서버요청실패");
										   }
										});
									
								}else if(data == "0"){
									phonetext.text("연락처 정보가 없습니다");
									phonetext.css("color","#00adb5");
									
								}
						   },
						   error : function(){
							   console.log("서버요청실패");
						   }
						});
				
				  
				}else if(data == "0"){
					emailtext.text("이메일 정보가 없습니다")
					emailtext.css("color","#ff2e63");
				
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