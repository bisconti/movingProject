package com.koreait.app.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;

public class MovieSubscribeAction implements Action {

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      int movienum = Integer.parseInt(req.getParameter("movienum"));
      
      HttpSession session = req.getSession();
      
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();
      String userid = (String)session.getAttribute("loginUser");
      
      MovieDAO mdao = new MovieDAO();
      if(mdao.movie_Subscribe(movienum,userid)) {
         session.setAttribute("loginUser", userid);
         //<script>
         out.print("<script>");
         //alert('apple님 어서오세요~!');
         out.print("alert('"+userid+"님 구독 감사합니다!~!');");
         //location.href = '????/board/boardlist.bo';
         //</script>
         out.print("</script>");
      }
      else {
         out.print("<script>");
         out.print("alert('구독 실패!!')");
         out.print("</script>");
      }
      return null;
   }

}