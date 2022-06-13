<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link rel="stylesheet" href="css/mypage.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
		<div class="col-lg-8 posts-list">
			<div class="content-wrap">
				<div class="content-title">> 내 정보
					<div id="star">*는 필수 입력사항입니다.</div>
				</div>
						<form class="joinfrmbox" action="/updateMember.do" method="post" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="content-all-wrap">
								<div class="mypage-content">
									<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
									<input type="hidden" name="birth" value="${sessionScope.member.birth}">
										<input type="hidden" name="enrollDate" value="${sessionScope.member.enrollDate}">
									<div class="content-box-title-wrap">
										<label for="email">이메일*</label>
									</div>
									<div class="content-box">
									
										<input class="input-form" type="text" name="memberId" id="email" value="${sessionScope.member.memberId}" readonly>
									</div>
								</div> <%--mypage-content --%>
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="nick">닉네임*</label>
										
									</div>
									<div class="content-box">	
										<!--  <input  class="input-form" type="text" name="memberNick" id="nick" placeholder="">							
										<div class="fs-light" id="memberNick-test"></div><br>-->
										<input  class="input-form inputplus" type="text" name="memberNick" id="memberNick" placeholder="${sessionScope.member.memberNick}">
												<div class="fs-light" id="memberNick-test"></div><br>
									</div>
								</div> <%--mypage-content --%>
								<div class="mypage-content"> 
									<div class="content-box-title-wrap">
										<label for="pw">비밀번호*</label>
									</div>
									<div class="content-box">	
										<input  class="input-form inputplus" type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요.">
									</div>
								</div>								
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="repw">비밀번호 확인* </label>
										
									</div>
									<div class="content-box">
										<input class="input-form inputplus" type="password" name="memberPwRe" id="memberPwRe" placeholder="비밀번호를 다시 입력해주세요.">
										<div class="fs-light" id="memberPw-test"></div><br>
									</div>									
								</div>
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="phone">연락처* </label>
									</div>
									<div class="content-box">	
										<input class="input-form inputplus" type="text" name="memberPhone" id="memberPhone" placeholder="${sessionScope.member.memberPhone}">
										<div class="fs-light" id="memberPhone-test"></div><br>
									</div>
									
									<div class="img-box-wrap" style="margin:30px 10px;">
							<div class="commFileBox preview-image" style="margin-right: 10px;">
								<p class="comm-write-p" style="margin-bottom: 5px;">프로필사진 등록</p>
								<label for="input-file">사진 선택</label> <input type="file"
									name="file" class="commFile upload-hidden"
									id="input-file">
							</div>
							<div class="input-img-box" style="width: 80px; height:80px;"></div>
							
						</div>
									
									
								</div>
							</div><!-- content-all-wrap -->	
							<div class="birthbox">
								<button class="btn bc1 bs4"  id="joinButton" type="submit">수정완료</button>
							</div>
						</fieldset>
					</form>
				<form class="joinfrmbox" id="joinfrmbox" action="/deleteMember.do" method="post">
					<fieldset>
						<input type="hidden" name="memberNick" value="${sessionScope.member.memberNick}">
						<input type="hidden" name="memberPw" value="${sessionScope.member.memberPw}">
						<input type="hidden" name="memberPhone" value="${sessionScope.member.memberPhone}">
						<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
						<input type="hidden" name="memberId" value="${sessionScope.member.memberId}">
						<input type="hidden" name="memberPoint" value="${sessionScope.member.memberPoint}">
						<input type="hidden" name="gender" value="${sessionScope.member.gender}">
						<input type="hidden" name="birth" value="${sessionScope.member.birth}">
						<input type="hidden" name="agreement" value="${sessionScope.member.agreement}">
						<input type="hidden" name="grade" value="${sessionScope.member.grade}">
						<input type="hidden" name="enrollDate" value="${sessionScope.member.enrollDate}">
						<br>
					<div class="drop-btn-wrap">
						<button class="drop-btn" type="submit">탈퇴하기</button>
					</div> 
					</fieldset>
				</form>
			</div>
		</div>	
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