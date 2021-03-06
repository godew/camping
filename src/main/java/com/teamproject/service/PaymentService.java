package com.teamproject.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class PaymentService {

	public String ready(String itemName, int orderPrice, String serverName) throws IOException {
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 628b337872b9aa94ae7e402a0c08fd3e");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
        String tmp = null;
        try {
            tmp = URLEncoder.encode(itemName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        if (serverName.equals("localhost")) {
        	serverName = "http://localhost:8080/camping";
        } else {
        	serverName = "http://" + serverName;
        }
		String param = "cid=TC0ONETIME&"
					 + "partner_order_id=partner_order_id&"
					 + "partner_user_id=partner_user_id&"
					 + "item_name=" + tmp + "&"
					 + "quantity=1&"
					 + "total_amount=" + orderPrice + "&"
					 + "vat_amount=10&"
					 + "tax_free_amount=0&"
					 + "approval_url=" + serverName + "/payment/approve&"
					 + "fail_url=" + serverName +"/payment/close&"
					 + "cancel_url=" + serverName + "/payment/close";
				
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
		BufferedReader br = new BufferedReader(isr); // ?????????
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
		BufferedReader br = new BufferedReader(isr); // ?????????
		String s = br.readLine();
		conn.disconnect();
		
		return s;
	}

	public String cancel(String tid, int orderPrice) throws IOException {
		URL url = new URL("https://kapi.kakao.com/v1/payment/cancel");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 628b337872b9aa94ae7e402a0c08fd3e");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
		String param = "cid=TC0ONETIME&"
					 + "tid=" + tid + "&"
					 + "cancel_amount="+ orderPrice + "&"
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
		BufferedReader br = new BufferedReader(isr); // ?????????
		String s = br.readLine();
		conn.disconnect();
		
		return s;
	}
}
