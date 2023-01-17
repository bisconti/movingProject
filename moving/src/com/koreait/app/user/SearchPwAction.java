package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class SearchPwAction implements Action {
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      String userid = req.getParameter("userid");
      String userphone = req.getParameter("userphone");
      UserDAO udao = new UserDAO();
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      
      if (udao.pwchangechk(userid, userphone)) {
         req.setAttribute("userid", userid);
         transfer.setPath("/app/user/SearchPwCorrect.jsp");
         return transfer;
      } else {
         PrintWriter out = resp.getWriter();
         out.print("<script>");
         out.print("alert('정보가 올바르지 않습니다.!');");
         out.print("location.href='" + req.getContextPath() + "/user/searchpw.us';");
         out.print("</script>");
         return null;
      }

   }
}