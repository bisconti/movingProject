package com.koreait.app.qna;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.QnaDAO;
import com.koreait.dto.QnaDTO;

public class MyQnaAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      QnaDAO qdao = new QnaDAO();
      String temp = req.getParameter("page");
      String keyword = req.getParameter("q");
      Date now = new Date();
      now.getTime();
      QnaDTO qna = new QnaDTO();
      qna.getTime();
      HttpSession session = req.getSession();
      Integer pageSize = (Integer)session.getAttribute("pageSize");
      String userid = (String)session.getAttribute("loginUser");
       if(pageSize == null) pageSize = 10;
      
      int page = temp == null ? 1 : Integer.parseInt(temp);
      
      //전체 게시글의 개수
      int totalCnt = qdao.getQnaCnt(keyword);
      
      //아래쪽 페이징 처리 부분에 보여지는 첫번째 페이지 번호
      int startPage = ((page - 1)/5)*5 + 1;
      
      //아래쪽 페이징 처리 부분에 보여지는 마지막 페이지 번호(연산으로 구해진것)
      int endPage = startPage + 4;
      
      //전체 개수를 기반으로 한 가장 마지막 페이지 번호
      int totalPage = (totalCnt - 1)/pageSize + 1;
      
      //허구의 페이지가 있는 경우 totalPage로 바꿔주기
      endPage = endPage > totalPage ? totalPage : endPage;
      
      int startRow = (page - 1) * pageSize;
      
      List<QnaDTO> qnaList = qdao.getqnaList(startRow,pageSize,keyword,userid);
      
      req.setAttribute("qnaList", qnaList);
      req.setAttribute("totalPage", totalPage);
      req.setAttribute("totalCnt", totalCnt);
      req.setAttribute("page", page);
      req.setAttribute("startPage", startPage);
      req.setAttribute("endPage", endPage);
      req.setAttribute("keyword", keyword);
      req.setAttribute("pageSize", pageSize);
      req.setAttribute("url", req.getRequestURI());
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/qna/myqna.jsp");
      return transfer;
   }
}









