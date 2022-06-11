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
				<div class="content-title">> 내 정보
					<div id="star">*는 필수 입력사항입니다.</div>
				</div>
						<form class="joinfrmbox" action="/updateMember.do" method="post">
						<fieldset>
							<div class="content-all-wrap">
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="email">이메일*</label>
									</div>
									<div class="content-box">
										<input class="input-form" type="text" name="memberId" id="email" placeholder="${sessionScope.member.memberId}">
									</div>
								</div> <%--mypage-content --%>
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="nick">닉네임*</label>
									</div>
									<div class="content-box">	
										<input  class="input-form" type="text" name="memberNick" id="nick" placeholder="${sessionScope.member.memberNick}">							
									</div>
								</div> <%--mypage-content --%>
								<div class="mypage-content"> 
									<div class="content-box-title-wrap">
										<label for="pw">비밀번호*</label>
									</div>
									<div class="content-box">	
										<input  class="input-form" type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력해주세요.">
									</div>
								</div>								
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="repw">비밀번호 확인* </label>
									</div>
									<div class="content-box">
										<input class="input-form" type="password" name="memberPwRe" id="repw" placeholder="비밀번호를 다시 입력해주세요.">
									</div>									
								</div>
								<div class="mypage-content">
									<div class="content-box-title-wrap">
										<label for="phone">연락처* </label>
									</div>
									<div class="content-box">	
										<input class="input-form" type="text" name="phone" id="phone" placeholder="${sessionScope.member.memberPhone}">
									</div>
								</div>
							</div><!-- content-all-wrap -->	
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
					<div class="drop-btn-wrap">
						<button class="drop-btn" type="submit">탈퇴하기</button>
					</div> 
					</fieldset>
				</form>
			</div>
		</div>	
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>