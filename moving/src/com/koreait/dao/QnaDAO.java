package com.koreait.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.QnaDTO;
import com.koreait.mybatis.SqlMapConfig;

public class QnaDAO {
   SqlSession sqlsession;
   
   public QnaDAO() {
      sqlsession = SqlMapConfig.getFactory().openSession(true);
   }

   public boolean insertQna(QnaDTO qna) {
      return sqlsession.insert("Qna.insertQna",qna) == 1;
   }

   public int getQnaCnt(String keyword) {
      if(keyword == null) {
         return sqlsession.selectOne("Qna.getQnaCnt");
      }
      else {
         return sqlsession.selectOne("Qna.getQnaCntWithKey",keyword);
      }
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

	public List<QnaDTO> getqnaList(int startRow, Integer pageSize, String keyword, String userid) {
		  HashMap<String, Object> datas = new HashMap<String, Object>();
	      List<QnaDTO> result = null;
	      
	      datas.put("startRow", startRow);
	      datas.put("pageSize", pageSize);
	      datas.put("userid", userid);
	      
	      if(keyword == null) {
	         result = sqlsession.selectList("Qna.qnalist",datas);
	      }
	      else {
	         datas.put("keyword", keyword);
	         result = sqlsession.selectList("Qna.getQnaListWithKey",datas);
	      }
	      
	      return result;

		
	}
}






