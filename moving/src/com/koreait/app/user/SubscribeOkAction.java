package com.koreait.app.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.PayDAO;
import com.koreait.dto.PayDTO;

public class SubscribeOkAction implements Action{
   @Override
   public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String subprice = req.getParameter("subprice");
      String check = req.getParameter("y");
      
      PayDTO pay = new PayDTO();
      HttpSession session = req.getSession();
      String userid = (String)session.getAttribute("loginUser");
      
      pay.setUserid(userid);
      pay.setPrice(subprice);

      PayDAO pdao = new PayDAO();
      ActionTo transfer = new ActionTo();
      
      System.out.println(subprice);
      System.out.println(check);
      
      if(check.equals("m")) {
    	  System.out.println("왜");
    	  if (pdao.checkPay(userid) == 1) {
    		  if(pdao.updatePayMonth(userid)) {
    			  transfer.setRedirect(true);
    			  transfer.setPath(req.getContextPath()+"/");
    		  	}
    	  	}
		  else {
			if(pdao.insertPay(pay)) {
				Cookie cookie = new Cookie("check", "su");
				resp.addCookie(cookie);
			} 
			
			if(pdao.updatePayMonth(userid)) { 
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/"); 
				} 
			}
      }
      else{
    	  System.out.println("하");
    	  if (pdao.checkPay(userid) == 1) {
    		  if(pdao.updatePayYear(userid)) {
    			  transfer.setRedirect(true);
    			  transfer.setPath(req.getContextPath()+"/");
    		  }
		}
			  else { if(pdao.insertPay(pay)) { Cookie cookie = new Cookie("check", "su");
			  resp.addCookie(cookie);
			  
			  } if(pdao.updatePayYear(userid)) { transfer.setRedirect(true);
			  transfer.setPath(req.getContextPath()+"/"); } }
      }
      return transfer;
   }
}