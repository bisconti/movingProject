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
		
		MovieDTO movie11 = new MovieDTO();
		MovieDTO movie12 = new MovieDTO();
		MovieDTO movie13 = new MovieDTO();
		MovieDTO movie14 = new MovieDTO();
		MovieDTO movie15 = new MovieDTO();
		MovieDTO movie16 = new MovieDTO();
		MovieDTO movie17 = new MovieDTO();
		MovieDTO movie18 = new MovieDTO();
		MovieDTO movie19 = new MovieDTO();
		MovieDTO movie20 = new MovieDTO();
		
		MovieDTO movie21 = new MovieDTO();
		MovieDTO movie22 = new MovieDTO();
		MovieDTO movie23 = new MovieDTO();
		MovieDTO movie24 = new MovieDTO();
		MovieDTO movie25 = new MovieDTO();
		MovieDTO movie26 = new MovieDTO();
		MovieDTO movie27 = new MovieDTO();
		MovieDTO movie28 = new MovieDTO();
		MovieDTO movie29 = new MovieDTO();
		MovieDTO movie30 = new MovieDTO();
		
		MovieDTO movie31 = new MovieDTO();
		MovieDTO movie32 = new MovieDTO();
		MovieDTO movie33 = new MovieDTO();
		MovieDTO movie34 = new MovieDTO();
		MovieDTO movie35 = new MovieDTO();
		MovieDTO movie36 = new MovieDTO();
		MovieDTO movie37 = new MovieDTO();
		MovieDTO movie38 = new MovieDTO();
		MovieDTO movie39 = new MovieDTO();
		MovieDTO movie40 = new MovieDTO();
		
		 movie1 = mdao.MostFast(0);
		 movie2 = mdao.MostFast(1);
		 movie3 = mdao.MostFast(2);
		 movie4 = mdao.MostFast(3);
		 movie5 = mdao.MostFast(4);
		 movie6 = mdao.MostFast(5);
		 movie7 = mdao.MostFast(6);
		 movie8 = mdao.MostFast(7);
		 movie9 = mdao.MostFast(8);
		 movie10 = mdao.MostFast(9);
		 
		 movie11 = mdao.MostView(0);
		 movie12 = mdao.MostView(1);
		 movie13 = mdao.MostView(2);
		 movie14 = mdao.MostView(3);
		 movie15 = mdao.MostView(4);
		 movie16 = mdao.MostView(5);
		 movie17 = mdao.MostView(6);
		 movie18 = mdao.MostView(7);
		 movie19 = mdao.MostView(8);
		 movie20 = mdao.MostView(9);
		 
		 movie21 = mdao.MostLike(0);
		 movie22 = mdao.MostLike(1);
		 movie23 = mdao.MostLike(2);
		 movie24 = mdao.MostLike(3);
		 movie25 = mdao.MostLike(4);
		 movie26 = mdao.MostLike(5);
		 movie27 = mdao.MostLike(6);
		 movie28 = mdao.MostLike(7);
		 movie29 = mdao.MostLike(8);
		 movie30 = mdao.MostLike(9);
		 
		 movie31 = mdao.Watched(0);
		 movie32 = mdao.Watched(1);
		 movie33 = mdao.Watched(2);
		 movie34 = mdao.Watched(3);
		 movie35 = mdao.Watched(4);
		 movie36 = mdao.Watched(5);
		 movie37 = mdao.Watched(6);
		 movie38 = mdao.Watched(7);
		 movie39 = mdao.Watched(8);
		 movie40 = mdao.Watched(9);
		
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
		
		req.setAttribute("movie11", movie11);
		req.setAttribute("movie12", movie12);
		req.setAttribute("movie13", movie13);
		req.setAttribute("movie14", movie14);
		req.setAttribute("movie15", movie15);
		req.setAttribute("movie16", movie16);
		req.setAttribute("movie17", movie17);
		req.setAttribute("movie18", movie18);
		req.setAttribute("movie19", movie19);
		req.setAttribute("movie20", movie20);
		
		req.setAttribute("movie21", movie21);
		req.setAttribute("movie22", movie22);
		req.setAttribute("movie23", movie23);
		req.setAttribute("movie24", movie24);
		req.setAttribute("movie25", movie25);
		req.setAttribute("movie26", movie26);
		req.setAttribute("movie27", movie27);
		req.setAttribute("movie28", movie28);
		req.setAttribute("movie29", movie29);
		req.setAttribute("movie30", movie30);
		
		req.setAttribute("movie31", movie31);
		req.setAttribute("movie32", movie32);
		req.setAttribute("movie33", movie33);
		req.setAttribute("movie34", movie34);
		req.setAttribute("movie35", movie35);
		req.setAttribute("movie36", movie36);
		req.setAttribute("movie37", movie37);
		req.setAttribute("movie38", movie38);
		req.setAttribute("movie39", movie39);
		req.setAttribute("movie40", movie40);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/index.jsp");
		return transfer;
	}
}
