package com.koreait.app.board;

import java.io.PrintWriter;

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
		System.out.println(userid);
		board.setUserid(userid);
		
		BoardDAO bdao = new BoardDAO();
		ActionTo transfer = new ActionTo();
		int boardnum = 0;
		
		resp.setCharacterEncoding("UTF-8");
		
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		if(bdao.insertBoard(board)) {
			boardnum = bdao.getLastNum(userid); 
			out.println("<script>alert('등록 성공!');</script>");
			out.flush();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum);
		}

		return transfer;
	}
}










