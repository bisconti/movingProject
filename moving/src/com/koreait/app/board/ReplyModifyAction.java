package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;

public class ReplyModifyAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String i = req.getParameter("i");
		int replynum = Integer.parseInt(req.getParameter("replynum"));
		String page = req.getParameter("page");
		String q = req.getParameter("q");
		String boardnum = req.getParameter("boardnum");
		
		String replycontents = req.getParameter("reply"+i);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		
		BoardDAO bdao = new BoardDAO();
		
		out.write("<script>");
		if(bdao.modifyReply(replynum,replycontents)) {
			out.write("alert('"+replynum+"번 댓글 수정 성공!');");
		}
		else {
			out.write("alert('"+replynum+"번 댓글 수정 실패!');");
		}
		out.write("location.href = '"+req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum+"&page="+page+"&q="+q+"';");
		out.write("</script>");
		return null;
	}
}







