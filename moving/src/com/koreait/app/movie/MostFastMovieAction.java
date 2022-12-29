package com.koreait.app.movie;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class MostFastMovieAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MovieDAO mdao = new MovieDAO();
		MovieDTO movie = new MovieDTO();

		
		movie = mdao.MostFast();
		System.out.println(movie);

		
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/index.jsp");
		return transfer;
	}
}
