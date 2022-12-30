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
		return sqlsession.selectOne("Movie.mostFast",i);
	} 
	public MovieDTO Watched(int i) {
		return sqlsession.selectOne("Movie.watched",i);
	}
	public MovieDTO MostView(int i) {
		return sqlsession.selectOne("Movie.mostView",i);
	}
	public MovieDTO MostLike(int i) {
		return sqlsession.selectOne("Movie.mostLike",i);
	}

	
	
}	