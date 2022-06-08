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
		<textarea class="input-form" placeholder="반려견 지도사(구.훈련사) - 한국애견협회&#13;&#10;훈련사 -한국애견연맹&#13;&#10;양서파충류 관리사 - 한국양서파충류협회"></textarea><br>
		
		
		<label><h2>자격증 사본*</h2></label><br>
		<input type="text" name="certificateName"  class="input-form" placeholder="최대 MB 이하 첨부가능 jpg,png,pdf 지원"><br>
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
		<input type="text" class="input-form"  name="expertPhone" placeholder="070-0000-0000"><br>		
			
		<label>고객센터 이메일*</label>
		<input type="text" class="input-form"  name="expertEmail" placeholder="asdf@naver.com"><br>
		
		<label>이름*</label>
		<input type="text" class="input-form"  name="expertName" placeholder="박코딩"><br>
		
		<label>상세설명*</label>
		<input type="text" class="input-form"  name="expertContent" placeholder="상세설명"><br>
		
		<label>자기소개*</label>
		<input type="text" class="input-form"  name="expertPr" placeholder="자기소개"><br>
		
		<label>자격증명*</label>
		<input type="text" class="input-form"  name="credential" placeholder="자격증명"><br>
		<input type="hidden" name = "memberNo" value="${memberNo }" >
		<button class="btn bc1 bs5" onclick="location.href='/Expertapply.do'">이전</button>
		<button class="btn bc1 bs5" type="submit">제출완료</button>
		
		</form>
	</div>
		
	</div>

	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>	
</body>
</html>