package com.koreait.app.movie;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;


public class WishCheckOkAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      HttpSession session = req.getSession();
      int movienum= Integer.parseInt(req.getParameter("movienum"));
      
      String userid = (String)session.getAttribute("loginUser");
      System.out.println(userid);
      System.out.println(movienum);
      MovieDAO md = new MovieDAO();
      PrintWriter out = resp.getWriter();
      System.out.println("여기 옴");
      
      if(md.checkwish(userid,movienum)) {
         System.out.println("O");
         md.wishlist(userid, movienum);
         System.out.println("씨발");
         out.write("O");
      }
      else {
         System.out.println("X");
         md.deletewish(userid, movienum);
         System.out.println("씨발");
         out.write("X");
      }
      out.close();
      System.out.println("지랄마...");
      
      return null;
   }
}