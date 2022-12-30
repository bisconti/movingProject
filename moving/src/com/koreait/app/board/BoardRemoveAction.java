package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;

public class BoardRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		
		BoardDAO bdao = new BoardDAO();
		
		ActionTo transfer = new ActionTo();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		
		transfer.setRedirect(true);
		out.print("<script>");
		if(bdao.removeBoard(boardnum)) {
			out.print("alert('삭제 성공!');");
			transfer.setPath(req.getContextPath()+"/board/boardlist.bo");
		}
		else {
			// 실패
//			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum);
		}
		out.print("</script>");
		return transfer;
	}
}










