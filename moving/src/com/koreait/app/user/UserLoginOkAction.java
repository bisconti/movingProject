package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.UserDTO;

public class UserLoginOkAction implements Action {
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String userid = req.getParameter("userid");
      String userpw = req.getParameter("userpw");
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      
      HttpSession session = req.getSession();
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();
  
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      String manager = "manager";
      if(manager.equals(userid)) {
          out.print("<script>");
          out.print("alert('어서오세요 준민 대표님^^7');");
          out.print("location.href='"+ req.getContextPath()+"/user/manager.us';");
          out.print("</script>");
       }
      else{
         if(udao.login(userid,userpw)) {
           user = udao.getLoginUser(userid);
           System.out.println("user : " + user);
           session.setAttribute("User", user);
           session.setAttribute("loginUser", userid);
           session.setAttribute("userphoto", user.getUserphoto());
           System.out.println(user.getUserphoto());
            String userbirth = user.getUserbirth();
            int age = udao.getUserAge(userbirth);
            System.out.println(age);
            
            session.setAttribute("age", age);
            //<script>
            out.print("<script>");
            //alert('apple님 어서오세요~!');
            out.print("alert('"+userid+"님 어서오세요~!');");
            //location.href = '????/board/boardlist.bo';
            out.print("location.href='"+ req.getContextPath()+"/';");
            //</script>
            out.print("</script>");
         }
         else {
            out.print("<script>");
             out.print("alert('로그인 실패!');");
             out.print("location.href='"+ req.getContextPath()+"/user/userlogin.us';");
             out.print("</script>");
         }
      }
      return null;
   }
}