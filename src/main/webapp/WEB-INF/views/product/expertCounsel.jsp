<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <!-- 캐시삭제 -->
<%
	response.setHeader("Cache-Control", "no-store");
%>
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
					<c:set var="firstDate" value="${chat.chatDate }" /> <%--첫 대화 날짜가 들어간 변수와 채팅 대화날짜가 다르면 변수 재설정 --%>
				</c:if>
					<c:if test="${chat.memberNo eq m.memberNo }"> <%-- 채팅 멤버 번호와 멤버 번호가 같으면  오른쪽 출력--%>
						<div class="chat-content-wrap sub-right">
							<div class="content-sub-wrap">
								<c:choose>
									<c:when test="${chat.chatReadcheck eq 0}">
									</c:when>
									<c:when test="${chat.chatReadcheck ne 0}">
										<div class="read-check check-right"></div>
									</c:when>
								</c:choose>
								<div class="chat-time"><c:out value="${chat.chatTime}"/></div>
							</div>
							<div class="right"><c:out value="${chat.chatContent}"/></div>
						</div>
					</c:if>
					<c:if test="${chat.memberNo ne m.memberNo }"> <%-- 채팅 멤버 번호와 멤버 번호가 다르면  왼쪽 출력--%>
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
			<!-- ajax이용해서  payState 바꿔주기...... -->
			<c:choose>
				<c:when test="${pay.payState eq 1}">
					<div class="sendBox">
						<%--  <input type="file" name="file" id="file" accept=".jpg,.png,.jpeg" style="display:none"> <div class="fileBtn-wrap" onclick="document.all.file.click()"><img class="fileBtn" src="/img/product/icon-folder.png"></div>--%>
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
					<!-- 체크박스 여부 확인하는 스크립트 -->
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
		
		let productOption = ${p.productOption };
		console.log("productOPtion>>"+productOption);
		productOption = Number(productOption) * 60;
		console.log("productOptionAfter>>>"+productOption);
		
			
		function productOptionCount(param){
		    const paramSplit = param.split('');
		    console.log(param);
		    console.log(paramSplit);
		    console.log(paramSplit.length);
		    let rehour = "";
		    let remin = "";
		    let resec = "";
		    for(let i = 0; i < paramSplit.length; i++) {
		    	if(i<2) {
		    		if(paramSplit[0]==0) {
		    			paramSplit[0]="";
			    	}
		    		rehour = rehour+paramSplit[i];
		    	}if(1<i && i<4) {
		    		remin = remin+paramSplit[i];
		    	}if(3<i && i<6){
		    		resec = resec+paramSplit[i];
		    	}
		    }
		    console.log(rehour);
		    console.log(remin);
		    console.log(resec);
		    
		    //숫자로 변환하면서 초 단위로 바꾸기
		    rehour = Number(rehour) * 60 * 60;
		    remin = Number(remin) * 60;
		    resec = Number(resec);
		    return rehour+remin+resec;
		}
		
		//시간 계산 중
		//현재시간
   		const present = getTime2();
		let rePresent = productOptionCount(present);
		console.log("startTime2>>>>"+rePresent);
	
	    //상담시작시간
		let counselStartTime = ${c.startTime};
		console.log(counselStartTime);
		console.log(typeof(counselStartTime));
		const reStartTime = productOptionCount(counselStartTime.toString());
		console.log("reStartTime >>>"+reStartTime);
		
		//현재-시작시간
		let finalTime = rePresent-reStartTime;
		console.log("finalTime>>>>"+finalTime)
		
		//옵션보다 현재-시간이 더 크면 상담종료 
	    if(productOption < finalTime){
	    	console.log("분으로 바꾸면>>>"+(productOption-finalTime)/60);
	    	console.log('testtttt');
	    }
		
		
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
				    
				    
				    $.ajax({//null값인 StartTime 칼럼에 시작버튼을 누른 시점 시간을 update해주고 interval로 시간 체크
				    	url : "updateStartTime.do",
				    	data : {startTime:startTime, counselNo:counselNo}, 
				    	success : function(data) {
				    		socketSend();
				    		//두번째 인터벌 넣었던 자리
				    		//appendChat("<p class='check-in'>상담이 시작되었습니다.</p>");
						    //$('#timeZone').html("<span id='min'>${p.productOption }</span> : <span id='sec'>00</span>");
							//intervalId = window.setInterval(function(){
								//timeCount();
							//},10);
						},
						error : function() {
							alert('잘못된 접근입니다.');
						}
				    });
				    //처음 인터벌 넣은 자리
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
		
		//시간계산 + 상담이 끝나면
		function timeCount(){
			const counselNo = $('#counselNo').val();
			const min = Number($("#min").text());
			const sec = $("#sec").text();
			if(sec == "00") { // 초단위가 00이면 분단위 체크
				if(min == 0){ // 둘다 0이면 > 상담이 끝나서
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
				}else{//초단위가 00이지만 분단위가 0이 아니면
					$("#min").text(min-1);
					$("#sec").text(59);	
				}
			}else{//초단위가 00이 아니면
				const newSec = Number(sec)-1;
				if(newSec<10){
					$("#sec").text("0"+newSec);
				}else{
					$("#sec").text(newSec);
				}
			}
		} 

		//접속한 시점 날짜 함수 화면에 보여짐
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
		
		//접속한 시점 시간 함수 화면에 보여짐
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
		
		//계산용 함수, 초단위까지
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
			return hours+""+minutes+""+seconds;
		}
		
		
		//채팅을 시작하는 함수
		function initChat(param) {
			memberId = param;
			//웹소켓 연결 시도
			ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/chat.do"); 
			//웹소켓 연결 성공 시 실행 함수 지정
			ws.onopen = startChat;
			//서버에서 화면으로 데이터를 전송 시 처리할 함수 지정
			ws.onmessage = receiverMsg;
			//웹소켓 연결이 종료되면 실행 되는 함수 지정
			ws.onclose = endChat;
			
		}
		
		/*
		ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/chat.do";
		wsUri : 
		ws:// = http와 다른 웹소켓 전용 프로토콜. 보안이 더 강화된 wss://도 존재한다.

		${pageContext.request.serverName}: = localhost:
		자신의 아이피

		${pageContext.request.serverPort} = 8080
		el태그로 작성했기 때문에 포트번호가 바뀌어도 적용가능.

		${pageContext.request.contextPath} = /abc
		앞에 / 가 자동으로 붙으며 프로젝트의 Context root

		/websocket/chat.do
		Servlet-context.xml에 등록한 path를 입력
		*/
		
		/*
		sudo 코드 ... 코드 문법 무시하고 로직만 쓰는 코드_상담시작 코드에 대한 조언
		펑션 선언 : 상담시작 {
			소켓 센드 ( {
				타입 : counselStart
			})		
		}		
		*/
		
		//시작버튼 누르면 실행 함수
		function socketSend() {
			const memberNo = $("#memberNo").val();
			const counselNo = $('#counselNo').val();
			const counselStart = getTime2();
			let time = getTime()
			const data = {
						  type:"countdown",
						  msg:memberId, 
						  memberNo:memberNo,
						  counselNo:counselNo,
						  time:time,
						  counselStart:counselStart
					 	 }; 
			ws.send(JSON.stringify(data));
		}
		
		//웹소켓 연결이 성공하면 실행 함수
		function startChat(){
			//key:value
			const memberNo = $("#memberNo").val();
			const counselNo = $('#counselNo').val();
			const counselStart = getTime2();
			let time = getTime()
			console.log(time);
			const data = {
						  type:"enter",
						  msg:memberId, 
						  memberNo:memberNo,
						  counselNo:counselNo,
						  time:time,
						  counselStart:counselStart
						 }; 
			ws.send(JSON.stringify(data)); //data객체를 문자열로 변환해서 웹소켓 서버로 전송
			
			//채팅 입장 시 뜨는 문구, 단 내가 안 읽은 메세지가 있으면 문구 출력 후 메세지 출력
			const pTag = "<p class='check-in'>대화가 시작되었습니다.</p>";
			if($('.read-check').length) {
				$($('.read-check')[0].closest('.chat-content-wrap')).before(pTag); // 첫번째 read-check의 가장 가까운 부모를 찾아 그 전 엘리먼트
				$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight); //appendChat(param) 함수가 동작해야 스크롤이 0으로 고정인데, 이건 appendChat으로 pTag를 넣지 않아서 스크롤 코드 추가
			} else {
				appendChat(pTag);
			}
	
			// appendChat("<p class='check-in'>대화가 시작되었습니다.</p>"); //이전 대화를 html쪽 말고 스크립트 startChat에 가져오는 게 좋았을듯 _조언
			// ajax로 읽음표시 업데이트
			$.ajax({
				url : "updateReadCheck.do",
				data : {
					memberNo: memberNo, 
					counselNo: counselNo
				},
				success : function(data) {
					$('.read-check').text('');
				}
			})
		
		}
		
		/*
		< 읽었다 판단하고 1이 사라지는 경우 >
		case1) 나혼자 있고 메세지 보냈는데 뒤에 누가 들어오는 경우
		    -> 소켓에서 메세지 받을때 type이 enter인 경우로 해결이 됨
	    case2) 둘이 같이 들어와있는 상태로 시작해서 메시지 주고 받을 떄
	        -> 서버에서 알아서 지워서 넘겨줌
        case3) 내가 들어와있는데 상대가 늦게 들어와서 메시지 보내는 경우
            -> case2와 동일하게 처리됨 
		
		*/
		
		
		//서버에서 화면으로 데이터를 전송 시 처리할 함수 
		function receiverMsg(param) {
			const msgData = JSON.parse(param.data); 
			//나말고 누군가가 들어 온 경우
			if(msgData.type === 'enter') {
				$('.read-check').text('');
			
			//채팅인 경우
			}else if(msgData.type === 'chat') {
	 			appendChat(msgData.msg); // 받은 메세지 출력 + 핸들러에서 읽음체크
				// if(msgData.roomMemberCount == 2) {
				//	$('.read-check').text('');
				// }
	 		//상담 시작버튼을 누른 경우	
			}else if(msgData.type === 'countdown') {
				// 인터벌 시작
				appendChat("<p class='check-in'>상담이 시작되었습니다.</p>");
				$('#timeZone').html("<span id='min'>${p.productOption }</span> : <span id='sec'>00</span>");
				intervalId = window.setInterval(function(){
				timeCount();
				},10); //시간초 추후 수정..지금은 테스트라 빠르게
			}
			console.log(param);
		}//채팅도 데이터로 보내주지만, 읽음 여부 등도 데이터로 전송
		
		//웹소켓 연결이 종료되면 실행 되는 함수 
		function endChat() {
			console.log("웹소켓 종료!");
		}
		
		//전송버튼 클릭 시 입력한 메세지를 전송하는 함수
		function sendMsg(){
			const msg = $("#sendMsg").val();
			const memberNo = $("#memberNo").val();
			const counselNo = $('#counselNo').val();
			const counselStart = getTime2();
			let time = getTime()
			if(msg != ''){
				const data = {
					type:"chat",
				  	msg:msg, 
				  	memberNo:memberNo,
				  	counselNo:counselNo,
				  	time:time,
				  	counselStart:counselStart
				};
				ws.send(JSON.stringify(data));
				
				/*ajax 위치가 이상하다는 조언..
				$.ajax({
					url : "updateReadCheck.do",
					data : {
						memberNo: memberNo, 
						counselNo: counselNo
					},
					success : function(data) {
						console.log('성공');
					},
					error : function() {
						console.log('에러');
					}
				})
				*/
				
				
				/* 이렇게 하면 내 채팅은 읽음 처리에 대한 제어가 안돼서 주석처리 후 핸들러에서 제어 
				//appendChat("
						<div class='chat-content-wrap sub-right'>
							<div class='content-sub-wrap'>
								<div class='read-check check-right'>1</div>
								<div class='chat-time'>"+getTime()+"</div>
							</div>
							<div class='chat right'>"+msg+"</div>
						</div>");
				*/
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