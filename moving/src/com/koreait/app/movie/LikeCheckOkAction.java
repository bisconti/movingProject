package com.koreait.app.movie;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;

public class LikeCheckOkAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      HttpSession session = req.getSession();
      String userid = (String)session.getAttribute("loginUser");
      int movienum= Integer.parseInt(req.getParameter("movienum"));
      MovieDAO md = new MovieDAO();
      PrintWriter out = resp.getWriter();

      if(md.checklike(userid,movienum)) {
         md.likelist(userid, movienum);
         out.write("O");
      }
      else {
         md.deletelike(userid, movienum);
         out.write("X");
      }
      out.close();
      
      return null;
   }
}

