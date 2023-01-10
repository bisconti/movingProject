package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dto.ReplyDTO;

public class ReplyWriteAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		String userid = (String)req.getSession().getAttribute("loginUser");
		String replycontents = req.getParameter("replycontents");
		
		String page = req.getParameter("page");
		String q = req.getParameter("q");
		
		ReplyDTO reply = new ReplyDTO();
		reply.setBoardnum(boardnum);
		reply.setUserid(userid);
		reply.setReplycontents(replycontents);
		
		BoardDAO bdao = new BoardDAO();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		String path = "";
		out.print("<script>");
		if(bdao.insertReply(reply)) {
			out.print("alert('댓글 등록 성공!');");
			path = String.format("'%s/board/boardview.bo?boardnum=%d&page=%s&q=%s'",
					req.getContextPath(),boardnum,page,q);
		}
		else {
			out.print("alert('댓글 등록 실패!');");
			path = String.format("'%s/board/boardview.bo?boardnum=%d&page=%s&q=%s'",
					req.getContextPath(),boardnum,page,q);
		}
		out.print("location.href = "+path+";");
		out.print("</script>");
		return null;
	}
}







