package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;

public class CheckNumberAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("여긴왔니?");
		String userphone = req.getParameter("userphone");
		Join_SMS sms = new Join_SMS();
		int checkNum = sms.send(userphone);
		System.out.println(checkNum);
		PrintWriter out = resp.getWriter();
		out.print(checkNum);
		return null;
	}
}
