package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class SearchPwAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		String userid = req.getParameter("userid");
		String userphone = req.getParameter("userphone");
		
		user.setUserid(userid);
//		페이지 먼저 이동시키고
//		update
		
		
		
		return null;
	}
}
