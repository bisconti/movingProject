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
		
		String contents = req.getParameter("boardcontents");
		
		contents = contents.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>","");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(req.getParameter("boardtitle"));
		board.setBoardcontents(contents);
		System.out.println(contents);
		
		String userid = req.getParameter("userid");
		System.out.println(userid);
		board.setUserid(userid);
		
		BoardDAO bdao = new BoardDAO();
		ActionTo transfer = new ActionTo();
		int boardnum = 0;
		
		if(bdao.insertBoard(board)) {
			boardnum = bdao.getLastNum(userid); 
			Cookie cookie = new Cookie("check", "wt");
			resp.addCookie(cookie);
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum);
		}

		return transfer;
	}
}










