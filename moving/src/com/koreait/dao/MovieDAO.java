package com.koreait.dao;

import java.util.HashMap;
import java.util.List;

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

	public MovieDTO getDetail(int movienum) {
		return sqlsession.selectOne("Movie.movieDetail",movienum);
	}

	public boolean movie_like(int movienum, String userid) {
	    HashMap<String, Object> datas = new HashMap<String, Object>();
	    datas.put("movienum", movienum);
	    datas.put("userid", userid);
	    return (Integer)sqlsession.selectOne("Movie.likeMovie",datas) == 1;
	}

	public boolean movie_Subscribe(int movienum, String userid) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("movienum", movienum);
	      datas.put("userid", userid);
	      return (Integer)sqlsession.selectOne("Movie.wishMovie",datas) == 1;
	}

	
	
}	