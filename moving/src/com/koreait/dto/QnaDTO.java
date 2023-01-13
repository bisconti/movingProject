package com.koreait.dto;

public class QnaDTO {
   private int qnanum;
   private String userid;
   private String qnatitle;
   private String qnacontents;
   private String time;
   private String qnacheck;
   
   public String getQnacheck() {
	return qnacheck;
}
public void setQnacheck(String qnacheck) {
	this.qnacheck = qnacheck;
}
public int getQnanum() {
      return qnanum;
   }
   public void setQnanum(int qnanum) {
      this.qnanum = qnanum;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public String getQnatitle() {
      return qnatitle;
   }
   public void setQnatitle(String qnatitle) {
      this.qnatitle = qnatitle;
   }
   public String getQnacontents() {
      return qnacontents;
   }
   public void setQnacontents(String qnacontents) {
      this.qnacontents = qnacontents;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
    
}