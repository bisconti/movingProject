package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class UpdatePwAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      String userid = req.getParameter("userid");
      String userphone = req.getParameter("userphone");
      String userpw = req.getParameter("userpw_re");
      System.out.println(userid);
      System.out.println(userpw);
      System.out.println("확인");
      
      PrintWriter out = resp.getWriter();
      
      System.out.println("체크");
      ActionTo transfer = new ActionTo();
      if(udao.updatePw(userid, userpw)) {
      System.out.println("체크22");
      out.write("<script>");
      out.write("alert('비밀번호 변경 완료');");
//      out.write("location.href='"+ req.getContextPath()+"/user/login.us';");
      out.write("</script>");
      transfer.setRedirect(true);
      transfer.setPath(req.getContextPath()+"/user/userlogin.us");
         
      } 
      else {
//         System.out.println("체크");
         out.write("<script>");
         out.write("alert('비밀번호 변경 실패');");
//         out.write("location.href='"+ req.getContextPath()+"/user/login.us';");
         out.write("</script>");
         transfer.setPath(req.getContextPath()+"/user/userlogin.us");
      }
      return transfer;
   }
}