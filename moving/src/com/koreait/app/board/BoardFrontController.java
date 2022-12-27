package com.koreait.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;

public class BoardFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionTo transfer = null;
		
		switch(command) {
		case "/board/boardlist.bo":
			try {
				transfer = new BoardListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardList : "+e);
			}
			break;
		case "/board/boardview.bo":
			try {
				transfer = new BoardViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardView : "+e);
			}
			break;
		case "/board/boardwrite.bo":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/board/writeview.jsp");
			break;
		case "/board/boardwriteok.bo":
			try {
				transfer = new BoardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardWriteOk : "+e);
			}
			break;
		case "/board/boardmodify.bo":
			try {
				transfer = new BoardModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardModify : "+e);
			}
			break;
		case "/board/boardmodifyok.bo":
			try {
				transfer = new BoardModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardModifyOk : "+e);
			}
			break;
		case "/board/boardremove.bo":
			try {
				transfer = new BoardRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("WARN:BoardRemove : "+e);
			}
			break;
		}
		
		//전송 일괄처리(어디인지, 어떤 방식인지는 몰라도 그냥 transfer라는 객체에 담겨있는 정보를 해석해서 그대로 페이지를 이동)
		if(transfer != null) {
			if(transfer.isRedirect()) {
				//Redirect 방식
				resp.sendRedirect(transfer.getPath());
			}
			else {
				//Forward 방식
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
	
}











