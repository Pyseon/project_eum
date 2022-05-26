<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/expertCounselProduct.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
	<div class="chatting">
		<div class="col-lg-8">
			<div class="messageArea"></div>
		</div><!-- col-lg-8 -->
		<div class="col-lg-4">
			<div class="buy-detail"></div>
		</div>
		<div class="sendBox">
			<input type="text" id="sendMsg">
			<button id="sendBtn" onclick="sendMsg();">전송</button>
		</div><!-- sendBox -->
	</div><!-- chatting -->

</body>
</html>