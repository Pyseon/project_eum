package kr.or.eum.product.model.service;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class ChatHandler extends TextWebSocketHandler {
	
	@Autowired
	private ProductService productService;

	// 1:1채팅방 : 따로 따로 x 한 번에 관리 필요, 제일 먼저 필요한 건 채팅방 하나고, 채팅방을 리스트화 한 게 필요 이걸 리스트로 만들꺼냐, 맵으로 만들꺼냐
	// 중요한 건 내가 보낸 메세지가 어떤 채팅방에 갈 건지 구분이 필요....참여하고 있는 채팅방이 여러 채팅이 여러개 일 수 있어서 
	
	//우선순위 : 1:1 최적화.
	//이후 : 이게 여러개 됐을 때 어떻게 관리할지.
	
	//접속한 회원
	private HashMap<String, ArrayList<WebSocketSession>> sessionMap;
	private HashMap<WebSocketSession, String> sessionRoom;
	
	//인원체크
	private static int i;

//	LocalTime localTime = LocalTime.now();
//	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
//	String now = localTime.format(formatter);

	public ChatHandler() {
		super();
		this.sessionMap = new HashMap<String, ArrayList<WebSocketSession>>();
		this.sessionRoom = new HashMap<WebSocketSession, String>();
	}
	
	//클라이언트가 웹소캣에 최초로 접속했을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
//		sessionList.add(session);
		System.out.println("새 클라이언트 접속!");
		System.out.println("session : "+ session.getId());
		i++;
	}//afterConnectionEstablished
	
	//클라이언트가 서버로 메세지를 전송하면 수행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//내가 접속하면 이 세션은 내 접속세션..이 매개변수만..
		//여기에도 내가 받았다는 걸 표시......
		
		//System.out.println("메세지 전송한 세션 : "+session);
		System.out.println("전송 메세지 : "+message.getPayload());
		//문자열을 Json 객체로 변환해줄 객체
		JsonParser parser = new JsonParser();
		//parser를 이용해서 String > Json형태로 변화
		JsonElement element = parser.parse(message.getPayload()); //구글
		//키가 type인 값을 추출
		String type = element.getAsJsonObject().get("type").getAsString();
		//키가 msg인 값을 추출
		String msg = element.getAsJsonObject().get("msg").getAsString();
		String memberNo = element.getAsJsonObject().get("memberNo").getAsString();
		String counselNo = element.getAsJsonObject().get("counselNo").getAsString();
		String time = element.getAsJsonObject().get("time").getAsString();
		
		// 상담이 없을 때
		if(!sessionMap.containsKey(counselNo)) {
			sessionMap.put(counselNo, new ArrayList<WebSocketSession>());
		}
		
		
		// 새로 채팅방에 회원이 들어온 경우
		if(type.equals("enter")) {
			System.out.println("---------------");
			System.out.println(counselNo);
			System.out.println("---------------");
			sessionMap.get(counselNo).add(session);
			sessionRoom.put(session, counselNo);
			//System.out.println("readResult : "+readResult);
			
		//채팅메세지를 입력한 경우
		}else if(type.equals("chat")) {//if문으로 이미지 있다 없다, 읽음 표시도 
			//제이슨으로 넘겨줘..........
			String sendMsg ="<div class='chat-content-wrap'><div class='chat left'><span class='chatId'></span>"+msg+"</div><div class='content-sub-wrap'><div class='read-check'>1<div><div class='chat-time'>"+time+"</div></div></div>";
			int result = productService.insertChat(msg, memberNo,counselNo); 
			for(WebSocketSession s : sessionMap.get(counselNo)) {
				if(!s.equals(session)) {
					if(i == 2) {
						sendMsg ="<div class='chat-content-wrap'><div class='chat left'><span class='chatId'></span>"+msg+"</div><div class='content-sub-wrap'><div class='read-check'><div><div class='chat-time'>"+time+"</div></div></div>";
					}else {
						sendMsg ="<div class='chat-content-wrap'><div class='chat left'><span class='chatId'></span>"+msg+"</div><div class='content-sub-wrap'><div class='read-check'>1<div><div class='chat-time'>"+time+"</div></div></div>";
					}
					TextMessage tm = new TextMessage(sendMsg);						
					int readResult = productService.updateReadCheck(counselNo, memberNo);
					//나 외에 다른 사람이 있다 없다 체크
					//DB에 보내는 것과 사용자가 접속해 있어서 메세지를 보내주는 것을 따로따로 생각하기
					//insert는 읽음 여부와 관계없이
					//상대방에게 전송까지 하는 건 접속여부 (읽음 여부)에 따라....
					s.sendMessage(tm); // 읽었다는 걸 내 자신에게 알려줘야 함.....
				}//if문
			}//for문
		}//else if(type.chat)
	}//handleTextMessage
		
	//클라이언트와 연결이 끊겼을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		i--;
		String counselNo = sessionRoom.get(session);
		ArrayList<WebSocketSession> sessionList = sessionMap.get(counselNo);
		sessionList.remove(session);
		sessionRoom.remove(session);
		
		if(sessionList.isEmpty()) {
			sessionMap.remove(counselNo);
		}
		
		//String sendMsg = "<p'>새로고침으로 세션 연결 끊김.</p>"; //나중에 삭제
		//TextMessage tm = new TextMessage(sendMsg);
		//for(WebSocketSession s : sessionList) {
			//s.sendMessage(tm); 
		//}
	}//afterConnectionClosed
	
}//ChatHandler 
