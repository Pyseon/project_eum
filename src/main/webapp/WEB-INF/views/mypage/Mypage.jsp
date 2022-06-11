<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link rel="stylesheet" href="css/mypage.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageheader.jsp"%>
		<div class="col-lg-8 posts-list">
			<div class="content-wrap">
				<div class="content-title">>내 정보</div>
					<div id="star">*는 필수 입력사항입니다.</div>
						<form class="joinfrmbox" action="/updateMember.do" method="post">
						<fieldset>
							<div class="emailbox">
								<div>이메일*</div> 
								<input class="input-form" type="text" name="memberId" placeholder="${sessionScope.member.memberId}">
							</div>
							<br>
							<br>
							닉네임* <input  class="input-form" type="text" name="memberNick" placeholder="${sessionScope.member.memberNick}"><br>
							비밀번호* <input  class="input-form" type="password" name="memberPw" placeholder="비밀번호를 입력해주세요."><br>
							비밀번호 확인* <input class="input-form" type="password" name="memberPwRe" placeholder="비밀번호를 다시 입력해주세요."><br>
							연락처*<input class="input-form" type="text" name="phone" placeholder="${sessionScope.member.memberPhone}"><br>
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
		</div>	
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>