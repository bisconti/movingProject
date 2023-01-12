package com.koreait.app.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.QnaDTO;

public class AnswerOkAction implements Action {

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      int qnanum = Integer.parseInt(req.getParameter("qnanum"));
      String answer = req.getParameter("qnacontents");
      String check = "O";
      UserDAO udao = new UserDAO();
      QnaDTO qdto = new QnaDTO();
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();

      if (udao.answerOk(qnanum, answer, check)) {

         out.write("<script>");
         out.write("alert('답변 완료!');");
         out.print("location.href='" + req.getContextPath() + "/movie/center.mo';");
         out.write("</script>");

      }
      else {
         
         out.write("<script>");
         out.write("alert('답변 실패!');");
         out.print("location.href='" + req.getContextPath() + "/movie/center.mo';");
         out.write("</script>");
      }
      return null;
   }
}