package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class MovieDAO {
	SqlSession sqlsession;
	int i = 0;
	public MovieDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public String[] MostFast(int result) {
		return sqlsession.selectOne("Movie.mostFast",result);
	}
	public String[] Watched(int result) {
		return sqlsession.selectOne("Movie.watched",result);
	}
	public String[] MostView(int result) {
		return sqlsession.selectOne("Movie.mostView",result);
	}
	public String[] MostLike(int result) {
		return sqlsession.selectOne("Movie.mostLike",result);
	} 
	
	
}	