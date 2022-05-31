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
	//웹소캣 객체 변수
	let ws;
	//접속회원 아이디 변수
	let memberId;
	//채팅 시작 하는 함수
	function initChat(param) {
		memberId = param;
		//웹소캣 연결 시도
		ws = new WebSocket("ws://아이피/chat.do");
		//웹소캣 연결이 성공하면 실행하는 함수
		ws.onopen = startChat();
		//서버에서 화면으로 데이터를 전송하면 처리할 함수
		ws.onmessage = receiveMsg();
		//웹소캣 연결이 종료되면 실행할 함수
		ws.onclose = endChat();
	}
	
	function startChat() {
		
	}
	function receiveMsg(param){
		
	}
	function endChat(){
		
	}
	
	//전송클릭 시 입력 메세지를 전송하는 함수
	function sendMsg(){
		const msg = $("#sendMsg").val();
		if(msg != ''){
			appendChat("<div class='chat right'>"+msg+"</div>");
			$("#sendMsg").val("");
		}
	}
	
	//.messageArea에 메세지를 추가하는 함수
	function appendChat(msg) {
		$(".messageArea").append(msg);
		$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
	}
	$(function(){
		$("#sendMsg").on("keyup", function(key){
			if(key.keyCode == 13){ //13번이 엔터키코드
				sendMsg();
			}
		});
	});
</script>
<body>
	<button type="button" class="testBtn" onclick="initChat('${sessionScope.member.memberId}');"></button>
<div class="container">
	<div class="chatting">
		<div class="col-lg-8">
			<div class="messageArea"></div>
			<div class="sendBox">
				<input type="text" id="sendMsg" placeholder="[안내] 상담이 종료되면 입력이 불가합니다.">
				<button id="sendBtn" onclick="sendMsg();"><span class="material-icons send-icon">task_alt</span></button>
			</div><!-- sendBox -->
		</div><!-- col-lg-8 -->
		<div class="col-lg-4">
			<div class="buy-detail">
				<div class="widget-wrap">
					<div class="product-title">${p.productTitle }</div>
					<div class="product-detail">
						<span class="material-icons fc-7 icon-schedule">schedule</span>
						<div class="product-option">1:1상담&nbsp;&nbsp;/</div>&nbsp;&nbsp;
						<div class="product-option op2">${p.productOption }분</div>					
					</div>
					<hr>
					<div class="check-title-wrap">
						<span class="material-icons icons-check fc-9">done</span>
						<div class="check-list-title fc-9">꼭 확인해 주세요</div><br>
					</div>
					<div class="check-list-content">
						<ul>
							<li>&#183; 전문가와 협의 후에 상담 시작을 눌러주세요.<br></li>
							<li>&#183; 지정된 시간이 지나면 자동 종료 됩니다.<br></li>
							<li>&#183; 중간에 멈출 수 없습니다.</li>
						</ul>
					</div>
					<!-- 체크박스여부 확인하고 시작가능하게 구현예정 -->
					<div class="check-box-allwrap">
						<div class="check-box-wrap"><input class="checkbox" type="checkbox" name="agree"></div>
						<div class="check-agree">위 내용을 확인하셨습니까?</div>
					</div>
					<div class="submit-wrap">
						<button type="submit" class="bc1" id="startBtn">시작하기</button>
					</div>
				</div>
				<div class="widget-wrap">
					<div class="expert-info">
						<div class="picture">
							<a href="#"><img class="testimg" src="/img/member/${em.memberPicturePath }"></a>	
						</div>
						<div class="expert-profile">
							<div class="expert-profile">
								<h3 class="expert-info">
									<c:choose>
										<c:when test="${empty expertAndCom.compName}">
											${e.expertName }
										</c:when>
										<c:otherwise>
											${ec.compName}
										</c:otherwise>
									</c:choose>
								</h3>					
							</div>	
							<div class="expert-profile-span">
								<span class="material-icons icon-confirm confirm2">verified</span>
							</div>	
						</div><!-- expert-profile -->
						<div class="info-wrap">
							<h5 class="extpert-info"><span>${e.jobName }</span></h5>			
							<div class="info2"><h5 class="extpert-info"><span>${e.expertIntro }</span></h5></div>
						</div><!-- info-wrap -->
					</div><!-- expert-info -->
				</div><!-- widget-wrap -->
			</div>
		</div>
	</div><!-- chatting -->
</div>
</body>
</html>