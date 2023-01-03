package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;

public class CheckNumberOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userphone = req.getParameter("userphone");
		
		new Join_SMS(userphone);
		String checkNum = req.getParameter("checkNum");
		req.setAttribute("checkNum", checkNum);
		return null;
	}
}
