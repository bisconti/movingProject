package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class SearchIdOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("체크");
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");

		user.setUsername(username);
		user.setUserphone(userphone);

		System.out.println(user);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8"); 

		String userid = udao.searchId(userphone);
		System.out.println(udao.searchId(userphone));
		req.setAttribute("userid", userid);
		req.setAttribute("username", username);
		System.out.println("userid : " + userid);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/user/SearchIdCorrect.jsp");
		return transfer;
		
	}
}
