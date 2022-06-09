<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<body>
	<div class="chatting">
		<div class="col-lg-8">
			<div class="messageArea">
				<p class='date hr-sect'>${firstDate }</p>
				<c:set var="firstDate" value="${firstDate }" /> <%--여기에 첫 날짜를 넣어놓고 날짜가 다르면 출력, 아니면 출력 안 함 --%>
				<c:forEach items="${chat}" var="chat" varStatus="status">
				<c:if test="${firstDate ne chat.chatDate }">
					<p class='date hr-sect'>${chat.chatDate }</p>
					<c:set var="firstDate" value="${chat.chatDate }" />
				</c:if>
					<c:if test="${chat.memberNo eq m.memberNo }">
						<div class="chat-content-wrap sub-right">
							<div class="content-sub-wrap">
								<c:choose>
									<c:when test="${chat.chatReadcheck eq 0}">
									</c:when>
									<c:when test="${chat.chatReadcheck ne 0}">
										<div class="read-check check-right"><c:out value="${chat.chatReadcheck}"/></div>
									</c:when>
								</c:choose>
								<div class="chat-time"><c:out value="${chat.chatTime}"/></div>
							</div>
							<div class="right"><c:out value="${chat.chatContent}"/></div>
						</div>
					</c:if>
					<c:if test="${chat.memberNo ne m.memberNo }">
						<div class="chat-content-wrap">
							<div class="left"><c:out value="${chat.chatContent}"/></div>
							<div class="content-sub-wrap">
								<c:choose>
									<c:when test="${chat.chatReadcheck eq 0}">
									</c:when>
									<c:when test="${chat.chatReadcheck ne 0}">
										<div class="read-check"><c:out value="${chat.chatReadcheck}"/></div>
									</c:when>
								</c:choose>
								<div class="chat-time"><c:out value="${chat.chatTime}"/></div>
							</div>
						</div>	
					</c:if>						
				</c:forEach>
			</div>
			<!-- 주문상태 확인, 1:구매완료 2:구매확정 3:취소완료, 따라서 1번 활성화, 2번 비활성화, 3번은 다른 페이지로 리턴 됨-->
			<c:choose>
				<c:when test="${pay.payState eq 1}">
					<div class="sendBox">
						<input type="file" name="file" id="file" style="display:none"> <div class="fileBtn-wrap" onclick="document.all.file.click()"><img class="fileBtn" src="/img/product/icon-folder.png"></div>
						<input type="hidden" id="memberNo" value="${m.memberNo }">
						<input type="hidden" id="counselNo" value="${c.counselNo }">
						<input type="text" id="sendMsg" placeholder="[안내] 상담이 종료되면 입력이 불가합니다.">
						<div class="send-btn"><span class="material-icons fc-7 send-icon">arrow_forward</span></div>
					</div><!-- sendBox -->				
				</c:when>
				<c:when test="${pay.payState eq 2}">
					<div class="sendBox">
						<input name="file" id="file" style="display:none"> <div class="fileBtn-wrap"><img class="fileBtn" src="/img/product/icon-folder.png"></div>
						<input type="text" id="sendMsg" placeholder="[안내] 상담이 종료되어 입력이 불가합니다. 상담에 문제가 있는 경우 고객센터로 문의해주세요." readonly>
						<div class="send-btn-non"><span class="material-icons fc-7 send-icon">arrow_forward</span></div>
					</div><!-- sendBox -->	
				</c:when>
			</c:choose>
					<!-- ajax이용해서 실시간으로 payState 바꿔주기...... -->
		</div><!-- col-lg-8 -->
		<div class="col-lg-4">
			<div class="buy-detail">
				<div class="widget-wrap title-wrap">
					<div class="product-title">${p.productTitle }</div>
					<div class="product-detail">
						<span class="material-icons fc-7 icon-schedule">schedule</span>
						<div class="product-option">1:1상담&nbsp;&nbsp;/</div>&nbsp;&nbsp;
						<div class="product-option op2">${p.productOption }분</div><span id="timeZone">-</span> <span id="msg"></span>					
					</div>
					<hr>
					<div class="check-title-wrap">
						<span class="material-icons icons-check fc-9">done</span>
						<div class="check-list-title fc-9">꼭 확인해 주세요</div>
						<span class="material-icons fc-7 icon-out" onclick="window.open('/Myproduct.do?memberNo=${m.memberNo}')">logout</span><br>
					</div>
					<div class="check-list-content">
						<ul>
							<li>&#183; 전문가와 협의 후에 상담 시작을 눌러주세요.<br></li>
							<li>&#183; 지정된 시간이 지나면 자동 종료 됩니다.<br></li>
							<li>&#183; 중간에 멈출 수 없습니다.</li>
						</ul>
					</div>
					<!-- 주문상태 확인, 1:구매완료 2:구매확정 3:취소완료 -->
							<!-- 체크박스여부 확인하고 가능하게 구현예정 -->
						<!-- 주문상태가 2번 구매확정이면 후기작성 여부에 따라 후기작성/마이페이지 이동으로 나뉨 -->
					<c:choose>
						<c:when test="${pay.payState eq 1}">
							<div class="check-box-allwrap">
								<div class="check-box-wrap"><input class="checkbox" type="checkbox" id="checkbox" name="agree"></div>
								<div class="check-agree">위 내용을 확인하셨습니까?</div>
							</div>
							<div class="submit-wrap">
								<button type="submit" class="bc1 submit-btn" id="startBtn">시작하기</button>
							</div>
						</c:when>
						<c:when test="${pay.payState eq 2}">
							<c:choose>
								<c:when test="${r eq 0 }">
									<div class="check-box-allwrap">
										<div class="check-box-wrap"><input class="checkbox" type="checkbox" id="checkbox" checked disabled></div>
										<div class="check-agree">위 내용을 확인하셨습니까?</div>
									</div>
									<c:choose>
										<c:when test="${m.grade eq 1 }">
											<div class="submit-wrap">
											<button type="button" class="bc1 submit-btn" id="startBtn" onclick="location.href='/'">홈페이지</button>
											</div>
										</c:when>
										<c:when test="${m.grade eq 2 }">
											<div class="submit-wrap">
											<button type="button" class="bc1 submit-btn" id="startBtn" onclick="('/reviewFrm.do?payNo=${pay.payNo}')">후기작성</button>
											</div>										
										</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
									<div class="check-box-allwrap">
										<div class="check-box-wrap"><input class="checkbox" type="checkbox" id="checkbox"  checked disabled></div>
										<div class="check-agree">위 내용을 확인하셨습니까?</div>
									</div>
									<div class="submit-wrap">
										<button type="button" class="bc1 submit-btn" id="startBtn" onclick="('/Myproduct.do?memberNo=${m.memberNo}')">마이페이지</button>
									</div>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</div><!-- widget-wrap title-wrap -->
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
							</div><!-- expert-profile -->	
							<div class="expert-profile-span">
								<span class="material-icons icon-confirm confirm2">verified</span>
							</div>	
						</div><!-- expert-profile -->
						<div class="info-wrap">
							<div class="info1">
								<h5 class="extpert-info">
									<span>${e.jobName }</span>
								</h5>
							</div>			
							<div class="info2">
								<h5 class="extpert-info">
									<span>${e.expertIntro }</span>
								</h5>
							</div>
						</div><!-- info-wrap -->
					</div><!-- expert-info -->
				</div><!-- widget-wrap -->
			</div><!-- buy-detail -->
		</div><!-- col-lg-4 -->
	</div><!-- chatting -->
<script>

	$(function(){		
		//웹소켓 객체용 변수
		let ws;
		//접속회원 아이디용 변수
		let memberId;
		//페이지 뜨자마자 initChat 함수 실행
		initChat('${m.memberId}');
		
		//send-btn을 클릭하면 메세지 전송 함수 실행
		$('.send-btn').on('click', function(){
			sendMsg();
		});
		//startBtn을 클릭하면 체크박스 여부 체크 및 시간 감소
		$('#startBtn').on('click', function(){
			if($('#startBtn').text() == '시작하기') {
				//체크박스 체크여부
				if($('.checkbox').is(':checked')==false){
				    alert('확인사항 동의 후 시작하기를 눌러주세요.');
				}else {
				    $('.checkbox').attr('disabled',true);
				    const counselNo = $('#counselNo').val();
				    const startTime = getTime2();
				    /*
				    const startTimeSplit = startTime.split(':');
				    console.log(startTime);
				    console.log(startTimeSplit);
				    let reTime = "";
				    for(let i = 0; i < startTimeSplit.length; i++) {
				    	reTime = reTime+startTimeSplit[i]
				    }
				    let testTime = 015030;013543
				    const why = parseInt(015030-013543);
				    const why2 = parseInt(013543+693);
				    console.log('why2>>>'+why2)
				    console.log('why'+why)
				    console.log(reTime);
				    let finalTime = testTime-reTime;
				    console.log(finalTime);
				    */
				    $.ajax({
				    	url : "updateStartTime.do",
				    	data : {startTime:startTime, counselNo:counselNo}, 
				    	success : function(data) {
				    		appendChat("<p class='check-in'>상담이 시작되었습니다.</p>");
						    $('#timeZone').html("<span id='min'>${p.productOption }</span> : <span id='sec'>00</span>");
							intervalId = window.setInterval(function(){
								timeCount();
							},10);
						},
						error : function() {
							alert('잘못된 접근입니다.');
						}
				    });
				    //appendChat("<p class='check-in'>상담이 시작되었습니다.</p>");
				    //$('#timeZone').html("<span id='min'>${p.productOption }</span> : <span id='sec'>00</span>");
					//intervalId = window.setInterval(function(){
						//timeCount();
					//},10);
					//${p.productOption } //1000
				}
			}else if($('#startBtn').text() == '후기작성') {
				$('.checkbox').attr('checked', 'checked');
				$('.checkbox').attr('disabled',true);
				location.href='/reviewFrm.do?payNo=${pay.payNo}';
			}else if($('#startBtn').text() == '마이페이지') { 
				$('.checkbox').attr('checked', 'checked');
				$('.checkbox').attr('disabled',true);
				location.href='/Myproduct.do?memberNo=${m.memberNo}';
			}else {
				$('.checkbox').attr('checked', 'checked');
				$('.checkbox').attr('disabled',true);
				location.href='/';
			}
		});	
		
		function timeCount(){
			const counselNo = $('#counselNo').val();
			const min = Number($("#min").text());
			const sec = $("#sec").text();
			if(sec == "00") {
				if(min == 0){
					clearInterval(intervalId);
					$('#sendMsg').attr("readonly", true);
					appendChat("<p class='check-in'>상담이 종료되었습니다.</p>");
					const msg = $("#msg");
					msg.text("종료");
					msg.css("color","#1abc9c");
					$.ajax({
						url : "/updatePaymentState.do",
						data : {counselNo:counselNo},
						success : function(data) {
							if(${m.grade eq 2}) {
								$('#startBtn').text('후기작성');								
							}else if(${m.grade eq 1}) {
								$('#startBtn').text('홈페이지');
							}
							$('#sendMsg').attr("placeholder",'[안내] 상담이 종료되어 입력이 불가합니다. 상담에 문제가 있는 경우 고객센터로 문의해주세요.');
							$('#file').attr("type","text");
						},
						error : function() {
							console.log('에러');
						}
					});
				}else{
					$("#min").text(min-1);
					$("#sec").text(59);	
				}
			}else{
				const newSec = Number(sec)-1;
				if(newSec<10){
					$("#sec").text("0"+newSec);
				}else{
					$("#sec").text(newSec);
				}
			}
		} 

		//접속한 시점 날짜 함수
		function getToday(){
		    var now = new Date();
		    var year = now.getFullYear();
		    var month = now.getMonth() + 1;  //0부터 시작이라 +1
		    var date = now.getDate();
		    if(month<10) {
		    	month = "0"+month;
		    }
		    if(date<10) {
		    	date = "0"+date;
		    }
			return year+"년"+month+"월"+date+"일"; 
		}
		
		function getTime(){
			var now = new Date();
			var hours = now.getHours(); 
			var minutes = now.getMinutes();
			if(hours<10) {
				hours = "0"+hours;
			}
			if(minutes<10) {
				minutes = "0"+minutes;
			}
			return hours+":"+minutes;
		}
		
		function getTime2(){
			var now = new Date();
			var hours = now.getHours(); 
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();  
			//var milliseconds = today.getMilliseconds(); // 밀리초
			if(hours<10) {
				hours = "0"+hours;
			}
			if(minutes<10) {
				minutes = "0"+minutes;
			}
			if(seconds<10) {
				seconds = "0"+seconds;
			}
			return hours+":"+minutes+":"+seconds;
		}
		
		
		//채팅을 시작하는 함수
		function initChat(param) {
			memberId = param;
			//웹소켓 연결 시도
			ws = new WebSocket("ws:${pageContext.request.serverName}:${pageContext.request.serverPort}/chat.do"); 
			//웹소켓 연결 성공 시 실행 함수 지정
			ws.onopen = startChat;
			//서버에서 화면으로 데이터를 전송 시 처리할 함수 지정
			ws.onmessage = receiverMsg;
			//웹소켓 연결이 종료되면 실행 되는 함수 지정
			ws.onclose = endChat;
			
		}
		
		//웹소켓 연결이 성공하면 실행 함수
		function startChat(){
			//key:value
			const memberNo = $("#memberNo").val();
			const counselNo = $('#counselNo').val();
			let time = getTime()
			console.log(time);
			const data = {
						  type:"enter",
						  msg:memberId, 
						  memberNo:memberNo,
						  counselNo:counselNo,
						  time:time
						 }; 
			ws.send(JSON.stringify(data)); //data객체를 문자열로 변환해서 웹소켓 서버로 전송
			appendChat("<p class='date hr-sect'>"+getToday()+"</p>"); 
			appendChat("<p class='check-in'>대화가 시작되었습니다.</p>"); //이전대화를 여기서 가져오는 방법도 있음
		}
		
		//서버에서 화면으로 데이터를 전송 시 처리할 함수 
		function receiverMsg(param) {
			appendChat(param.data); // 받은 메세지 출력해였는데..............................
			//메세지로 보낼 때도 있는데 읽음으로 바꿀 때도 있는 것.........
			console.log(param);
		}
		
		//웹소켓 연결이 종료되면 실행 되는 함수 
		function endChat() {
			console.log("웹소켓 종료!");
		}
		
		//전송버튼 클릭 시 입력한 메세지를 전송하는 함수
		function sendMsg(){
			const msg = $("#sendMsg").val();
			const memberNo = $("#memberNo").val();
			const counselNo = $('#counselNo').val();
			let time = getTime()
			if(msg != ''){
				const data = {
							  type:"chat",
							  msg:msg, 
							  memberNo:memberNo,
							  counselNo:counselNo,
							  time:time
							 };
				ws.send(JSON.stringify(data));
				
				$.ajax({
					url : "updateReadCheck.do",
					data : {memberNo:memberNo, counselNo:counselNo},
					success : function(data) {
						console.log('성공');
					},
					error : function() {
						console.log('에러');
					}
				})
				
				appendChat("<div class='chat-content-wrap sub-right'><div class='content-sub-wrap'><div class='read-check check-right'>1</div><div class='chat-time'>"+getTime()+"</div></div><div class='chat right'>"+msg+"</div></div>");
				$("#sendMsg").val("");
			}
		}
		//.messageArea에 메세지를 추가하는 함수
		function appendChat(msg){
			$(".messageArea").append(msg);
			$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
		}
		
		//엔터로 메세지 보내기
		$(function(){
			$("#sendMsg").on("keyup", function(key){
				if(key.keyCode == 13){ //13번이 엔터키코드
					sendMsg();
				}
			});
		});
	});
</script>
</body>
</html>