package com.koreait.dao;

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
	
}







