package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class ChangephoneAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      
      UserDAO udao = new UserDAO();
      HttpSession session = req.getSession();
       resp.setCharacterEncoding("UTF-8");
       resp.setContentType("text/html; charset=utf-8");
       PrintWriter out = resp.getWriter();
      
      String userphone = req.getParameter("userphone");
      String userid = (String) session.getAttribute("loginUser");
      
      if(udao.chagephone(userid, userphone)) {
            out.print("<script>");
            out.print("alert('휴대번호 변경 완료');");
            out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
            out.print("</script>");
      }
         out.print("<script>");
         out.print("alert('휴대번호 변경 실패!');");
         out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
         out.print("</script>");
      return null;
   }
}