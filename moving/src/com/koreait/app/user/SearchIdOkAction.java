package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class SearchIdOkAction implements Action {
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
     resp.setCharacterEncoding("UTF-8");
     resp.setContentType("text/html; charset=utf-8");
     System.out.println("체크");
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      String username = req.getParameter("username");
      String userphone = req.getParameter("userphone");

      user.setUsername(username);
      user.setUserphone(userphone);

      System.out.println(user);
      
     
      String userid = udao.searchId(userphone);
      if(userid == null) {
        PrintWriter out = resp.getWriter();
         out.print("<script>");
         out.print("alert('정보가 올바르지 않습니다.!');");
         out.print("location.href='"+ req.getContextPath()+"/user/searchid.us';");
         out.print("</script>");
         return null;
         
      } else {
        ActionTo transfer = new ActionTo();
         transfer.setRedirect(false);
         System.out.println(udao.searchId(userphone));
         req.setAttribute("userid", userid);
         req.setAttribute("username", username);
         System.out.println("userid : " + userid);
         transfer.setRedirect(false);
         transfer.setPath("/app/user/SearchIdCorrect.jsp");
         
         return transfer;
      }
      
   }
}