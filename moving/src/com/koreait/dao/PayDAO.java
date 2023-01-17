package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.PayDTO;
import com.koreait.mybatis.SqlMapConfig;

public class PayDAO {

   SqlSession sqlsession;
   
   public PayDAO() {
      sqlsession = SqlMapConfig.getFactory().openSession(true);
   }
   
   public boolean insertPay(PayDTO pay) {
      return sqlsession.insert("Pay.insertPay",pay) == 1;
   }

   public boolean updatePayYear(String userid) {
      return sqlsession.update("Pay.updatePayYear",userid) == 1;
   }
   
   public boolean updatePayMonth(String userid) {
	      return sqlsession.update("Pay.updatePayMonth",userid) == 1;
	   }
   
   public int checkPay(String userid) {
	   return (int)sqlsession.selectOne("Pay.checkPay",userid);
   }
   
   public PayDTO getPayList(String userid) {
	      return sqlsession.selectOne("Pay.payList",userid);
	   }
}