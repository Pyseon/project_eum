<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

    <style>
      #login-btn {
        font-family: fs-regular;
      }
      .container2{
      	margin: 0 auto;
      	width: 60%;
      }
      .login-form{
      	margin: 0 auto;
      }
      .login-form>fieldset>input{
      	align-content: center;
      	text-align: center;
      }
      .login-form>fieldset{
      	margin: 0 auto;
      	margin-top: 20%;
      	width: 40%;
      }
      .joinbox{
      	margin: 0 auto;
      	margin-top: 1%;
      	text-align: center;
      }
      .navi-me{
      	display: none;
      }
      .navi-me2{
      	display: none;
      }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<div class="container2">
	<form class="login-form" id="login-form" action="" method="post">
		<fieldset>
			<input type="text" class="input-form" name="memberId" id="memberId" placeholder="이메일을 입력해주세요."><br>
			<input type="password" class="input-form" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			<div class="navi-me" id="navi-me">이메일을 입력해주세요</div>
			<div class="navi-me2" id="navi-me2">비밀번호를 입력해주세요</div>
			<button class="btn bc1 bs4" id="submitbtn">로그인</button>
		</fieldset>
	</form>
</div>
<div class="joinbox">
	<div><a href="/joinFrm.do">회원가입</a></div>
	<div><a href="#">아이디/비밀번호찾기</a></div>
</div>
<script>
	$("#submitbtn").on("click",function(){
		
		var memberId  = $('#memberId' ).val() ;
        var memberPw = $('#memberPw').val() ;
        
        if('#memberId'==''&&'#memberPw'==''){
        	console.log("이메일을 입력해주세요");
        }else if('#memberPw'==""){
        	
        }else{
        $.ajax({
            type : "POST",
            url: '/login.do',
            data: {memberId:memberId, memberPw:memberPw},
            success: function(data) {
            	result.empty();
            	console.log(data);
            	/*
            	if(data == 0){
            		$("#navi-me").slideDown();
            		alert("회원정보가 없습니다")
            	}else{
            		location.href="/";
               	 	alert('로그인 성공');
            	}
            	*/
            }
            /*
            error: function(){
            	if('#memberId'==''){
            		$("#navi-me").slideDown();
            		$("#navi-m2").hide();
            	}
            	alert('잘못된 이메일이거나, 비밀번호가 틀렸습니다.');
            }
            */
            
        });
      }
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