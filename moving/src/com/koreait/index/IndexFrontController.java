package com.koreait.index;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;
import com.koreait.app.movie.MostFastMovieAction;

public class IndexFrontController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//흐름 나누기
		String requestURI = req.getRequestURI();// ???????/user/userjoin.us
		String contextPath = req.getContextPath();// ??????(web_module명)
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionTo transfer = null;
		
		switch(command) {
		case "/home.ho":
			try {
				transfer = new MostFastMovieAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN: MostFast: "+e);
			}
			break;
		}
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				//Redirect 방식
				resp.sendRedirect(transfer.getPath());
			}
			else {
				//Forward 방식
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
