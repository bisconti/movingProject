package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dto.UserDTO;

public class SearchPwAction implements Action {
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String userid = req.getParameter("userid");
      UserDTO user = new UserDTO();
      user.setUserid(userid);
      req.setAttribute("userid", userid);
      System.out.println("체크id");
      System.out.println(userid);
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      transfer.setPath("/app/user/SearchPwCorrect.jsp");
      
      return transfer;
   }
}