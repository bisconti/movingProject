package com.koreait.dao;

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
}
