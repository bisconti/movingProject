package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class ChangeaddrAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      
      
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      HttpSession session = req.getSession();
       resp.setCharacterEncoding("UTF-8");
       resp.setContentType("text/html; charset=utf-8");
       PrintWriter out = resp.getWriter();
       
      
       user.setUserid((String) session.getAttribute("loginUser"));
       user.setZipcode(req.getParameter("zipcode"));
       user.setUseraddr(req.getParameter("useraddr"));
       user.setUseraddrdetail(req.getParameter("useraddrdetail"));
       user.setUseraddretc(req.getParameter("useraddretc"));
      
      
       System.out.println(user);
      
      
      if(udao.changeaddr(user)){
            out.print("<script>");
            out.print("alert('주소 변경 완료');");
            out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
            out.print("</script>");
      }
         out.print("<script>");
         out.print("alert('주소 변경 실패!');");
         out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
         out.print("</script>");
      
      return null;
   }

}