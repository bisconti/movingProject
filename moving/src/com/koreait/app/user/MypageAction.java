package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.PayDAO;
import com.koreait.dao.UserDAO;
import com.koreait.dto.PayDTO;
import com.koreait.dto.UserDTO;

public class MypageAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      UserDAO udao = new UserDAO();
      PayDAO pdao = new PayDAO();
      
      String userid = req.getParameter("userid");
      
      UserDTO userList = udao.getUserList(userid);
      PayDTO payList = pdao.getPayList(userid);
      
      req.setAttribute("user", userList);
      req.setAttribute("pay", payList);
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/user/mypage.jsp");
      return transfer;
   }
}