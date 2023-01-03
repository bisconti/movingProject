package com.koreait.app.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import com.koreait.dao.UserDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Join_SMS {
	public static boolean join = false;
	//회원가입 생성자
	public Join_SMS(String userphone, String check_number) {
		UserDAO md = new UserDAO();
		Random rd = new Random();
		int ranNum = rd.nextInt(9000) + 1000;
		String source = "0123456789";
		int len = source.length();

		String randNum = "";
		for (int i = 0; i < 5; i++) {
			int idx = rd.nextInt(len);
			randNum += source.charAt(idx);
		}
		String api_key = "NCSPQX7SOYFDNIWS";
		String api_secret = "R4RZFA6SKZOSHWMOOPZYCYPXWH5XNEYZ";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userphone);
		params.put("from", "01023681890");
		params.put("type", "SMS");
		params.put("text", "인증번호는 [" + randNum + "] 입니다.\n타인에게 인증번호를 알려주지 마세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			obj.toString();
			if (randNum.equals(check_number)) {
				join = true;
			} else {
				join = false;
			}
		} catch (CoolsmsException e) {
		}
	}
}
