package com.koreait.app.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class UserJoinOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//데이터수집 -> 처리 -> 결과전송
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		String userid = req.getParameter("userid");
		
		user.setUserid(userid);
		user.setUserpw(req.getParameter("userpw"));
		user.setUsername(req.getParameter("username"));
		user.setUsergender(req.getParameter("usergender"));
		user.setZipcode(req.getParameter("zipcode"));
		user.setUseraddr(req.getParameter("useraddr"));
		user.setUseraddrdetail(req.getParameter("useraddrdetail"));
		user.setUseraddretc(req.getParameter("useraddretc"));
		user.setUserbirth(String.join("-", req.getParameterValues("userbirth")));;
		user.setUserphone(req.getParameter("userphone"));
		
		System.out.println("INFO:user객체 - "+user);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(udao.join(user)) {
			Cookie cookie = new Cookie("joinid", userid);
			resp.addCookie(cookie);
			transfer.setPath(req.getContextPath()+"/user/userlogin.us");
		}
		else {
			//localhost:9090/????
			transfer.setPath(req.getContextPath());
		}
		return transfer;
	}
}










