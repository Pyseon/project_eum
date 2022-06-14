<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 로그인</title>

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
      	width:22%;
      	justify-content:center;
      	margin: 0 auto !important;
      }
      .navi-me{
      	display: none;
      	color:red;
      }
      #joinfrm{
      	float: left;
      	text-align:left;
 	 	width: 50%;
      }
      #findid{
      	float: right;
      	text-align:right;
  		width: 50%; 
      }
      
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<div class="container2">
	<form class="login-form" id="login-form" action="/login.do" method="post">
		<fieldset>
			<input type="text" class="input-form" name="memberId" id="memberId" placeholder="이메일을 입력해주세요." required><br>
			<input type="password" class="input-form" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요." required><br>
			<div class="navi-me" id="navi-me">이메일 또는 비밀번호를 확인해주세요</div><br>
			<button class="btn bc1 bs4" type="submit" id="submitbtn">로그인</button>
			
		</fieldset>
	</form>
</div>
<div class="joinbox">
	<div><a id="joinfrm" href="/joinFrm.do">회원가입</a></div>
	<div><a id="findid" href="/findId.do"> 아이디/비밀번호찾기</a></div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$("#login-form").submit(function() {
		  if( $("[name=memberId]").val()=="" ) {
			$("#navi-me").slideDown();
		    //alert("이메일을 입력해주세요");
		    return false;
		  }
		  return true;
		});
	$("#login-form").submit(function() {
		  if( $("[name=memberId]").val()!=""&& $("[name=memberPw]").val()=="" ) {
			  $("#navi-me").slideDown();
		    //alert("비밀번호를 입력해주세요");
		    return false;
		  }
		  return true;
		});

	/*
	$("#submitbtn").on("click",function(){
		
		let memberId  = $("#memberId" ).val() ;
        let memberPw = $("#memberPw").val() ;
        
        if('#memberId'==''&&'#memberPw'==''){
        	console.log("이메일을 입력해주세요");
        }else if('#memberPw'==""){
        	
        }else{
        $.ajax({
            type : "POST",
            url: '/login.do',
            data: {memberId: $("#memberId").val(), memberPw: $("#memberPw").val()},
            success: function(data) {
            	result.empty();
            	console.log(data);
            	
            	if(data == 0){
            		$("#navi-me").slideDown();
            		alert("회원정보가 없습니다")
            	}else{
            		location.href="/";
               	 	alert('로그인 성공');
            	}
            },
            
            error: function(){
            	if('#memberId'== null){
            		$("#navi-me").slideDown();
            		$("#navi-m2").hide();
            	}
            	alert('잘못된 이메일이거나, 비밀번호가 틀렸습니다.');
            }
        });
      }
    });
*/
</script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>