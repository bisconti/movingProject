package com.koreait.app.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.QnaDTO;

public class QnaDetailAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int qnanum = Integer.parseInt(req.getParameter("qnanum"));
	      UserDAO ud = new UserDAO();
	      QnaDTO qd = ud.getqnaDetail(qnanum);
	      
	      req.setAttribute("qna", qd);
	      ActionTo transfer = new ActionTo();
	      transfer.setRedirect(false);
	      transfer.setPath("/app/qna/qnadetail.jsp");
	      return transfer;	
	}
}
