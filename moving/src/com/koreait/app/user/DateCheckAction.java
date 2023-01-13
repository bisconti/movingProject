package com.koreait.app.user;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class DateCheckAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	HttpSession session = req.getSession();
		
	String userid = (String)session.getAttribute("loginUser");
	
	UserDAO udao = new UserDAO();
	PrintWriter out = resp.getWriter();
	Date today = new Date();
	int result = today.compareTo(udao.checkSubscribe(userid));
	if (result < 0) {
		out.write("O");
	}
	else if(result > 0){
		out.write("X");
	}
	out.close();
		
	return null;
	}
}
