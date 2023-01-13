package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;

public class CheckNumberAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	  System.out.println("여긴왔니?");
      String userphone = req.getParameter("userphone");
      Join_SMS sms = new Join_SMS();
      int checkNum = sms.send(userphone);
      System.out.println(checkNum);
      PrintWriter out = resp.getWriter();
      out.print(checkNum);
      ActionTo transfer = new ActionTo();
      transfer.setRedirect(false);
      System.out.println("설마왔니..?");
      transfer.setPath("/app/user/joinview.jsp");
      System.out.println("어디서 사라지니?");
      return transfer;
   }
}