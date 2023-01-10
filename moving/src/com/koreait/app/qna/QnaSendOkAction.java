package com.koreait.app.qna;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.QnaDAO;
import com.koreait.dto.QnaDTO;

public class QnaSendOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		LocalDateTime now = LocalDateTime.now();

        String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
 
		String qnatitle = req.getParameter("qnatitle");
		String qnacontents = req.getParameter("qnacontents");
		String userid = req.getParameter("userid");
		
		QnaDTO qna = new QnaDTO();
		qna.setQnatitle(qnatitle);
		qna.setQnacontents(qnacontents);
		qna.setUserid(userid);
		qna.setTime(formatedNow);
		
		QnaDAO qdao = new QnaDAO();		
		ActionTo transfer = new ActionTo();
		
		if(qdao.insertQna(qna)) {
			Cookie cookie = new Cookie("check", "qs");
			resp.addCookie(cookie);
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/qna/qnamain.qn");
		}

		return transfer;
	}
}
