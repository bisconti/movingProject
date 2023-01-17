package com.koreait.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;

public class UserFrontController extends HttpServlet{

   private static final long serialVersionUID = 1L;
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //흐름 나누기
      String requestURI = req.getRequestURI();// ???????/user/userjoin.us
      String contextPath = req.getContextPath();// ??????(web_module명)
      String command = requestURI.substring(contextPath.length());
      System.out.println(command);
      ActionTo transfer = null;
      
      switch(command) {
      case "/user/userjoin.us":
         transfer = new ActionTo();
         transfer.setPath("/app/user/terms.jsp");
         transfer.setRedirect(false);
         break;
      case "/user/userlogin.us":
         transfer = new ActionTo();
         transfer.setPath("/app/user/loginview.jsp");
         transfer.setRedirect(false);
         break;
      case "/user/userjoinok.us":
         //처리
         try {
            transfer = new UserJoinOkAction().execute(req, resp);
         } catch (Exception e) {
            System.out.println("WARN:UserJoinOk : "+e);
         }
         break;
      case "/user/userloginok.us":
         try {
            new UserLoginOkAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN:UserLoginOk : "+e);
         }
         break;
      case "/user/checkidok.us":
         try {
            new CheckIdOkAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN:CheckIdOk : "+e);
         }
         break;
      case "/user/userlogout.us":
          resp.setCharacterEncoding("UTF-8");
          resp.setContentType("text/html; charset=utf-8");
          req.getSession().removeAttribute("loginUser");
          req.getSession().removeAttribute("User");
          req.getSession().removeAttribute("userphoto");
          req.getSession().removeAttribute("age");
          PrintWriter out = resp.getWriter();
          out.write("<script>");
          out.write("alert('로그아웃 되었습니다.');");
          out.write("location.href='"+ req.getContextPath()+"/';");
          out.write("</script>");
          break;
          
      case "/user/send_msg.us" :
         try {
            new CheckNumberAction().execute(req, resp);
         } catch (Exception e) {
            System.out.println("WARN:CheckNumberAction : "+e);
         }
         break;
      case "/user/manager.us":
         transfer = new ActionTo();
         transfer.setPath("/app/manager/manager.jsp");
         transfer.setRedirect(false);
         break;
      case "/user/searchid.us" :
         transfer = new ActionTo();
          transfer.setPath("/app/user/SearchId.jsp");
          transfer.setRedirect(false);
          break;
      case "/user/searchidok.us" :
         try {
            transfer = new SearchIdOkAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN: IdSearchOkAction : "+e);
         }
         break;
      case "/user/searchpw.us" :
         transfer = new ActionTo();
          transfer.setPath("/app/user/SearchPw.jsp");
          transfer.setRedirect(false);
          break;
      case "/user/searchpwok.us" :
         try {
            transfer = new SearchPwAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN: IdSearchOkAction : "+e);
         }
         break;
      case "/user/updatepw.us" :
         try {
            transfer = new UpdatePwAction().execute(req, resp);
         } catch (Exception e) {
            System.out.println("WARN: UpdatePwAction : "+e);
         }
         break;
         
      case "/user/mypage.us":
          try {
             transfer = new MypageAction().execute(req,resp);
          } catch (Exception e) {
             System.out.println("WARN:mypage : "+e);
          }
          break;
         
      case "/user/terms.us":
          transfer = new ActionTo();
          transfer.setPath("/app/user/terms.jsp");
          transfer.setRedirect(false);
          break;
          
     case "/user/dateCheck.us":
         try {
            new DateCheckAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN:Subscribe : "+e);
         }
         break;
         
     case "/user/joinview.us":
           transfer = new ActionTo();
           transfer.setPath("/app/user/joinview.jsp");
           transfer.setRedirect(false);
           break;
           
      case "/user/subscribeOk.us":
          try {
            transfer = new SubscribeOkAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("WARN:SubscribeOk : "+e);
         }
         break;
         
      case "/user/subscribe.us":
         transfer = new ActionTo();
          transfer.setPath("/app/subscribe/subscribe.jsp");
          transfer.setRedirect(false);
          break;   
         
      case "/user/adduserphoto.us":
         try {
         transfer = new AddPhotoAction().execute(req,resp);
      } catch (Exception e) {
         System.out.println("WARN:AddPhoto : "+e);
      }
        break;
      case "/user/changepw.us" :
          try {
             new ChangePwAction().execute(req, resp);
        } catch (Exception e) {
           System.out.println("WARN: ChangePw : " +e);
        }
        break;
        
      case "/user/changephone.us":
          try {
             new ChangephoneAction().execute(req, resp);
        } catch (Exception e) {
           System.out.println("WARN: Changephone : " +e);
        }
        break;
        
      case "/user/checkphoneok.us":
          try {
             new CheckPhoneOkAction().execute(req,resp);
          } catch (Exception e) {
             System.out.println("WARN:CheckIdOk : "+e);
          }
          break;
         
      case "/user/changeaddr.us":
          try {
              new ChangeaddrAction().execute(req, resp);
         } catch (Exception e) {
            System.out.println("WARN: Changephone : " +e);
         }
          break;
          
      case "/qna/qnamain.us":
          transfer = new ActionTo();
           transfer.setPath("/app/qna/qnaMain.jsp");
           transfer.setRedirect(false);
           break;       
           
      case"/user/userpage.us":
          transfer = new ActionTo();
          transfer.setPath("/app/user/userpage.jsp");
          transfer.setRedirect(false);
         break;  
         
      case "/board/boardList.us" :
          transfer = new ActionTo();
           transfer.setPath("/app/board/boardList.jsp");
           transfer.setRedirect(false);
          break;
          
       case "/qna/qnaList.us" :
          transfer = new ActionTo();
           transfer.setPath("/app/qna/qnaList.jsp");
           transfer.setRedirect(false);
          break;
          
      case "/user/modifyProfile.us":
         
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









