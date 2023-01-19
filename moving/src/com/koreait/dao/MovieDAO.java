package com.koreait.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.FileDTO;
import com.koreait.dto.MovieDTO;
import com.koreait.dto.MoviedataDTO;
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
	public MovieDTO Watched(int i,String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("i", i);
		datas.put("userid", userid);
		return sqlsession.selectOne("Movie.watched",datas);
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

	public boolean plusWatch(int movienum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("movienum", movienum);
		return sqlsession.insert("Movie.plusWatched",datas) == 1;
	}

	public boolean removeWatch(int movienum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("movienum", movienum);
		return (Integer)sqlsession.delete("Movie.removeWatched",datas)== 1;
	}
	
	public void wishlist(String userid,int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      sqlsession.insert("Movie.wishMovie",datas);
	   }

	   public void deletewish(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      sqlsession.delete("Movie.removeWish",datas);
	   }

	   public boolean checkwish(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      return (Integer)sqlsession.selectOne("Movie.checkWish",datas) != 1;
	      
	   }

	   public boolean checklike(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      return (Integer)sqlsession.selectOne("Movie.checklike",datas) != 1;
	      
	   }

	   public void likelist(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      sqlsession.insert("Movie.likeMovie",datas);
	   }

	   public void deletelike(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      sqlsession.delete("Movie.removeLike",datas);
	   }

	   public int wish(int movienum, String userid) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      return (Integer)sqlsession.selectOne("Movie.checkWish",datas);
	   }

	   public int like(String userid, int movienum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("movienum", movienum);
	      return (Integer)sqlsession.selectOne("Movie.checklike",datas);
	   }

	   public List<MovieDTO> Moviewishlist(String userid) {
		  return sqlsession.selectList("Movie.wishlist",userid) ;
	   }
	
	   public boolean insertMovie(MovieDTO movie) {
	      return sqlsession.insert("Movie.insertMovie",movie) == 1;
	   }

	   public int getLastNum() {
	      return sqlsession.selectOne("Movie.getLastNum");
	   }
	   public boolean insertfile(FileDTO file) {
	      MoviedataDTO mdd = new MoviedataDTO();
	      mdd.setMovienum(file.getMovienum());
	      mdd.setMoviephoto(file.getOrgname());
	      mdd.setMoviefilm(file.getSystemname());
	      return sqlsession.insert("Movie.insertfile",mdd) == 1;
	   }

}	
