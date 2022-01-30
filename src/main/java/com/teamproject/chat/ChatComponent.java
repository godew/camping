package com.teamproject.chat;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatComponent extends TextWebSocketHandler {
	
    private HashMap<String, WebSocketSession> sessionList = new HashMap<>();
    private HashMap<String, String> store = new HashMap<>();
    
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	String username = session.getUri().toString().split("username=")[1];
        sessionList.put(username, session);
        if (store.containsKey(username)) {
        	session.sendMessage(new TextMessage(store.get(username)));
        }
    }
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	JSONParser jsonParser = new JSONParser();
        Object obj = jsonParser.parse(message.getPayload());
        JSONObject jsonObj = (JSONObject) obj;
        
    	if (jsonObj.containsKey("status")) {
    		store.put(jsonObj.get("me").toString(), jsonObj.get("store").toString());
    	} else {
	        for(WebSocketSession wss : sessionList.values()){
	        	if (sessionList.get(jsonObj.get("target").toString()) == wss) {  
	        		wss.sendMessage(new TextMessage(message.getPayload()));
	        		break;
	        	}
	        }
    	}
    }
 
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String username = session.getUri().toString().split("username=")[1];
    	sessionList.remove(username);
    }

	public HashMap<String, WebSocketSession> getSessionList() {
		return sessionList;
	}
}