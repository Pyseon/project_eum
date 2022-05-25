<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
	
	
	<form action="/updateMember.do" method="post">
		
			<h1>>내 정보</h1>
			
			<h3> *는 필수 입력사항입니다.</h3>
			
			<h3>이메일*</h3>
			<input type="text" name="memberId" value="${sessionScope.m.memberId }"><br>
			<h3>닉네임*</h3>
			<input type="text" name="nickname" value="${sessionScope.m.nickname }"><br>
			<h3>비밀번호*</h3>
			<input type="password" name ="memberPw" value="${sessionScope.m.memberPw }" placeholder = "비밀번호를 입력해주세요."><br>
			<h3>비밀번호확인*</h3>
			<input type="password" name ="memberPw" value="${sessionScope.m.memberPw }" placeholder = "비밀번호를 다시 입력해주세요."><br>
			<h3>연락처*</h3>
			<input type="text" name="phone" value="${sessionScope.m.phone }" placeholder = "연락처를 입력해주세요."><br>
			<h3>성별</h3>
			<input type="button" name="male">
			<input type="button" name="female">
			<h3>생년월일</h3>
			<input type="text" name="year" placeholder = "년도">
			<input type="text" name="month" placeholder = "월">
			<input type="text" name="day" placeholder = "일">
			
			<input type="submit" value="수정완료">
		
		
	</form>
	<a href="/Myproduct.do">구매내역</a>
	<a href="/Wishlist.do">찜내역</a>
</body>
</html>