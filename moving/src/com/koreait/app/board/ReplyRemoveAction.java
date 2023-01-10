package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;

public class ReplyRemoveAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		int replynum = Integer.parseInt(req.getParameter("replynum"));
		String page = req.getParameter("page");
		String q = req.getParameter("q");
		String boardnum = req.getParameter("boardnum");
	
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.write("<script>");
		if(bdao.removeReply(replynum)) {
			out.write("alert('댓글 삭제 성공!');");
		}
		else {
			out.write("alert('댓글 삭제 실패!');");
		}
		out.write("location.href = '"+req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum+"&page="+page+"&q="+q+"';");
		out.write("</script>");
		return null;
	}
}





