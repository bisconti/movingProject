package com.koreait.dto;

public class BoardDTO {
	private int boardnum;
    private String boardtitle;
    private String boardcontents;
    private String userid;
    private String regdate;
    
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
