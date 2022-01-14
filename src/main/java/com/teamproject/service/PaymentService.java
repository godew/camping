package com.teamproject.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Service;

import lombok.Getter;

@Service
public class PaymentService {

	public String ready() throws IOException {
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 628b337872b9aa94ae7e402a0c08fd3e");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
		String param = "cid=TC0ONETIME&"
					 + "partner_order_id=partner_order_id&"
					 + "partner_user_id=partner_user_id&"
					 + "item_name=test&"
					 + "quantity=1&"
					 + "total_amount=110&"
					 + "vat_amount=10&"
					 + "tax_free_amount=0&"
					 + "approval_url=http://localhost:8080/camping/payment/approve&"
					 + "fail_url=http://localhost:8080/camping/payment/close&"
					 + "cancel_url=http://localhost:8080/camping/payment/close";
				
		OutputStream os = conn.getOutputStream();
		DataOutputStream dos = new DataOutputStream(os);
		dos.writeBytes(param);
		dos.close(); // flush + close
		
		int res = conn.getResponseCode();
		InputStream is;
		if (res == 200) {
			is = conn.getInputStream();
		} else {
			is = conn.getErrorStream();
		}
		
		InputStreamReader isr = new InputStreamReader(is); 
		BufferedReader br = new BufferedReader(isr); // 형변환
		String s = br.readLine();
		conn.disconnect();
		
		return s;
	}

	public String approve(String tid, String pg_token) throws IOException {
		URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 628b337872b9aa94ae7e402a0c08fd3e");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
		String param = "cid=TC0ONETIME&"
					 + "tid=" + tid + "&"
					 + "partner_user_id=partner_user_id&"
					 + "partner_order_id=partner_order_id&"
					 + "pg_token=" + pg_token;
				
		OutputStream os = conn.getOutputStream();
		DataOutputStream dos = new DataOutputStream(os);
		dos.writeBytes(param);
		dos.close(); // flush + close
		
		int res = conn.getResponseCode();
		InputStream is;
		if (res == 200) {
			is = conn.getInputStream();
		} else {
			is = conn.getErrorStream();
		}
		
		InputStreamReader isr = new InputStreamReader(is); 
		BufferedReader br = new BufferedReader(isr); // 형변환
		String s = br.readLine();
		conn.disconnect();
		
		return s;
	}

	public String cancel(String tid) throws IOException {
		URL url = new URL("https://kapi.kakao.com/v1/payment/cancel");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 628b337872b9aa94ae7e402a0c08fd3e");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
		String param = "cid=TC0ONETIME&"
					 + "tid=" + tid + "&"
					 + "cancel_amount=110&"
					 + "cancel_tax_free_amount=0";
				
		OutputStream os = conn.getOutputStream();
		DataOutputStream dos = new DataOutputStream(os);
		dos.writeBytes(param);
		dos.close(); // flush + close
		
		int res = conn.getResponseCode();
		InputStream is;
		if (res == 200) {
			is = conn.getInputStream();
		} else {
			is = conn.getErrorStream();
		}
		
		InputStreamReader isr = new InputStreamReader(is); 
		BufferedReader br = new BufferedReader(isr); // 형변환
		String s = br.readLine();
		conn.disconnect();
		
		return s;
	}
}
