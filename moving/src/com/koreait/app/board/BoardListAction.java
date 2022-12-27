package com.koreait.app.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dto.BoardDTO;

public class BoardListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		String temp = req.getParameter("page");
		String keyword = req.getParameter("q");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		//한 페이지에서 보여줄 게시글의 개수
		int pageSize = 10;
		
		//전체 게시글의 개수
		int totalCnt = bdao.getBoardCnt(keyword);
		
		//아래쪽 페이징 처리 부분에 보여지는 첫번째 페이지 번호
		int startPage = ((page - 1)/5)*5 + 1;
		
		//아래쪽 페이징 처리 부분에 보여지는 마지막 페이지 번호(연산으로 구해진것)
		int endPage = startPage + 4;
		
		//전체 개수를 기반으로 한 가장 마지막 페이지 번호
		int totalPage = (totalCnt - 1)/pageSize + 1;
		
		//허구의 페이지가 있는 경우 totalPage로 바꿔주기
		endPage = endPage > totalPage ? totalPage : endPage;
		
		int startRow = (page - 1) * pageSize;
		
		List<BoardDTO> boardList = bdao.getBoardList(startRow,pageSize,keyword);
		
		req.setAttribute("boardList", boardList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("keyword", keyword);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/boardList.jsp");
		return transfer;
	}
}










