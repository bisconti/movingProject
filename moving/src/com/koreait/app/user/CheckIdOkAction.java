package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class CheckIdOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		
		if(udao.checkId(userid)) {
			out.write("O");
		}
		else {
			out.write("X");
		}
		out.close();
		
		return null;
	}
	
}
