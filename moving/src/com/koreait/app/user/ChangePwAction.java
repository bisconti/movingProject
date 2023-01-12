package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class ChangePwAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      UserDTO udto = new UserDTO();
      UserDAO udao = new UserDAO();
      
       resp.setCharacterEncoding("UTF-8");
       resp.setContentType("text/html; charset=utf-8");
       PrintWriter out = resp.getWriter();
      
       HttpSession session = req.getSession();
      String userpw = req.getParameter("userpw");
      String changeuserpw = req.getParameter("changeuserpw");
      String userid = (String) session.getAttribute("loginUser");
      String userpw1 = (String)session.getAttribute("userpw");
      udto = (UserDTO)session.getAttribute("User");
      
      
      if(userpw1.equals(userpw)) {
         if(udao.changepw(userid, changeuserpw)) {
               out.print("<script>");
               out.print("alert('비밀번호 변경 완료');");
               out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
               out.print("</script>");
         }
            out.print("<script>");
            out.print("alert('비밀번호 변경 실패!');");
            out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
            out.print("</script>");
      }
         out.print("<script>");
         out.print("alert('현재 비밀번호가 다르네요?? 다시 확인해주세요ㅎ');");
         out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
         out.print("</script>");
      
         return null;
   }

}