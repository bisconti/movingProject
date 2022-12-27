package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class MovieDAO {
	SqlSession sqlsession;
	public MovieDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	} 
}
