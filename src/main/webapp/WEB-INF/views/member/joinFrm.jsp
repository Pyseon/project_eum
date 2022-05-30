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
	.joinfrmbox>fieldset input{
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
	.checkbox-s{
		font-size: 15px;
	}
	.checkbox-s>input{
		
	}
</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
	<div class="firstbox">
	<div id="maintitle">회원가입</div>
	<div id="star">*는 필수 입력사항입니다.</div>
	<form class="joinfrmbox" action="/join.do" method="post">
		<fieldset>
			<div class="emailbox">
				<div>이메일*</div> 
				<input class="input-form" type="text" name="memberId" placeholder="이메일을 입력해주세요.">
				<button class="btn bc1 bs1" type="button" id="button-pr">인증하기</button>
			</div>
			<input class="input-form mbt" type="text" name="numberId" placeholder="인증번호를 입력해주세요."><br>
			닉네임* <input  class="input-form" type="text" name="memberNick" placeholder="닉네임을 입력해주세요."><br>
			비밀번호* <input  class="input-form" type="password" name="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			비밀번호 확인* <input class="input-form" type="password" name="memberPwRe" placeholder="비밀번호를 다시 입력해주세요."><br>
			연락처*<input class="input-form" type="text" name="phone" placeholder="연락처를 입력해주세요."><br>
			<div class="genderbox">
				<div>성별</div> 
				<button class="btn bc1 bs3">남</button><button class="btn bc1 bs3">여</button><br>
			</div>
			<br>
			<div class="birthbox">
				<div>생년월일</div>
				<input  class="input-form" type="text" name="year" placeholder="년(4자)">
				<select class="input-form" name='month'>
					  <option value='' selected>월</option>
					  <option value='1'>1</option>
					  <option value='2'>2</option>
					  <option value='3'>3</option>
					  <option value='4'>4</option>
					  <option value='5'>5</option>
					  <option value='6'>6</option>
					  <option value='7'>7</option>
					  <option value='8'>8</option>
					  <option value='9'>9</option>
					  <option value='10'>10</option>
					  <option value='11'>11</option>
					  <option value='12'>12</option>
				</select>
				<input  class="input-form" type="text" name="day" placeholder="일">
				<button class="btn bc1 bs4" type="submit">가입완료</button>
			</div>
			<div class="checkedbox">
				<input type="checkbox" class="">모두 동의합니다.
				<div class="checkbox-s">
					<p><input type="checkbox" class="">만 14세 이상입니다.(필수)</p>
					<p><input type="checkbox" class="">서비스이용약관에 동의합니다.(필수)</p>
					<p><input type="checkbox" class="">개인정보 수집/이용에 동의합니다.(필수)</p>
					<p><input type="checkbox" class="">이벤트 할인 혜택 알림 수신에 동의합니다(선택)</p>
				</div>
			</div>
		</fieldset>
	</form>
	</div>
</body>
</html>