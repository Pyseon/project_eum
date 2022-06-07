<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가신청페이지2</title>

</head>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	
		<div class="page-content">
		<div class="flex-wrap">
		<form action="/Expertapply4.do" method="post">
		<br>
		<label>판매자이름*</label>
		<input type="text" name="expertName" placeholder="이름불러오기"><br>
		
		<label>직업명*</label>
		<input type="text" name="expertJob" placeholder="직업명"><br>
		
		<label>고객센터번호*</label>
		<input type="text" name="expertPhone" placeholder="070-0000-0000">		
			
		<label>고객센터 이메일*</label>
		<input type="text" name="expertEmail" placeholder="asdf@naver.com"><br>
		
		<input type="hidden" name = "expertClass" value="${expertClass }" >
		<input type="hidden" name = "expertTag" value="${expertTag }" >
		<input type="hidden" name = "expertQual" value="${expertQual }" >
		<input type="hidden" name = "expertLicense" value="${expertLicense }" >
		<input type="hidden" name = "expertIssuer" value="${expertIssuer }" >
		<input type="hidden" name = "expertDate" value="${expertDate }" >
		
		<button class="btn bc1 bs5" onclick="location.href='/Expertapply2.do'">이전</button>
		<button class="btn bc1 bs5" type="submit">작성완료</button>
		
		</form>
	</div>
		
	</div>
</body>
	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>	
</html>