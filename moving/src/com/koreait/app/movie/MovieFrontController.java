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
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionTo transfer = null;
		
		switch(command) {
		case "/movie/moviesearch.mo":
			try {
				transfer = new MoviesearchAction().execute(req,resp);
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
	             
		case"/movie/mavieupload.mo":
	          transfer = new ActionTo();
	          transfer.setPath("/app/managerview/fileupload.jsp");
	          transfer.setRedirect(false);
	          break;
	          
		case "/movie/wishcheck.mo":
		     try {
		        new WishCheckOkAction().execute(req,resp);
		     } catch (Exception e) {
		    	 System.out.println("WARN : WishCheck : "+e);
		         }
		     break;
		         
		case "/movie/likecheck.mo" :
		     try {
		        new LikeCheckOkAction().execute(req,resp);
		     } catch (Exception e) {
		    	 System.out.println("WARN : LikeCheck : "+e);
		         }
		     break;    
		     
	    case "/movie/wishlist.mo":
	          try {
	             transfer = new MoviewishlistAction().execute(req,resp);
	          } catch (Exception e) {
	             System.out.println("WARN:wishlist" + e);
	          }
	          break;
	    case "/movie/movieupload.mo":
	         try {
	            new UploadMovieAction().execute(req, resp);
	         } catch (Exception e) {
	        	 System.out.println("WARN : UploadMovieAction : "+e);
	         }
	         break;
	      case "/movie/manager.mo":
	         transfer = new ActionTo();
	         transfer.setRedirect(false);
	         transfer.setPath("/app/manager/manager.jsp");
	         break;
	         
	      case "/movie/fileupload.mo":
	         transfer = new ActionTo();
	         transfer.setRedirect(false);
	         transfer.setPath("/app/manager/fileupload.jsp");
	         break;
	         
	      case "/movie/center.mo":
	         try {
	            transfer = new InquirylistAction().execute(req, resp);
	         } catch (Exception e) {
	        	 System.out.println("WARN : InquiryListAction : "+e);
	         }
	         break;
	         
	      case "/movie/pageSize.mo":
	         int page = Integer.parseInt(req.getParameter("page"));
	         Integer pageSize = Integer.parseInt(req.getParameter("pageSize"));
	         req.getSession().setAttribute("pageSize", pageSize);
	         resp.sendRedirect(req.getContextPath() + "/movie/center.mo?page=" + page);
	         break;
	         
	      case "/movie/inquirydetail.mo":
	         try {
	            transfer = new InquirydetailAction().execute(req, resp);
	         } catch (Exception e) {
	        	 System.out.println("WARN : InquiryDetail : "+e);
	         }
	         break;

	      case "/movie/answer.mo":
	         try {
	            transfer = new AnswerAction().execute(req, resp);
	         } catch (Exception e) {
	        	 System.out.println("WARN : AnswerAction : "+e);
	         }
	         break;
	         
	      case "/movie/answerok.mo":
	         try {
	            new AnswerOkAction().execute(req,resp);
	         } catch (Exception e) {
	        	 System.out.println("WARN : AnswerOkAction : "+e);
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











