package com.teamproject.chat;

import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatComponent extends TextWebSocketHandler {
    private HashMap<String, WebSocketSession> sessionList = new HashMap<>();

	@Override // 연결이 성립되면(접속이 유지되면) 호출되는 함수
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	String username = session.getUri().toString().split("username=")[1];
        sessionList.put(username, session);
    }
 
    @Override // 메세지를 받으면 서버가 수행하는 메서드
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
        for(WebSocketSession wss : sessionList.values()){
        	if (sessionList.get(message.getPayload().split("\"")[7]) == wss) {        		
        		wss.sendMessage(new TextMessage(message.getPayload()));
        		break;
        	}
        }
    }
 
    @Override // 연결이 종료되면 수행하는 메서드
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String username = session.getUri().toString().split("username=")[1];
    	sessionList.remove(username);
    }

	public HashMap<String, WebSocketSession> getSessionList() {
		return sessionList;
	}
}
