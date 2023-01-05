package com.koreait.app.user;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Join_SMS{
	
		public Join_SMS() {
		}
		
		public int send(String userphone) {
			System.out.println("사용자 핸드폰 번호 : " + userphone);
			Random rd = new Random();
			int ranNum = rd.nextInt(9000) + 1000;
			System.out.println(ranNum);
//			String source = "0123456789";
//			int len = source.length();

//			String checkNum = "";
//			for (int i = 0; i < 5; i++) {
//				int idx = rd.nextInt(len);
//				checkNum += source.charAt(idx);
//			}
//			String api_key = "NCSPQX7SOYFDNIWS";
//			String api_secret = "R4RZFA6SKZOSHWMOOPZYCYPXWH5XNEYZ";
//			Message coolsms = new Message(api_key, api_secret);
//
//			// 4 params(to, from, type, text) are mandatory. must be filled
//			HashMap<String, String> params = new HashMap<String, String>();
//			params.put("to", userphone);
//			params.put("from", "01023681890");
//			params.put("type", "SMS");
//			params.put("text", "인증번호는 [" + ranNum + "] 입니다.\n타인에게 인증번호를 알려주지 마세요.");
//			params.put("app_version", "test app 2.2"); // application name and version
//			
//			try {
//				JSONObject obj = (JSONObject) coolsms.send(params);
//				obj.toString();
//			} catch (CoolsmsException e) {
//				System.out.println("Exception : " + e );
//				}
			return ranNum;
				
			}
}

