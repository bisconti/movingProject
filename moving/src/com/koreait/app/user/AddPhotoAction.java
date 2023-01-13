package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dto.FileDTO;
import com.koreait.dto.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddPhotoAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("loginUser"); 
		//String userphoto = (String)req.getParameter("userphoto");
		
		String savephoto = (req.getServletContext().getRealPath("/app/userprofile"));
		//System.out.println(userphoto);
	      // 저장될 파일의 크기(5MB)
	      int size = 1024 * 1024 * 20;

	      // cos 라이브러리 이용
	      MultipartRequest photo = new MultipartRequest(req, savephoto, size, "UTF-8", new DefaultFileRenamePolicy());
	      
	      // input[type=file] 태그의 name값을 써주면 시스템상 이름을 받아올 수 있음
	      String systemname1 = photo.getFilesystemName("userphoto");
	      // input[type=file] 태그의 name값을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
	      String userphoto = photo.getOriginalFileName("userphoto");
	      System.out.println(userphoto);
	      ActionTo transfer = new ActionTo();
	      
	      UserDTO user = new UserDTO();
	      user.setUserphoto(photo.getFilesystemName("userphoto"));
	      
	      
	      
	      
	      if (udao.addPhoto(userid,userphoto)) {
	    	
	    	 session.removeAttribute("userphoto");
	    	 String updatephoto = udao.newProfile(userid);
	    	 session.setAttribute("userphoto", updatephoto);
	    	 System.out.println(updatephoto);
	    	  
	         FileDTO file = new FileDTO();
	         resp.setCharacterEncoding("UTF-8");
	         resp.setContentType("text/html; charset=utf-8");
	         
	         transfer.setRedirect(true);
	         transfer.setPath(req.getContextPath()+"/home.ho");
	         
	      }
	      else {
	         out.write("<script>");
	         out.print("alert('프로필 사진 변경에 실패하였습니다.');");
	         out.print("location.href='"+ req.getContextPath()+"/user/mypage.us';");
	         out.write("</script>");
	         return null;
	      }
	      return transfer;
	}
}
