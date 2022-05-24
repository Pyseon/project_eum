<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
	.joinfrmbox{
		margin: 0 auto;
		width: 40%;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
	<form class="joinfrmbox" action="/join.do" method="post">
		<fieldset>
			<h1>회원가입<h1>
			이메일* <input class="input-form" type="text" name="memberId"><br>
			닉네임* <input  class="input-form" type="text" name="memberNick"><br>
			비밀번호* <input  class="input-form" type="password" name="memberPw"><br>
			비밀번호 확인* <input class="input-form" type="password" name="memberPw"><br>
			연락처*<input class="input-form" type="text" name="phone"><br>
			성별* <input class="input-form" type="text" name="gender"><br>
			생년월일* <input class="input-form" type="text" name="birth"><br>
			<button class="btn bc1 bs4" type="submit">가입완료</button>
		</fieldset>
	</form>
</body>
</html>