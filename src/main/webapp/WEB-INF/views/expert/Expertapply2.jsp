<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 신청3</title>
<style>
.consultbox>.input-form{
		display:inline;
		width: 32%;
		font-size: 15px;
		margin-bottom:3%;
	}
	
</style>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>

		<div class="page-content">
		<div class="flex-wrap">
		<form action="/Expertapply3.do" method="post">
		<br>
				<label><h2>상담분야*</h2></label>
				<div class="consultbox">
				
				<select class="input-form" name='expertCategory'>
				 	<option value='law' selected>법률</option>
					<option value='law' selected>비지니스</option>
					<option value='law' selected>심리/헬스</option>
					<option value='law' selected>학습</option>
					<option value='law' selected>금융</option>
					<option value='law' selected>라이프</option>
					<option value='law' selected>취미</option>
					<option value='law' selected>어학</option>
					<option value='law' selected>레저</option>
					<option value='law' selected>IT/테크</option>
					<option value='law' selected>자기계발</option>
					  
				</select>
			</div><br>
		<label><h2>태그*</h2></label><br>
		<textarea class="input-form" name="expertTag" placeholder="#태그"></textarea><br>
		
		
		<label><h2>자격*</h2></label>
				<p>
					선택분야의 가입 자격입니다.
					아래의 신청 자격을 확인 후 해당되는 자격정보로 입력해 주세요
				</p>
		
		<br>
		<textarea class="input-form" placeholder="반려견 지도사(구.훈련사) - 한국애견협회&#13;&#10;훈련사 -한국애견연맹&#13;&#10;양서파충류 관리사 - 한국양서파충류협회" readonly></textarea><br>
		
		
		<label><h2>자격증 사본*</h2></label><br>
		<br>
		<label for="input-file">파일 선택</label> <input type="file"
									name="file" class="commFile upload-hidden"
									id="input-file">
		
		<label><h2>발급기관 / 취득일시*</h2></label><br>
		<input type="text" class="input-form"  name="issuingAuthority" placeholder="발급기관"><br>
		
		<input type="text" class="input-form"  name="acquistionDate" placeholder="취득일시"><br><br>
		<br>
		<label>직업명*</label>
		<input type="text" class="input-form"  name="jobName" placeholder="직업명"><br>
		
		<label>고객센터번호*</label>
		<input type="text" class="input-form"  name="memberPhone" id = "expertPhone" placeholder="070-0000-0000"><br>		
		<div class="fs-light" id="expertPhone-test"></div><br>
			
		<label>고객센터 이메일*</label>
		<input type="text" class="input-form"  name="expertEmail" placeholder="asdf@naver.com"><br>
		<button class="btn bc1 bs1" type="button" id="button-pr">인증하기</button>
		<label>이름*</label>
		<input type="text" class="input-form"  name="expertName" placeholder="박코딩"><br>
		<div class="fs-light" id="expertName-test"></div><br>
		<label>상세설명*</label>
		<input type="text" class="input-form"  name="expertContent" placeholder="상세설명"><br>
		
		<label>자기소개*</label>
		<input type="text" class="input-form"  name="expertPr" placeholder="자기소개"><br>
		
		<label>자격증명*</label>
		<input type="text" class="input-form"  name="credential" placeholder="자격증명"><br>
		<input type="hidden" name = "memberNo" value="${memberNo }" >
		<button class="btn bc1 bs5" onclick="location.href='/'">돌아가기</button>
		<button class="btn bc1 bs5" type="submit">제출완료</button>
		
		</form>
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
		
		inputCheck[0] = true;
		formCheck();
	}
});
function toastShow(title, icon, msgTime){
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'center-center',
	    showConfirmButton: false,
	    timer: msgTime,
	    timerProgressBar: true,
	    didOpen: (toast) = {
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
</body>
</html>