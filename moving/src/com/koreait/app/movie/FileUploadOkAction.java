package com.koreait.app.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.MovieDTO;

public class FileUploadOkAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      MovieDAO mdao = new MovieDAO();
      MovieDTO movie = new MovieDTO();
      
      movie.setMovietitle(req.getParameter("movietitle"));
      movie.setActorname(req.getParameter("actorname"));
      movie.setTypename(req.getParameter("typename"));
      movie.setMovierelease(req.getParameter("movierelease"));
      movie.setRunningtime(req.getParameter("runningtime"));
      movie.setMovieended(req.getParameter("movieended"));
      movie.setNational(req.getParameter("national"));
      movie.setAgelimit(req.getParameter("agelimit"));
      
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();
      
      ActionTo transfer = new ActionTo();
      if(mdao.fileUpload(movie)) {
         transfer.setPath(req.getContextPath()+"/movie/manager.mo");
          //<script>
            out.print("<script>");
            //alert('apple님 어서오세요~!');
            out.print("alert('파일업로드 성공');");
            //location.href = '????/board/boardlist.bo';
            //</script>
            out.print("</script>");
      }
      else {
         transfer.setPath(req.getContextPath());
            out.print("<script>");
            //alert('apple님 어서오세요~!');
            out.print("alert('파일업로드 실패');");
            //location.href = '????/board/boardlist.bo';
            //</script>
            out.print("</script>");
      }
      
      
      return null;
   }

}