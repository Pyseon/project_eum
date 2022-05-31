package kr.or.eum.product.controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatController extends TextWebSocketHandler {
	//클라이언트가 웹소캣에 최초로 접속했을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("새 클라이언트 접속!");
	}
	//클라이언트가 서버로 메세지를 전송하면 수행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
	}
	//클라이언트와 연결이 끊겼을 때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}
	
}
