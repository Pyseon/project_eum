<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/expertCounselProduct.css" />
<link rel="stylesheet" href="css/default_city.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
 <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</head>
<script>
	//채팅 시작
	let memberId;
	function initchat(param) {
		memberId = param;
	}
	//전송클릭 시 입력 메세지를 전송하는 함수
	function sendMsg(){
		const msg = $("#sendMsg").val();
		if(msg != ''){
			$(".messageArea").append("<div class='chat right'>"+msg+"</div>");
			$("#sendMsg").val("");
		}
	}
</script>
<body>
	<button onclick="initChat('${sessionScope.m.memberId}');"></button>
	<div class="chatting">
		<div class="col-lg-8">
			<div class="messageArea"></div>
			<div class="sendBox">
				<input type="text" id="sendMsg">
				<button id="sendBtn" onclick="sendMsg();"><span class="material-icons send-icon">task_alt</span></button>
			</div><!-- sendBox -->
		</div><!-- col-lg-8 -->
		<div class="col-lg-4">
			<div class="buy-detail"></div>
		</div>
	</div><!-- chatting -->

</body>
</html>