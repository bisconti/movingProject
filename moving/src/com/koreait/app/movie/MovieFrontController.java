package com.koreait.app.movie;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;


public class MovieFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//흐름 나누기
		String requestURI = req.getRequestURI();// ???????/user/userjoin.us
		String contextPath = req.getContextPath();// ??????(web_module명)
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionTo transfer = null;
		
		switch(command) {
		case "/movie/moviesearch.mo":
			try {
				transfer = new MoviesearchAction().execute(req,resp);
				System.out.println("/movie/moviesearch.mo");
			} catch (Exception e) {
				System.out.println("WARN:search" + e);
			}
			break;

		case "/movie/moviedetail.mo" :
	         try {
	            transfer = new MovieDetailAction().execute(req,resp);
	         } catch (Exception e) {
	            System.out.println("WARN:moviedetail : "+e);
	         }
	         break;
	         
	   case"/movie/movie_like.mo":
	         try {
	             transfer = new MovieLikeAction().execute(req,resp);
	          } catch (Exception e) {
	              System.out.println("WARN:movie_like : "+e);
	          }
	          break;
	   case"/movie/movie_subscribe.mo":
	          try {
	                transfer = new MovieSubscribeAction().execute(req,resp);
	             } catch (Exception e) {
	                System.out.println("WARN:movieSubscribe : "+e);
	             }
	             break;
		}
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				//Redirect 방식
				resp.sendRedirect(transfer.getPath());
			}
			else {
				//Forward 방식
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}











