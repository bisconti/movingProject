package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class UserPhoneCheckAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		String check_num = req.getParameter("check_num");
		String userphone = req.getParameter("userphone");
		user.setUserphone(userphone);
		
		ActionTo transfer = new ActionTo();
		PrintWriter out = resp.getWriter();
		
		new Join_SMS(userphone, check_num);
		if(Join_SMS.join) {
			out.print("<script>");
			out.print("인증번호가 발송되었습니다. 확인해주세요.");
			out.print("</script>");
		}
		return null;
	}
}
