<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

    <style>
      #login-btn {
        font-family: fs-regular;
      }
      .container2{
      	margin: 0 auto;
      	width: 60%;
      }
      .login-form{
      	margin: 0 auto;
      }
      .login-form>fieldset>input{
      	align-content: center;
      	text-align: center;
      }
      .login-form>fieldset{
      	margin: 0 auto;
      	margin-top: 20%;
      	width: 40%;
      }
      .joinbox{
      	margin: 0 auto;
      	margin-top: 1%;
      	text-align: center;
      }
      .navi-me{
      color:red;
      }
      

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/member/memberheader.jsp"%>
<div class="container2">
	<form class="login-form" id="login-form" action="/login.do" method="post">
		<fieldset>
			<input type="text" class="input-form" name="memberId" id="memberId" placeholder="이메일을 입력해주세요."><br>
			<input type="password" class="input-form" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요."><br>
			<div class="navi-me" id="navi-me">이메일 또는 비밀번호를 확인해주세요</div>
			<button class="btn bc1 bs4" type="submit" submitbtn">로그인</button>
		</fieldset>
	</form>
</div>
<div class="joinbox">
	<div><a href="/joinFrm.do">회원가입</a></div>
	<div><a href="#">아이디/비밀번호찾기</a></div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>