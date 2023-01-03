package com.koreait.app.movie;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class MoviesearchAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MovieDAO mdao = new MovieDAO();
		String ms = req.getParameter("ms");
		List<MovieDTO> movielist = mdao.searchmovieList(ms);
		
		req.setAttribute("movieList", movielist);
		req.setAttribute("ms", ms);
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/movie/moviesearchview.jsp");
		return transfer;
	}

}