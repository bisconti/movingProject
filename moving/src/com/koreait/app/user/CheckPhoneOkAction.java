package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class CheckPhoneOkAction implements Action {
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String userphone = req.getParameter("userphone");
      UserDAO udao = new UserDAO();
      System.out.println(userphone);
      PrintWriter out = resp.getWriter();
      
      if(udao.checkPhone(userphone)) {
         out.write("O");
      }
      else {
         out.write("X");
      }
      out.close();
      
      return null;
   }
   
}