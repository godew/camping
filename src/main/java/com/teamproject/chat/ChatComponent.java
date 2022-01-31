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
    private HashMap<String, String> btnMsg = new HashMap<>();
    
    private HashMap<String, String> maStore = new HashMap<>();
    
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	String username = session.getUri().toString().split("username=")[1];
        
        if (username.equals("manager@naver.com")) {
        	for (String s : sessionList.keySet()) {
        		if (maStore.containsKey(s)) {
    	        	session.sendMessage(new TextMessage(maStore.get(s)));
        		}
        	}
        } else {
	        if (store.containsKey(username)) {
	        	session.sendMessage(new TextMessage(store.get(username)));
	    		session.sendMessage(new TextMessage(btnMsg.get(username)));
	        }
        }
        
        sessionList.put(username, session);
    }
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	JSONParser jsonParser = new JSONParser();
        Object obj = jsonParser.parse(message.getPayload());
        JSONObject jsonObj = (JSONObject) obj;

    	if (jsonObj.containsKey("status")) { // unload event
    		if (jsonObj.get("me").toString().equals("manager@naver.com")) { // 관리자는 객체로 옴
            	JSONObject jsonTmp = (JSONObject) jsonParser.parse(jsonObj.get("store").toString());
            	for(Object o : jsonTmp.keySet()) {
            		maStore.put(o.toString(), jsonTmp.get(o.toString()).toString());
            	}
    		} else { // user는 String html 그대로 저장
        		store.put(jsonObj.get("me").toString(), jsonObj.get("store").toString());	
    		}
    		if (jsonObj.containsKey("bottomMsgBtn")) { // user btn 이름 저장
    			btnMsg.put(jsonObj.get("me").toString(), jsonObj.get("bottomMsgBtn").toString());
    		}
    	} else { // msg send event
	        for(WebSocketSession wss : sessionList.values()){ // target 찾아서 메시지 전송
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