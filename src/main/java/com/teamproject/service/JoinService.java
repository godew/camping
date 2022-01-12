package com.teamproject.service;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class JoinService {
	
	public String getAuthNumber() {
		Random r = new Random();
		String authNumber = "";
		for(int i = 0; i < 6; i++) {
			authNumber += r.nextInt(10);
		}
		return authNumber;
	}

	public boolean sendMsg(String pnum, String authNum) {

		String api_key = "NCSHNPSBOU0PSBNF";
		String api_secret = "LFWF8YYEDAQHWJVGWHUIIJSLI1CRE1BG";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", pnum);
		params.put("from", "01044154528");
		params.put("type", "SMS");
		params.put("text", "AfterCamp 가입 인증 번호 : [ " + authNum + " ]");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			return true;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return false;
	}
	
	

}