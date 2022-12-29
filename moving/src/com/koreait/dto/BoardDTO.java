package com.koreait.dto;

import java.util.Date;

public class BoardDTO {
	private int boardnum;
    private String boardtitle;
    private String boardcontents;
    private Date regdate;
	private int readcount;
    private String userid;
    
    public Date getRegdate() {
    	return regdate;
    }
    public void setRegdate(Date regdate) {
    	this.regdate = regdate;
    }
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontents() {
		return boardcontents;
	}
	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
