<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 전문가신청</title>
<style>
.consultbox>.input-form{
		display:inline;
		width: 32%;
		font-size: 15px;
		margin-bottom:3%;
	}
.flex-wrap{
	width: 60%;
	margin: 0 auto;
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
</head>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>

		<div class="page-content">
		<div class="flex-wrap">
		<form action="/Expertapply3.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo }">
		<input type="hidden" name="expertContent" value="전문가입니다.">
		<br>
				<label><h2>상담분야*</h2></label>
				<div class="consultbox">

					<select class="input-form" name='expertCategory' required>
						<option value="">카테고리 선택</option>
						<option value="법률">법률</option>
						<option value="비즈니스">비즈니스</option>
						<option value="심리/헬스">심리/헬스</option>
						<option value="학습">학습</option>
						<option value="금융">금융</option>
						<option value="라이프">라이프</option>
						<option value="취미">취미</option>
						<option value="어학">어학</option>
						<option value="레저">레저</option>
						<option value="IT/테크">IT/테크</option>
						<option value="자기계발">자기계발</option>

					</select>
				</div><br>
			
			<h2>간단한 전문가 자기소개 (20자이내)</h2> 
			<input type="text" class="input-form"
					name="expertIntro" placeholder="20자 이내 한글로 적어주세요" maxlength=20  required><br>


		<h2>자격증 정보</h2>
		<label>직업명</label>
		<input type="text" class="input-form"  name="jobName" placeholder="직업명" required><br>
		<label>전문가 실명</label>
		<input type="text" class="input-form"  name="expertName" placeholder="실명을 입력해주세요" required><br>
		<label>자격증 이름</label>
		<input type="text" class="input-form"  name="credential" placeholder="자격증명" required><br>
		<label>발급기관</label><br>
		<input type="text" class="input-form"  name="issuingAuthority" placeholder="발급기관" required><br>
		
		
		<div class="birthbox">
				<div>발급일자</div>
				<input type="hidden" name="acquistionDate" id="birth" value="" required>
				<input  class="input-form inputplus changedata" type="text" id="year" name="birth-s" placeholder="년(4자)" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  required>
				<select class="input-form inputplus changedata" id="month" name="birth-s" required>
					  <option value='' selected >월</option>
				</select>
				<input  class="input-form inputplus changedata" type="text" id="day" name="birth-s" placeholder="일" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
		</div>	
		<div class="navi-birth fs-light fc-9" id="birth-test"></div>
		
		<!-- 
				<div class="img-box-wrap" style="margin: 30px 10px;">
					<div class="commFileBox preview-image" style="margin-right: 10px;">
						<p class="comm-write-p" style="margin-bottom: 5px;">자격증 사본<p>
						<label for="input-file">파일 선택</label> 
						<input type="file"
							name="file" class="commFile upload-hidden" id="input-file" required>
					</div>
					<div class="input-img-box" style="width: 80px; height: 80px;"></div>

				</div>
		-->
		<label>자격증사본</label>
		<input type="file" name="file" class="commFile upload-hidden" id="input-file" required>
		<br>
		
		<label>고객센터 연락처</label>
		<input type="text" class="input-form"  name="expertPhone" id="expertPhone" placeholder="(-)하이픈을 넣어주세요" maxlength=14 required><br>
		<div class="fs-light" id="expertPhone-test"></div><br>
			
		<label>고객센터 이메일</label>
		<input type="text" class="input-form"  name="expertEmail" id="expertEmail" placeholder="example@naver.com"  maxlength=80 required><br>
		<div class="fs-light" id="expertEmail-test"></div><br>
		
		

		<button class="btn bc1 bs5" onclick="location.href='/'">돌아가기</button>
		<button class="btn bc1 bs5" type="submit" id="regExpert">제출완료</button>
		
		</form>
	</div>
		
	</div>

	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
<script>
$(function(){
	let inputCheck = new Array(3).fill(true);
	let checkAll = true;
	
	function formCheck(){
		checkAll = true;
		for(let i = 0; i < inputCheck.length; i++){
			if(inputCheck[i] == false){
				checkAll = false;
			}
		}
		if(checkAll){
			$("#regExpert").attr("disabled",false);
		}else{
			$("#regExpert").attr("disabled",true);
		}
	}
	


	
  //날짜 입력 합쳐주는 함수
	$(".changedata").on("keydown",function(){
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
		    
		    let birth = (year+"-"+newMonth+"-"+newDay);
		    $("#birth").val(birth);
		    
		   
		  //year 유효성검사
			if(year > 2022){
				$("#birth-test").text("날짜를 확인해주세요");
				$("#birth-test").css("color","#ff2e63");
				inputCheck[0] = false;
				formCheck();
			
			}else if(year < 1922){
				$("#birth-test").text("날짜를 확인해주세요");
				$("#birth-test").css("color","#ff2e63");
				inputCheck[0] = false;
				formCheck();
			
			}else if(year!=""&&(year>1923||year<2022)){
				//day 유효성 검사
				if(month == 2 ){
					if(day>29||day<0||!day){
						$("#birth-test").text("날짜를 확인해주세요");
						$("#birth-test").css("color","#ff2e63");
						inputCheck[0] = false;
						formCheck();
						
					}else{
						$("#birth-test").text("완료");
						$("#birth-test").css("color","#3865f2");
						inputCheck[0] = true;
						formCheck();
						
					}
				}else if(month==4||month==6||month==9||month==11){
					if(day>30||day<0||!day){
						$("#birth-test").text("날짜를 확인해주세요");
						$("#birth-test").css("color","#ff2e63");	
						inputCheck[0] = false;
						formCheck();
						
					}else{
						$("#birth-test").text("완료");
						$("#birth-test").css("color","#3865f2");
						inputCheck[0] = true;
						formCheck();
					}
				}else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
					if(day>31||day<0||!day){
						$("#birth-test").text("날짜를 확인해주세요");
						$("#birth-test").css("color","#ff2e63");	
						inputCheck[0] = false;
						formCheck();
						
					}else {
						$("#birth-test").text("완료");
						$("#birth-test").css("color","#3865f2");	
						inputCheck[0] = true;
						formCheck();
					}
				}
			}else{
				$("#birth-test").text("날짜를 확인해주세요");
				$("#birth-test").css("color","#ff2e63");	
				inputCheck[0] = false;
				formCheck();
				
			}
			
		});

	
	$(".changedata").on("keyup",function(){
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
	    
	    let birth = (year+"-"+newMonth+"-"+newDay);
	    $("#birth").val(birth);
	    
	   
	  //year 유효성검사
		if(year > 2022){
			$("#birth-test").text("날짜를 확인해주세요");
			$("#birth-test").css("color","#ff2e63");
			inputCheck[0] = false;
			formCheck();
		
		}else if(year < 1922){
			$("#birth-test").text("날짜를 확인해주세요");
			$("#birth-test").css("color","#ff2e63");
			inputCheck[0] = false;
			formCheck();
		
		}else if(year!=""&&(year>1923||year<2022)){
			//day 유효성 검사
			if(month == 2 ){
				if(day>29||day<0||!day){
					$("#birth-test").text("날짜를 확인해주세요");
					$("#birth-test").css("color","#ff2e63");
					inputCheck[0] = false;
					formCheck();
					
				}else{
					$("#birth-test").text("완료");
					$("#birth-test").css("color","#3865f2");
					inputCheck[0] = true;
					formCheck();
					
				}
			}else if(month==4||month==6||month==9||month==11){
				if(day>30||day<0||!day){
					$("#birth-test").text("날짜를 확인해주세요");
					$("#birth-test").css("color","#ff2e63");	
					inputCheck[0] = false;
					formCheck();
					
				}else{
					$("#birth-test").text("완료");
					$("#birth-test").css("color","#3865f2");
					inputCheck[0] = true;
					formCheck();
				}
			}else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
				if(day>31||day<0||!day){
					$("#birth-test").text("날짜를 확인해주세요");
					$("#birth-test").css("color","#ff2e63");	
					inputCheck[0] = false;
					formCheck();
					
				}else {
					$("#birth-test").text("완료");
					$("#birth-test").css("color","#3865f2");	
					inputCheck[0] = true;
					formCheck();
				}
			}
		}else{
			$("#birth-test").text("날짜를 확인해주세요");
			$("#birth-test").css("color","#ff2e63");	
			inputCheck[0] = false;
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
	

$("#expertPhone").on("keyup",function(){
    $("#expertPhone-test").text("");
    const value = $(this).val();
    let regExp;
    regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if(!regExp.test(value)){
        $("#expertPhone-test").text(" 연락처를 확인하세요");
        $("#expertPhone-test").css("color","#ff2e63");
        inputCheck[1] = false;
		formCheck();
    }else{
        var memberPhone = $("#expertPhone").val();
        inputCheck[1] = true;
		formCheck();

    }
});
	
	
	
	
	$("#expertPhone").on("keydown",function(){
	    $("#expertPhone-test").text("");
	    const value = $(this).val();
	    let regExp;
	    regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	    if(!regExp.test(value)){
	        $("#expertPhone-test").text(" 연락처를 확인하세요");
	        $("#expertPhone-test").css("color","#ff2e63");
	        inputCheck[1] = false;
			formCheck();
	    }else{
	        var memberPhone = $("#expertPhone").val();
	        inputCheck[1] = true;
			formCheck();

	    }
	});
	
	$("#expertEmail").on("keydown",function(){
	    $("#expertEmail-test").text("");
	    const value = $(this).val();
	    var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    if(!regExp.test(value)){
	        $("#expertEmail-test").text("이메일을 확인하세요");
	        $("#expertEmail-test").css("color","#ff2e63");
	        inputCheck[2] = false;
			formCheck();
	    }else{
	        var memberPhone = $("#expertPhone").val();
	        inputCheck[2] = true;
			formCheck();

	    }
	});
	$("#expertEmail").on("keyup",function(){
	    $("#expertEmail-test").text("");
	    const value = $(this).val();
	    var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    if(!regExp.test(value)){
	        $("#expertEmail-test").text("이메일을 확인하세요");
	        $("#expertEmail-test").css("color","#ff2e63");
	        inputCheck[2] = false;
			formCheck();
	    }else{
	        var memberPhone = $("#expertPhone").val();
	        inputCheck[2] = true;
			formCheck();

	    }
	});

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

</script>	
</body>
</html>