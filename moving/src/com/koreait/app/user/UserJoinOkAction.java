package com.koreait.app.user;

import java.io.PrintWriter;

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
     resp.setCharacterEncoding("UTF-8");
     resp.setContentType("text/html; charset=utf-8");
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      
      String userid = req.getParameter("userid");
      String username = req.getParameter("username");
      String userphone = req.getParameter("userphone");
      
      user.setUserid(userid);
      user.setUserpw(req.getParameter("userpw"));
      user.setUsername(username);
      user.setUsergender(req.getParameter("usergender"));
      user.setZipcode(req.getParameter("zipcode"));
      user.setUseraddr(req.getParameter("useraddr"));
      user.setUseraddrdetail(req.getParameter("useraddrdetail"));
      user.setUseraddretc(req.getParameter("useraddretc"));
      user.setUserbirth(String.join("-", req.getParameterValues("userbirth")));
      user.setUserphone(userphone);
      
      
      
      System.out.println("INFO:user객체 - "+user);
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(true);
      PrintWriter out = resp.getWriter();
      if(udao.join(user)) {
         out.print("<script>");
         out.print("alert('회원가입이 완료되었습니다 !');");
         out.print("location.href='"+ req.getContextPath()+"/user/userlogin.us';");
         out.print("</script>");
         
//         }
      }
      else {
         out.print("<script>location.href='"+ req.getContextPath()+"/';</script>");
      }
      return null;
   }
}








