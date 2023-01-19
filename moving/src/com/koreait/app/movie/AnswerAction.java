package com.koreait.app.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.QnaDTO;

public class AnswerAction implements Action{

   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      int qnanum = Integer.parseInt(req.getParameter("qnanum"));
      System.out.println(qnanum);
      UserDAO udao = new UserDAO();
      QnaDTO qdto = new QnaDTO();
      QnaDTO qna = udao.getqnaDetail(qnanum);
      
      req.setAttribute("qna", qna);
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/manager/answer.jsp");
      
      return transfer;
   }

}