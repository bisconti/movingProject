package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.MovieDTO;
import com.koreait.mybatis.SqlMapConfig;

public class MovieDAO {
	SqlSession sqlsession;
	public MovieDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public MovieDTO MostFast(int i) {
		for (int i = 0; i < 9; i++) {
			return sqlsession.selectOne("Movie.mostFast",i);
			
		}
	} 
	
	public String Watched() {
		return sqlsession.selectOne("Movie.watched");
	}
	public String MostView() {
		return sqlsession.selectOne("Movie.mostView");
	}
	public String MostLike() {
		return sqlsession.selectOne("Movie.mostLike");
	}

	
	
}	