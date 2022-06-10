<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
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
	}
</style>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
	<div class="firstbox">
	<div id="maintitle">>내 정보</div>
	<div id="star">*는 필수 입력사항입니다.</div>
	<form class="joinfrmbox" id="joinfrmbox" action="/updateMember.do" method="post">
		<fieldset>
		
			 
		
			<br>
			<br>
			닉네임* <input  class="input-form" type="text" name="memberNick" placeholder="${sessionScope.member.memberNick}"><br>
			
			비밀번호* <input  class="input-form" type="password" name="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			비밀번호 확인* <input class="input-form" type="password" name="memberPwRe" placeholder="비밀번호를 다시 입력해주세요."><br>
			연락처*<input class="input-form" type="text" name="memberPhone" placeholder="${sessionScope.member.memberPhone}"><br>
			<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
			<input type="hidden" name="memberId" value="${sessionScope.member.memberId}">
			<input type="hidden" name="memberPoint" value="${sessionScope.member.memberPoint}">
			<input type="hidden" name="gender" value="${sessionScope.member.gender}">
			<input type="hidden" name="birth" value="${sessionScope.member.birth}">
			<input type="hidden" name="agreement" value="${sessionScope.member.agreement}">
			<input type="hidden" name="grade" value="${sessionScope.member.grade}">
			<input type="hidden" name="enrollDate" value="${sessionScope.member.enrollDate}">
			
			<br>
			
			
			<div class="birthbox">
				
				<button class="btn bc1 bs4" type="submit">수정완료</button>
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
			
			
			<div class="birthbox">
				
				<button class="btn bc3 bs4" type="submit">탈퇴하기</button>
			</div> 
		</fieldset>
	</form>
	</div>
	
	
	
	
	
</body>
</html>