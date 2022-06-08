<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
	.firstbox{
		margin: 0 auto;
		width: 30%;
	}
	.joinfrmbox fieldset{
		font-size: 20px;
		font-weight: bold;
	}
	.joinfrmbox>fieldset .inputplus{
		font-size: 15px;
		height: 50px;
	}
	#maintitle{
		font-weight:bold;
		font-size: 30px;
	}
	#star{
		color:#3865f2;
		font-weight:bold;
		margin-bottom: 15px;
	}
	.emailbox{
		display: inline;
	}
	.emailbox>input{
		display: inline;
		float: left;
		width: 70%;
		margin-bottom: 5px;
	}
	.emailbox>button{
		display: inline;
		float: right;
		width: 28%;
	}
	.check-find{
		display: inline;
	}
	.check-find>div>input{
		display: inline;
		float: left;
		width: 70%;
		margin-bottom: 5px;
	}
	.check-find>div>button{
		display: inline;
		float: right;
		width: 27%;
	}		
	#button-pr{
		height: 50px;
	}
	.genderbox>button{
		width: 48%;
		margin-left: 1%;
		margin-right: 1%;
		height: 50px;
	}
	.birthbox>.input-form{
		display:inline;
		width: 32%;
		font-size: 15px;
		margin-bottom:3%;
	}
	[name=month]{
		height: 50px;
	}
	.checkedbox{
		margin-top: 5%;
		margin-bottom: 5%;
		padding: 10px;
		border: 1px solid #000;
	}
	
	.checkbox-s{
		font-size: 15px;
		
	}
	.checkbox-s>div{
		height: 20px;
		position: relative;
		vertical-align: middle;
		margin: 5px;
		margin-left: 3%;
	}
	.checkox-s>div>label{
		margin-left: 5px;
	}
	.navi-birth{
		font-size: 15px;
		display: none;
	}
	.correct{
	    color : green;
	}
	.incorrect{
	    color : red;
	}	
	.mail-input-false{
		background-color:#ebebe4;
	}
	.mail-input-ture{
		background-color:#white;
	}
	.check-hidden{
		display: none;
	}
	#authMsg{
		margin-top: 30px;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
	<div class="firstbox">
	<div id="maintitle">회원가입</div>
	<div id="star">*는 필수 입력사항입니다.</div>
	<form class="joinfrmbox" id="joinfrmbox" action="/join.do" method="post">
		<fieldset>
			<div class="emailbox">
				<div>이메일*</div> 
				<input class="input-form inputplus" type="text" id="memberId" name="memberId" placeholder="이메일을 입력해주세요.">
				<button class="btn bc1 bs1" type="button" id="button-pr">인증하기</button>
			</div>
			<div class="check-find check-hidden">
				<input class="input-form mbt inputplus" type="text" name="numberId" id="numberId" placeholder="인증번호를 입력해주세요." disabled="disabled">
				<div><button class="btn bc1 bs1" type="button" id="button-prr">확인</button></div><br>
			</div>
			<br>
			<div id="timeZone"></div>
			<div id="authMsg"></div>
			<br><br>
			닉네임* <input  class="input-form inputplus" type="text" name="memberNick" id="memberNick" placeholder="닉네임을 입력해주세요.">
			<div class="fs-light" id="memberNick-test"></div><br>
			
			비밀번호* <input  class="input-form inputplus" type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			
			비밀번호 확인* <input class="input-form inputplus" type="password" name="memberPwRe" id="memberPwRe" placeholder="비밀번호를 다시 입력해주세요.">
			<div class="fs-light" id="memberPw-test"></div><br>
			
			연락처*<input class="input-form inputplus" type="text" name="phone" id="phone" placeholder="연락처를 입력해주세요.(010-0000-0000)"><br>
			
			<div class="genderbox">
				<div>성별</div>
				<input class="gender" type="hidden" id="gender" name="gender"> 
				<button class="btn bc1 bs3" type="button" id="man" onclick="statusChange(this)" value="1">남</button><button class="btn bc1 bs3" type="button" id="woman" onclick="statusChange(this)" value="2">여</button><br>
			</div>
			<br>
			<div class="birthbox">
				<div>생년월일</div>
				<input type="hidden" name="birth" id="birth" value="">
				<input  class="input-form inputplus changedata" type="text" id="year" name="birth-s" placeholder="년(4자)">
				<select class="input-form inputplus changedata" id="month" name="birth-s">
					  <option value='' selected>월</option>
				</select>
				<input  class="input-form inputplus changedata" type="text" id="day" name="birth-s" placeholder="일">
			</div>
			<div class="navi-birth fs-light fc-9" id="navi-birth">생년월일을 확인해주세요</div>
			<div class="checkedbox">
				<div><input type="checkbox" class="mainagreement" name="chkall"> <label> 모두 동의합니다.</label></div>
				<div class="checkbox-s">
					<div><input type="checkbox" class="agreement" value="0"> <label> 만 14세 이상입니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" value="0"> <label> 서비스이용약관에 동의합니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" value="0"> <label> 개인정보 수집/이용에 동의합니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" id="agreement" name="agreement" value="0"> <label> 이벤트 할인 혜택 알림 수신에 동의합니다(선택)</label></div>
				</div>
			</div>
			<button class="btn bc1 bs4" id="joinButton" type="submit">가입완료</button>
		</fieldset>
	</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	//1.button 활성화
	//2.submit 유효성
	/*$("#joinfrmbox").submit(function() {
		  if( $("[name=memberId]").val()=="" ) {
		    return false;
		  }
		  return true;
		});
	*/
	//닉네임 유효성 검사
	$("#memberNick").change(function(){
		   var memberNick = $(this).val();
		   $.ajax({
			   url : "/nickCheck.do?memeberNick=" + memberNick,
			   type:"POST",
			   data:{memberNick:memberNick},
			   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			   success: function(data){
				   if(data == "1"){
						$("#memberNick-test").text("이미 사용중인 아이디입니다.");
						$("#memberNick-test").css("color","#ff2e63");
					}else if(data == "0"){
						$("#memberNick-test").text("사용가능한 아이디입니다.");
						$("#memberNick-test").css("color","#00adb5");
					}
			   },
			   error : function(){
				   console.log("서버요청실패");
			   }
			   });
		   });
		    
	//email인증
	var code="";
	
	$("#button-pr").click(function(){
		
		var email = $("#memberId").val();
		var checkBox = $("#numberId");      // 인증번호 입력란
	    var numBox = $("#numberId");    		// 인증번호 입력란 박스
		$.ajax({
			type:"GET",
			url:"/mailCheck.do?email=" + email,
			success:function(data){
				
				//console.log("data : " + data);
				checkBox.attr("disabled",false);
				numBox.addClass("mail-input-false");
				numBox.removeClass("mail-input-ture");
				$(".check-hidden").removeClass("check-hidden");
				code = data;
			}		
		});
	});
	//인증번호 검사
	$("#button-prr").click(function(){
	    var inputCode = $("#numberId").val();      		// 입력코드    
	    var checkResult = $("#authMsg");   	 			// 비교 결과 
	    if(inputCode == code){                          // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	        $("#memberId").attr("readonly","readonly");
	      	$(".check-find").addClass("check-hidden");
	    } else {                                        // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }
	});
		
	//비밀번호 유효성 검사
	$("[name=memberPwRe]").on("change",function (){
	        var pwd1 = $("#memberPw").val();
	        var pwd2 = $("#memberPwRe").val();
	        if (pwd1 != '' && pwd2 == '') {
	            null;
	        }else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            	$("#memberPw-test").text("비밀번호가 일치합니다.");
					$("#memberPw-test").css("color","#3865f2");
	            } else {
	            	$("#memberPw-test").text("비밀번호가 일치하지 않습니다.");
					$("#memberPw-test").css("color","#f05454");
	            }
	        }
	    });
	
	//체크박스 전체선택 해제
	$('.mainagreement').on('click',function(){ 
	    $('.agreement:not(:disabled)').not(this).prop('checked', this.checked);
	});
	//체크박스 개별요소
	$('.agreement').on('click',function(){ 
	    if($('.agreement:not(:disabled)').length == $('.agreement:checked').length){
	        $('.mainagreement').prop('checked',true);
	    }else{
	        $('.mainagreement').prop('checked',false);
	    }
	});
	//val 전체 값 0,1 변경
	$("input[name=chkall]").change(function(){
		var chk = $(this).prop("checked");
		if(chk){
			$(this).val(1);
			$(".agreement").val(1);
		}else{
			$(this).val(0);
			$(".agreement").val(0);
		}
	});
	//val 값 0,1 변경
	$(".agreement").change(function(){
		var chk = $(this).prop("checked");
		if(chk){
			$(this).val(1);
		}else{
			$(this).val(0);
		}
	});

	/*
	var chk = $(".agreement");
	$(".agreement").on("click",function(){
		if($(this).is(":checked")){
			chk.val(0);
		}else
			chk.val(1);
	});
	*/
	//날짜 입력 합쳐주는 함수
	$(".changedata").on("propertychange change keyup paste input",function(){
		    var year = $("#year").val();
		    var month = $("#month").val();
		    var day = $("#day").val();
		    var birth = (year+"-"+month+"-"+day);
		    $("#birth").val(birth);
			
		});
	//month 옵션
	$(function () {
	        for (var i = 1; i < 13; i++) {
	            $('#month').append('<option value="' + i + '">' + i + '</option>');
	        }  
	    }
	);

	/*
	$("#day").on("propertychange change keyup paste input",function(){
		var birth = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
		$("#birth").val(birth);
	});
	*/
	//gender값 val 넣기
	function statusChange(statusItem){
		var strText = $(statusItem).val();
		$("#gender").val(strText);
	}
	//남 버튼 클릭시
	$("#man").on("click",function(){
		$("#man").addClass("bc8")
		$("#man").removeClass("bc1")
		$("#woman").addClass("bc1")
		$("#woman").removeClass("bc8")
	});
	//여 버튼 클릭시
	$("#woman").on("click",function(){
		$("#man").addClass("bc1")
		$("#man").removeClass("bc8")
		$("#woman").addClass("bc8")
		$("#woman").removeClass("bc1")
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