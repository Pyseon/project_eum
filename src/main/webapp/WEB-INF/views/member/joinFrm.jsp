<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 회원가입</title>
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
	.check-find>input{
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
	#button-prr{
		height: 50px;
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
	.bc8{
		background-color: white;
		color: #3865f2;
		font-family:fs-bold !important;
		border: 3px solid #3865f2 !important;
	}
	

</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
	<div class="firstbox">
	<div id="maintitle">회원가입</div>
	<div id="star">*는 필수 입력사항입니다.</div>
	<form class="joinfrmbox" id="joinfrmbox" action="/join.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberPoint" value="0">
		<input type="hidden" name="memberReportCount" value="0">
		<input type="hidden" name="grade" value="2">
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
			
			비밀번호* <input  class="input-form inputplus" type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요." maxlength=15><br>
			
			비밀번호 확인* <input class="input-form inputplus" type="password" name="memberPwRe" id="memberPwRe" placeholder="비밀번호를 다시 입력해주세요.">
			<div class="fs-light" id="memberPw-test"></div><br>
			
			연락처*<input class="input-form inputplus" type="text" name="memberPhone" id="memberPhone" placeholder="연락처를 입력해주세요.(010-0000-0000)" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.\-]/g, '').replace(/(\..*)\./g, '$1');">
			<div class="fs-light" id="memberPhone-test"></div><br>
			
			<div class="genderbox">
				<div>성별*</div>
				<input class="gender" type="hidden" id="gender" name="gender" required> 
				<button class="btn bc1 bs3" type="button" id="man" onclick="statusChange(this)" value="1">남</button><button class="btn bc1 bs3" type="button" id="woman" onclick="statusChange(this)" value="2">여</button><br>
			</div>
			<br>
			<div class="birthbox">
				<div>생년월일*</div>
				<input type="hidden" name="birth" id="birth" value="" required>
				<input  class="input-form inputplus changedata" type="text" id="year" name="birth-s" placeholder="년(4자)" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  required>
				<select class="input-form inputplus changedata" id="month" name="birth-s" required>
					  <option value='' selected >월</option>
				</select>
				<input  class="input-form inputplus changedata" type="text" id="day" name="birth-s" placeholder="일" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
			</div>
			<div class="navi-birth fs-light fc-9" id="birth-test"></div>
			
			<div class="img-box-wrap" style="margin:30px 10px;">
							<div class="commFileBox preview-image" style="margin-right: 10px;">
								<p class="comm-write-p" style="margin-bottom: 5px;">프로필사진 등록</p>
								<label for="input-file">사진 선택</label> <input type="file"
									name="file" class="commFile upload-hidden"
									id="input-file">
							</div>
							<div class="input-img-box" style="width: 80px; height:80px;"></div>
							
						</div>
			
			
			
			<div class="checkedbox">
				<div><input type="checkbox" class="mainagreement" name="chkall"> <label> 모두 동의합니다.</label></div>
				<div class="checkbox-s">
					<div><input type="checkbox" class="agreement" value="0" required> <label> 만 14세 이상입니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" value="0" required> <label> 서비스이용약관에 동의합니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" value="0" required> <label> 개인정보 수집/이용에 동의합니다.(필수)</label></div>
					<div><input type="checkbox" class="agreement" id="agreement" name="agreement" value="0"> <label> 이벤트 할인 혜택 알림 수신에 동의합니다(선택)</label></div>
				</div>
			</div>
			<button class="btn bc1 bs4" id="joinButton" type="submit" disabled>가입하기</button>
		</fieldset>
	</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	$(function(){
		$('#man').click();
	})


	//1.button 활성화
	//2.submit 유효성
	let inputCheck = new Array(7).fill(true);
	let checkAll = true;
	console.log(checkAll);
	/*
	$("#joinButton").click(function() {
		console.log(checkAll); 
		console.log(inputCheck); 
		for(let i = 0; i < inputCheck.length; i++){
			if(inputCheck[i] == false){
				checkAll = false;
			}
		}
		if(checkAll){
			const memberId = $("#memberId").val();
			const memberNick = $("#memberNick").val();
			const memberPw = $("#memberPw").val();
			const memberPhone = $("#memberPhone").val();
			const memberPoint = 0;
			const memberReportCount = 0;
			const gender = $("#gender").val();
			const birth = $("#birth").val();
			const agreement = $("#agreement").val();
			const grade = 2;
			const memberPictureName = null;
			const memberPicturePath = null;
			$.ajax({
				url: "/join.do",
				type: "post",
				data: {memberId: memberId, 
					memberNick: memberNick,
					memberPw: memberPw, 
					memberPhone: memberPhone,
					memberPoint:memberPoint,
					memberReportCount:memberReportCount, 
					gender:gender, 
					birth:birth, 
					agreement:agreement,
					grade:grade,
					memberPictureName:memberPictureName,
					memberPicturePath:memberPicturePath},
				success: function(data){
					if(data == "1"){
						const title = "회원가입 완료되었습니다.";
						const icon = "success";
						const msgTime = 1500;
						toastShow(title,icon, msgTime);
					}else if(data == "0"){
						const title = "회원가입을 실패했습니다.";
						const icon = "error";
						const msgTime = 1500;
						toastShow(title,icon, msgTime);
					}	
				},
				error : function(){
					   console.log("서버요청실패");
				}
			});
						
		}else{
			const title = "입력값을 확인해주세요";
			const icon = "warning";
			const msgTime = 1500;
			toastShow(title,icon, msgTime);
				
		}
	});
	*/
	
	function formCheck(){
		checkAll = true;
		console.log("인풋체크> "+inputCheck);
		for(let i = 0; i < inputCheck.length; i++){
			if(inputCheck[i] == false){
				checkAll = false;
			}
		}
		console.log("체크올> "+checkAll);
		if(checkAll){
			$("#joinButton").attr("disabled",false);
		}else{
			$("#joinButton").attr("disabled",true);
		}
	}
	
	
	
	//연락처 유효성 검사
	$("#memberPhone").change(function(){
			$("#memberPhone-test").text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^(01\d{1})-\d{3,4}-\d{4}$/;
			if(!regExp.test(value)){
				$("#memberPhone-test").text(" 010-0000-0000 형식으로 입력해주세요.");
				$("#memberPhone-test").css("color","#ff2e63");
				inputCheck[0] = false;
				formCheck();
			}else{
				var memberPhone = $("#memberPhone").val();
				//연락처 중복 검사
				$.ajax({
					   url : "/phoneCheck.do",
					   data: {memberPhone:memberPhone},
					   success: function(data){
						   if(data == "1"){
								$("#memberPhone-test").text("가입된 번호입니다.");
								$("#memberPhone-test").css("color","#ff2e63");
								inputCheck[0] = false;
								formCheck();
							}else if(data == "0"){
								$("#memberPhone-test").text("사용가능한 번호입니다.");
								$("#memberPhone-test").css("color","#00adb5");
								inputCheck[0] = true;
								formCheck();
							}
					   },
					   error : function(){
						   console.log("서버요청실패");
					   }
					});
				inputCheck[0] = true;
				formCheck();
			}
		});
	//닉네임 유효성 검사
	$("#memberNick").change(function(){
		$("#memberNick-test").text("");
		   var memberNick = $(this).val();
		   let regExp1;
			let regExp2;
			regExp1 = /^[가-힣]{2,8}$/;
			regExp2 = /^[a-zA-Z]{4,10}$/;
			if(!regExp1.test(memberNick) && !regExp2.test(memberNick)){
				 const title = "2~8글자 한글 또는 4~10글자 영어대소문자만 입력가능합니다.";
					const icon = "error";
					const msgTime = 1500;
					toastShow(title,icon,msgTime);
					inputCheck[1] = false;
					formCheck();
			}else{
				   $.ajax({
					   url : "/nickCheck.do?memberNick=" + memberNick,
					   type:"POST",
					   data:{},
					   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					   success: function(data){
						   if(data == "1"){
								$("#memberNick-test").text("이미 사용중인 닉네임입니다.");
								$("#memberNick-test").css("color","#ff2e63");
								inputCheck[1] = false;
								formCheck();
							}else if(data == "0"){
								$("#memberNick-test").text("사용가능한 닉네임입니다.");
								$("#memberNick-test").css("color","#00adb5");
								inputCheck[1] = true;
								formCheck();
							}
					   },
					   error : function(){
						   console.log("서버요청실패");
					   }
					});
			}
		   
		   
		   
		});
		    
	//email인증
	var code="";
	
	$("#button-pr").click(function(){
		$("#authMsg").text("");
		var checkResult = $("#authMsg");
		var email = $("#memberId").val();
		var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!regExp.test(email)){
			//이메일 유효성 검사
			checkResult.text("이메일을 다시확인해주세요");
			checkResult.css("color","#ff2e63");
		}else{
			//중복 이메일 확인
		   $.ajax({
			   url : "/emailCheck.do?memberId=" + email,
			   type:"POST",
			   data:{},
			   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			   success: function(data){
				   
				   if(data == "1"){
					    checkResult.text("이미 사용중인 이메일입니다.");
					    checkResult.css("color","#ff2e63");
					    
					}else if(data == "0"){
						//인증번호 발송
						var checkBox = $("#numberId");      	// 인증번호 입력란
					    var numBox = $("#numberId");  		// 인증번호 입력란 박스
					    const title = "인증번호를 발송중입니다.";
						const icon = "info";
						const msgTime = 5500;
						toastShow(title,icon,msgTime);
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
							    const title = "인증번호를 발송했습니다!.";
								const icon = "success";
								const msgTime = 2000;
								toastShow(title,icon,msgTime);
							}		
						});
						
					}
			   },
			   error : function(){
				   console.log("서버요청실패");
			   }
			});
			
		}
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
	      	inputCheck[2] = true;
	      	formCheck();
	    } else {                                        // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        inputCheck[2] = false;
	        formCheck();
	    }
	});
	
	$("#memberPw").on("change", function(){
		var password = $(this).val();
		 var pwd1 = $("#memberPw").val();
	        var pwd2 = $("#memberPwRe").val();
		let regExp;
		regExp = /^[0-9a-zA-Z!@#$%^+\-=]{6,15}$/;
		if(!regExp.test(password)){
			const title = "6~15자의 영문 대소문자,숫자,특수문자만 가능합니다.";
			const icon = "error";
			const msgTime = 1800;
			toastShow(title,icon,msgTime);
		}else{
			
		}
		
		  if (pwd1 != '' && pwd2 == '') {
	            null;
	        }else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            	$("#memberPw-test").text("비밀번호가 일치합니다.");
					$("#memberPw-test").css("color","#3865f2");
					inputCheck[3] = true;
					formCheck();
	            } else {
	            	$("#memberPw-test").text("비밀번호가 일치하지 않습니다.");
					$("#memberPw-test").css("color","#f05454");
					inputCheck[3] = false;
					formCheck();
	            }
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
					inputCheck[3] = true;
					formCheck();
	            } else {
	            	$("#memberPw-test").text("비밀번호가 일치하지 않습니다.");
					$("#memberPw-test").css("color","#f05454");
					inputCheck[3] = false;
					formCheck();
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
	$(".changedata").change(function(){
		    let year = $("#year").val();
		    let month = $("#month").val();
		    let day = $("#day").val();
		    
		    if(month < 10){
		    	newMonth = "0"+ month;
		    }else{
		    	newMonth = month;
		    }
		    if(day < 10){
		    	newDay = "0"+ day;
		    }else{
		    	newDay = day;
		    }
		    
		    console.log(month);
		    let birth = (year+"-"+newMonth+"-"+newDay);
		    $("#birth").val(birth);
		    
		   
	  		//year 유효성검사
			if(year > 2022){
				$("#birth-test").text("미래에서 오셨군요^^");
				$("#birth-test").css("color","#ff2e63");
				inputCheck[4] = false;		
				formCheck();
			}else if(year < 1922){
				$("#birth-test").text("정말이세요?");
				$("#birth-test").css("color","#ff2e63");
				inputCheck[4] = false;
				formCheck();
			}else if(year!=""&&(year>1923||year<2022)){
				//day 유효성 검사
				if(month == 2 ){
					if(day>29||day<0||!day){
						$("#birth-test").text("생년월일 확인해주세요");
						$("#birth-test").css("color","#ff2e63");	
						inputCheck[4] = false;
						formCheck();
					}else{
						$("#birth-test").text("완료1");
						$("#birth-test").css("color","#3865f2");
						inputCheck[4] = true;
						formCheck();
					}
				}else if(month==4||month==6||month==9||month==11){
					if(day>30||day<0||!day){
						$("#birth-test").text("생년월일 확인해주세요");
						$("#birth-test").css("color","#ff2e63");	
						inputCheck[4] = false;
						formCheck();
					}else{
						$("#birth-test").text("완료2");
						$("#birth-test").css("color","#3865f2");
						inputCheck[4] = true;
						formCheck();
					}
				}else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
					if(day>31||day<0||!day){
						$("#birth-test").text("생년월일 확인해주세요");
						$("#birth-test").css("color","#ff2e63");	
						inputCheck[4] = false;
						formCheck();
					}else {
						$("#birth-test").text("완료3");
						$("#birth-test").css("color","#3865f2");					
						inputCheck[4] = true;
						formCheck();
					}
				}
			}else{
				$("#birth-test").text("생년월일 확인해주세요");
				$("#birth-test").css("color","#ff2e63");	
				inputCheck[4] = false;
				formCheck();
			}
			
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
	
    // 이미지 추가 함수 시작
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
      var parent = $(this).parent().next();
      parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.append('<div class="upload-display" style="display:inline-block; border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" style="width: 120px; height:120px;"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display" style="border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img class="upload-thumb" style="width: 120px; height:120px;"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });// 이미지 추가 함수 종료
	
	
	
	
	
	
	
	
	
	
	//토스트 알림 함수		
	function toastShow(title, icon, msgTime){
		const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: msgTime,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		 	})
	
	  	Toast.fire({
	    title: title,
	    icon: icon
	  })
	
	}
</script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>