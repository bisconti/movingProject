package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class AddPhotoAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("loginUser"); 
		String userphoto = req.getParameter("userphoto");
		
		if (udao.addPhoto(userid,userphoto)) {
			out.print("<script>");
			out.print("alert('프로필 사진이 성공적으로 변경되었습니다.')");
			out.print("location.href='"+ req.getContextPath()+"/';");
			out.print("<script>");
		}
        else {
            out.print("<script>");
            out.print("alert('프로필 사진 변경에 실패하였습니다.');");
            out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
            out.print("</script>");
         }
		return null;
	}
}
