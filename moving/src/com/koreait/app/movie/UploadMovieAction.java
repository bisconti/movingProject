package com.koreait.app.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.MovieDAO;
import com.koreait.dto.FileDTO;
import com.koreait.dto.MovieDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadMovieAction implements Action {

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      // cos : http://www.servlets.com
      String savephoto = ("C:/Users/LEEJUNMIN/Documents/GitHub/realMove/movingProject/moving/WebContent/app/file");
      System.out.println(savephoto);

      // 저장될 파일의 크기(5MB)
      int size = 1024 * 1024 * 20;
      System.out.println(size);

      // cos 라이브러리 이용
      MultipartRequest photo = new MultipartRequest(req, savephoto, size, "UTF-8", new DefaultFileRenamePolicy());
      System.out.println(photo);

      boolean fcheck1 = false;
      boolean fcheck2 = false;

      // input[type=file] 태그의 name값을 써주면 시스템상 이름을 받아올 수 있음
      String systemname1 = photo.getFilesystemName("moviephoto");
      System.out.println(systemname1);
      if (systemname1 == null) {

         fcheck1 = true;
      }
      // input[type=file] 태그의 name값을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
      String orgname1 = photo.getOriginalFileName("moviephoto");
      System.out.println(orgname1);

      String systemname2 = photo.getFilesystemName("moviefilm");
      System.out.println(systemname2);
      if (systemname2 == null) {

         fcheck2 = true;
      }
      // input[type=file] 태그의 name값을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
      String orgname2 = photo.getOriginalFileName("moviefilm");
      System.out.println(orgname2);

      // 두번째 파일도 똑같이 진행

      MovieDTO movie = new MovieDTO();
      movie.setTypename(photo.getParameter("typename"));
      movie.setActorname(photo.getParameter("actorname"));
      movie.setMovietitle(photo.getParameter("movietitle"));
      movie.setMovierelease(photo.getParameter("movierelease"));
      movie.setMoviecontents(photo.getParameter("moviecontents"));
      movie.setMovieended(photo.getParameter("movieended"));
      movie.setNational(photo.getParameter("national"));
      movie.setAgelimit(photo.getParameter("agelimit"));
      System.out.println(movie);

      MovieDAO md = new MovieDAO();
      ActionTo transfer = new ActionTo();
      int movienum = 0;

      if (md.insertMovie(movie)) {
         System.out.println("왔냐?");
         
         movienum = md.getLastNum();
         if (!fcheck1 && !fcheck2) {
            System.out.println("제발");
            FileDTO file = new FileDTO();
            file.setMovienum(movienum);
            file.setOrgname(orgname1);
            file.setSystemname(orgname2);

            fcheck1 = md.insertfile(file);
            System.out.println("제발");
         }
         resp.setCharacterEncoding("UTF-8");
         resp.setContentType("text/html; charset=utf-8");
         PrintWriter out = resp.getWriter();
         String title = movie.getMovietitle();
         // 1. 원래 파일이 업로드가 안됐음
         // 2. 파일이 존재했고, 위의 DB처리까지 완벽하게 성공했음
         if (fcheck1) {
            System.out.println("나와주라");
            out.write("<script>");
            out.write("alert('업로드 완료!');");
            out.print("location.href='" + req.getContextPath() + "/movie/manager.mo';");
            out.write("</script>");
            System.out.println("나가냐?");
         }

         else {
            out.write("<script>");
            out.write("alert('업로드 실패 ㅠㅠ');");
            out.print("location.href='" + req.getContextPath() + "/movie/manager.mo';");
            out.write("</script>");

         }
      }
      return null;

   }
}