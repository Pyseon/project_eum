<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가신청페이지2</title>
</head>
<body>
	<form action="/Expertapply4.do" method="post">
		<ul>
			<li>
				<label>판매자이름*</label>
				<input type="text" name="expertName" placeholder="이름불러오기">
			</li>
			<li>
				<label>직업명*</label>
				<input type="text" name="expertJob" placeholder="직업명">
			</li>
			<li>
				<label>고객센터번호*</label>
				<input type="text" name="expertPhone" placeholder="070-0000-0000">
			</li>
			<br>
			<li>
				<label>고객센터 이메일*</label>
				<input type="text" name="expertEmail" placeholder="asdf@naver.com">
			</li>
			
		</ul>
		<input type="hidden" name = "expertClass" value="${expertClass }" >
		<input type="hidden" name = "expertTag" value="${expertTag }" >
		<input type="hidden" name = "expertQual" value="${expertQual }" >
		<input type="hidden" name = "expertLicense" value="${expertLicense }" >
		<input type="hidden" name = "expertIssuer" value="${expertIssuer }" >
		<input type="hidden" name = "expertDate" value="${expertDate }" >
				
			
		<input type="submit" value="신청서 작성완료">
	</form>
		
</body>
</html>