<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.joinfrmbox>fieldset>input{
		font-size: 15px;
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
	.bs1{
		float: left;
	}	
</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
	<div class="firstbox">
	<div id="maintitle">회원가입</div>
	<div id="star">*는 필수 입력사항입니다.</div>
	<form class="joinfrmbox" action="/join.do" method="post">
		<fieldset>
			이메일* <input class="input-form" type="text" name="memberId" placeholder="이메일을 입력해주세요.">
			<button class="btn bc1 bs1">인증하기</button>
			<input class="input-form mbt" type="text" name="numberId" placeholder="인증번호를 입력해주세요."><br>
			닉네임* <input  class="input-form" type="text" name="memberNick" placeholder="닉네임을 입력해주세요."><br>
			비밀번호* <input  class="input-form" type="password" name="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			비밀번호 확인* <input class="input-form" type="password" name="memberPwt" placeholder="비밀번호를 다시 입력해주세요."><br>
			연락처*<input class="input-form" type="text" name="phone" placeholder="연락처를 입력해주세요."><br>
			성별 <input class="input-form" type="text" name="gender"><br>
			생년월일 <input class="input-form" type="text" name="birth"><br>
			<button class="btn bc1 bs4" type="submit">가입완료</button>
		</fieldset>
	</form>
	</div>
</body>
</html>