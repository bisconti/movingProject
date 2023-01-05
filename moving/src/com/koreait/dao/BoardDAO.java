package com.koreait.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.BoardDTO;
import com.koreait.dto.ReplyDTO;
import com.koreait.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSession sqlsession;
	public BoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public int getBoardCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Board.getBoardCnt");
		}
		else {
			return sqlsession.selectOne("Board.getBoardCntWithKey",keyword);
		}
	}
	public List<BoardDTO> getBoardList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<BoardDTO> result = null;
		
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		
		if(keyword == null) {
			result = sqlsession.selectList("Board.getBoardList",datas);
		}
		else {
			datas.put("keyword", keyword);
			result = sqlsession.selectList("Board.getBoardListWithKey",datas);
		}
		
		return result;
	}
	public BoardDTO getDetail(int boardnum) {
		return sqlsession.selectOne("Board.getDetail",boardnum);
	}
	public boolean insertBoard(BoardDTO board) {
		return sqlsession.insert("Board.insertBoard",board) == 1;
	}
	public int getLastNum(String userid) {
		return sqlsession.selectOne("Board.getLastNum",userid);
	}
	public boolean updateBoard(BoardDTO board) {
		return sqlsession.update("Board.updateBoard",board) == 1;
	}
	public boolean removeBoard(int boardnum) {
		return sqlsession.delete("Board.removeBoard",boardnum) == 1;
	}
	public void updateReadcount(int boardnum) {
		sqlsession.update("Board.updateReadcount",boardnum);
	}
	
	public boolean insertReply(ReplyDTO reply) {
		return sqlsession.insert("Board.insertReply",reply) == 1;
	}
	public List<ReplyDTO> getReplies(int boardnum) {
		return sqlsession.selectList("Board.getReplies",boardnum);
	}
	public boolean modifyReply(int replynum, String replycontents) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("replynum", replynum);
		datas.put("replycontents", replycontents);
		return sqlsession.update("Board.modifyReply",datas) == 1;
	}
	public boolean removeReply(int replynum) {
		return sqlsession.delete("Board.removeReply",replynum) == 1;
	}
	public void removeReplies(int boardnum) {
		sqlsession.delete("Board.removeReplies",boardnum);
	}
	
}







