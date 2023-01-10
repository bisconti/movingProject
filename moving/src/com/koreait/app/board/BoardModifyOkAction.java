package com.koreait.app.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dto.BoardDTO;

public class BoardModifyOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		String boardtitle = req.getParameter("boardtitle");
		String boardcontents = req.getParameter("boardcontents");
		String q = req.getParameter("q");
		String page = req.getParameter("page");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setBoardnum(boardnum);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		BoardDAO bdao = new BoardDAO();
		
		if(bdao.updateBoard(board)) {
			Cookie cookie = new Cookie("check", "ut");
			resp.addCookie(cookie);
			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum+"&page="+page+"&q="+q);
		}
		else {
			// 실패
//			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum+"&page="+page+"&q="+q);
		}
		return transfer;
	}
}










