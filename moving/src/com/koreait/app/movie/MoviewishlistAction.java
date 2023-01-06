package com.koreait.app.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class MoviewishlistAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      MovieDAO mdao = new MovieDAO();
      String userid = req.getParameter("userid");
      List<MovieDTO> movielist = mdao.Moviewishlist(userid);
      
      
      
      
      req.setAttribute("movieList", movielist);
      req.setAttribute("userid", userid);
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/movie/WishListView.jsp");
      return transfer;
   }

}