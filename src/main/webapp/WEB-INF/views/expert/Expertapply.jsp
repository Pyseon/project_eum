<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가신청페이지1</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	
	
	<div class="page-content">
		<br>
		<div>
		
		<button class="btn bc1 bs5">개인</button>
		<button class="btn bc1 bs5">개인사업자</button>
		<button class="btn bc1 bs5">법인사업자</button>
		<br>
		<p>
			사업자를 등록하지 않은 개인 자격으로 신청하는경우 선택합니다.
		단, 회계/법률/관세 등 법적으로 겸업 금지인 분야는 소속되어 있는 사업자로만 신청이 가능하여 선택할 수 없습니다.
		</p>
		<div style="border:1px solid; padding:10px;">
		필요서류 미리보기
		공통 : 분야 별 신청자격에 따른 첨부 서류 <a href="/checkdocument.do">자세히보기</a>
		</div>
		
		<label><input type="checkbox" name = "expert_check">이용약관, 개인정보 수집 및 이용, 상담전문가의 개인정보보호 의무에 모두 동의합니다.</label>
		<br>
		<br>
		<label><input type="checkbox" name = "expert_check1">(이음)서비스 전문가 이용약관 동의</label>
		<textarea class="input-form" placeholder="이음약관"></textarea>
		
		<br>
		<label><input type="checkbox" name = "expert_check2">개인정보 수집 및 이용동의</label>
		<textarea class="input-form" placeholder="이음약관2"></textarea>
		
		<br>
		<label><input type="checkbox" name = "expert_check3">상담전문가의 개인정보보호 의무 안내 및 동의</label>
		<textarea class="input-form" placeholder="이음약관3"></textarea>
		<br>
		<button class="btn bc1 bs5" onclick="location.href='/Expertapply2.do'">다음</button>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>
</body>
</html>