package com.koreait.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.QnaDTO;
/*import com.koreait.dto.FileDTO;*/
import com.koreait.dto.UserDTO;
import com.koreait.mybatis.SqlMapConfig;

public class UserDAO {
   SqlSession sqlsession;
   public UserDAO() {
      sqlsession = SqlMapConfig.getFactory().openSession(true);
   }
   public boolean join(UserDTO user) {
      return sqlsession.insert("User.join",user) == 1;
   } 
   public boolean login(String userid, String userpw) {
      HashMap<String, String> datas = new HashMap<String, String>();
      datas.put("userid", userid);
      datas.put("userpw", userpw);
      return (Integer)sqlsession.selectOne("User.login",datas) == 1;
   }
   public boolean checkId(String userid) {
      return (Integer)sqlsession.selectOne("User.checkId",userid) != 1;
   }
   public String searchId(String userphone) {
      return sqlsession.selectOne("User.searchId", userphone);
   }
   public boolean updatePw(UserDTO user) {
       return sqlsession.update("User.userPw", user) != 1; 
   }

	/*
	 * public boolean profileUpdate(FileDTO file) { return
	 * sqlsession.update("User.profileUpdate", file) != 1; }
	 */
   public boolean updatePw(String userid, String userpw) {
      HashMap<String, String> datas = new HashMap<String, String>();
      datas.put("userid", userid);
      datas.put("userpw", userpw);
      return (Integer)sqlsession.update("User.updatePw",datas) != 1;
   }
   
	public Date checkSubscribe(String userid) {
		return sqlsession.selectOne("User.checkSubscribe",userid);
	}
	
	public UserDTO getLoginUser(String userid) {
		return sqlsession.selectOne("User.getLoginUser",userid);
	}
	public int getUserAge(String userbirth) {
		return sqlsession.selectOne("User.getUserAge",userbirth);
	}
	public boolean addPhoto(String userid, String userphoto) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userid", userid);
		datas.put("userphoto", userphoto);
		return sqlsession.update("User.addPhoto",datas) == 1;
	}
	public boolean changepw(String userid, String userpw) {
	    HashMap<String, String> datas = new HashMap<String, String>();
	    datas.put("userid", userid);
	    datas.put("userpw", userpw);
	   return sqlsession.update("User.changepw",datas) == 1;
	}
	public boolean chagephone(String userid, String userphone) {
	    HashMap<String, String> datas = new HashMap<String, String>();
	    datas.put("userid", userid);
	    datas.put("userphone", userphone);
	   return sqlsession.update("User.changephone",datas) == 1;
	}
	public boolean checkPhone(String userphone) {
		return (Integer)sqlsession.selectOne("User.checkPhone", userphone) != 1;
	}
	
	public List<QnaDTO> qnalist(int startRow, int pageSize, String keyword) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      List<QnaDTO> result = null;
	      
	      datas.put("startRow", startRow);
	      datas.put("pageSize", pageSize);
	      
	      if(keyword == null) {
	         result = sqlsession.selectList("User.qnalist",datas);
	      }
	      else {
	         datas.put("keyword", keyword);
	         result = sqlsession.selectList("User.qnalist",datas);
	      }
	      return result;
	   }
	   public int getqnaCnt() {
	      return sqlsession.selectOne("User.getqnaCnt");
	   }
	   public QnaDTO getqnaDetail(int qnanum) {
	      return sqlsession.selectOne("User.getDetail",qnanum);
	   }
	   public boolean answerOk(int qnanum, String answer, String check) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      
	      datas.put("qnanum", qnanum);
	      datas.put("answer", answer);
	      datas.put("check", check);
	      return sqlsession.update("User.answerOk",datas)==1;
	   }
	public boolean changeaddr(UserDTO user) {
		 return sqlsession.update("User.changeaddr",user) == 1;
	}

}