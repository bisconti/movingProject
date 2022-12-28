package com.koreait.app.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;

public class MostFastMovieAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MovieDAO mdao = new MovieDAO();
		for (int i = 0; i < 10; i++) {
			int result = i;
			
			String[] mostfast = new String[9];
			mostfast[result] = mdao.MostFast(result);
			
			String[] watched = new String[9];
			watched = mdao.Watched(result);
			
			String[] mostview = new String[9];
			mostview = mdao.MostView(result);
			
			String[] mostlike = new String[9];
			mostlike = mdao.MostLike(result);
			
			
		}
			String[][] total = new String[3][9];
			total[0] = mostfast;
			total[1] = watched;
			total[2] = mostview;
			total[3] = mostlike;
		
		
		return null;
	}
	
}
