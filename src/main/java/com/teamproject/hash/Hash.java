package com.teamproject.hash;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class Hash {

	public String getHash(String input) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.reset();
			messageDigest.update(input.getBytes("utf-8"));
			String hashNumber = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			return hashNumber;
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
