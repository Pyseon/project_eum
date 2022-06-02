package kr.or.eum.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class ChatController extends TextWebSocketHandler {
	
//	//채팅방목록
//	private ArrayList<String> chatList;
	//접속한 회원
	private ArrayList<WebSocketSession> sessionList;
	//채팅방 별 아이디를 저장할 map
	private HashMap<WebSocketSession, String> memberList;
	
	
	
	public ChatController() {
		super();
		//this.chatList = new ;
		this.sessionList = new ArrayList<WebSocketSession>();
		this.memberList = new HashMap<WebSocketSession, String>();
	}
	
	//클라이언트가 웹소캣에 최초로 접속했을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		System.out.println("새 클라이언트 접속!");
		System.out.println("session : "+session);
	}
	
	//클라이언트가 서버로 메세지를 전송하면 수행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
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
		if(type.equals("enter")) { // 새로 채팅방에 회원이 들어온 경우
			memberList.put(session,msg);
			
		}else if(type.equals("chat")) {//채팅메세지를 입력한 경우
			String sendMsg ="<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span>"+msg+"</div>";
			for(WebSocketSession s : sessionList) {
				if(!s.equals(session)) {
					TextMessage tm = new TextMessage(sendMsg);
					s.sendMessage(tm);
				}
			}
		}
	}
		
	//클라이언트와 연결이 끊겼을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//접속종료 시 종료된 세션을 list에서 제거

	}
	
}
