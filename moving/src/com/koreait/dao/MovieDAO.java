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
  
	public List<MovieDTO> searchmovieList(String ms) {
		String search = "%" + ms + "%";
		List<MovieDTO> title = sqlsession.selectList("Movie.moviesearchtitle", search);
		return title;
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

	public List<MovieDTO> getSimilar(int movienum) {
		return sqlsession.selectList("Movie.similarType",movienum);
	}

	public String getmovie(int movienum) {
	    return sqlsession.selectOne("Movie.getMovie", movienum);
	}

	public boolean plusView(int movienum) {
		return (Integer)sqlsession.update("Movie.plusView_cnt",movienum) == 1;
	}

	public boolean fileUpload(MovieDTO movie) {
		return sqlsession.update("Movie.fileUpLoad",movie) == 1;
	}
}	
