package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class UpdatePwAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      UserDAO udao = new UserDAO();
      String userid = req.getParameter("userid");
      String userpw = req.getParameter("userpw_re");
      System.out.println(userid);
      System.out.println(userpw);
      System.out.println("확인");
      
      PrintWriter out = resp.getWriter();
      
      System.out.println("체크");
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(true);
      if(udao.updatePw(userid, userpw)) {
      System.out.println("체크22");
      out.print("<script>");
      out.print("alert('비밀번호 변경 완료');");
      out.print("location.href='"+ req.getContextPath()+"/user/userlogin.us';");
      out.print("</script>");
      } 
      else {
         out.print("<script>");
         out.print("alert('비밀번호 변경 실패');");
         out.print("location.href='"+ req.getContextPath()+"/user/userlogin.us';");
         out.print("</script>");
      }
      return null;
   }
}