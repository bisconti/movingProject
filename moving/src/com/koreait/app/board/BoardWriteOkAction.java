package com.koreait.app.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dto.BoardDTO;

public class BoardWriteOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(req.getParameter("boardtitle"));
		board.setBoardcontents(req.getParameter("boardcontents"));
		String userid = req.getParameter("userid");
		board.setUserid(userid);
		
		BoardDAO bdao = new BoardDAO();
		ActionTo transfer = new ActionTo();
		int boardnum = 0;
		
		if(bdao.insertBoard(board)) {
			boardnum = bdao.getLastNum(userid); 
		}else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/board/boardlist.bo");
			Cookie cookie = new Cookie("w", "f");
			resp.addCookie(cookie);
		}
		return transfer;
	}
}










