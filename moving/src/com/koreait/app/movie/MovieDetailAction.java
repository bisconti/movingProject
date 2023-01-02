package com.koreait.app.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class MovieDetailAction implements Action{
   
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      //데이터수집 -> 처리 -> 결과전송
      MovieDAO mdao = new MovieDAO();
      MovieDTO movieList = new MovieDTO();
      
      MovieDTO movie1 = new MovieDTO();
      MovieDTO movie2 = new MovieDTO();
      MovieDTO movie3 = new MovieDTO();
      MovieDTO movie4 = new MovieDTO();
      MovieDTO movie5 = new MovieDTO();
      MovieDTO movie6 = new MovieDTO();
      MovieDTO movie7 = new MovieDTO();
      MovieDTO movie8 = new MovieDTO();
      MovieDTO movie9 = new MovieDTO();
      MovieDTO movie10 = new MovieDTO();
      
      
      
      
      int movienum = Integer.parseInt(req.getParameter("movienum"));
      
      movieList = mdao.getDetail(movienum);
      
      req.setAttribute("movieList", movieList);
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/movie/MovieDetailView.jsp");
      return transfer;
   }
}