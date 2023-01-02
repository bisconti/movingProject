package com.koreait.app.movie;

import java.util.List;

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
      
      List<MovieDTO> movies =  mdao.getSimilar(movienum);
      movie1 = movies.get(0);
      movie2 = movies.get(1);
      movie3 = movies.get(2);
      movie4 = movies.get(3);
      movie5 = movies.get(4);
      movie6 = movies.get(5);
      movie7 = movies.get(6);
      movie8 = movies.get(7);
      movie9 = movies.get(8);
      movie10 = movies.get(9);
      
      req.setAttribute("movie1", movie1);
      req.setAttribute("movie2", movie2);
      req.setAttribute("movie3", movie3);
      req.setAttribute("movie4", movie4);
      req.setAttribute("movie5", movie5);
      req.setAttribute("movie6", movie6);
      req.setAttribute("movie7", movie7);
      req.setAttribute("movie8", movie8);
      req.setAttribute("movie9", movie9);
      req.setAttribute("movie10", movie10);
    
      movieList = mdao.getDetail(movienum);
      
      
      String moviefilm = mdao.getmovie(movienum);
      req.setAttribute("moviefilm", moviefilm);
      req.setAttribute("movieList", movieList);
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/movie/MovieDetailView.jsp");
      return transfer;
   }
}