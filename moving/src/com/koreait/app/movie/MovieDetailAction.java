package com.koreait.app.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class MovieDetailAction implements Action{
   
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	  HttpSession session = req.getSession();
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
      
      String userid = (String)session.getAttribute("loginUser");
      int movienum = Integer.parseInt(req.getParameter("movienum"));
      
      //좋아요 찜 관련
      int wish = mdao.wish(movienum,userid);
      int like = mdao.like(userid, movienum);
      req.setAttribute("wish", wish);
      req.setAttribute("like", like);
      
      
      List<MovieDTO> movies =  mdao.getSimilar(movienum);
      //하단 유사 장르 영화 10개 갖고 오는 파트
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
    
      //영화 상세 메소드(제목, 줄거리, 조회수 등등..)
      movieList = mdao.getDetail(movienum);
      //조회수 +1
      mdao.plusView(movienum);
      //watched 테이블에 기존 데이터 삭제
      mdao.removeWatch(movienum,userid);
      //watched 테이블에 데이터 추가
      mdao.plusWatch(movienum,userid);
      //하단 같은 장르 영화 10개
      String moviefilm = mdao.getmovie(movienum);
      req.setAttribute("moviefilm", moviefilm);
      req.setAttribute("movieList", movieList);
      
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/movie/MovieDetailView.jsp");
      return transfer;
   }
}