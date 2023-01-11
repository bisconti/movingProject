package com.koreait.dao;

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

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
		return sqlsession.selectOne("getLoginUser", userid);
	}
	public int getUserAge(String userbirth) {
		return sqlsession.selectOne("getUserAge", userbirth);
	}
}