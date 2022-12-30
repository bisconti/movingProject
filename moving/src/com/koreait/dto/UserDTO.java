package com.koreait.dto;

public class UserDTO {
	private String userid;
	private String userpw;
	private String username;
	private String usergender;
	private String zipcode;
	private String useraddr;
	private String useraddrdetail;
	private String useraddretc;
	private String userbirth;
	private String userphone;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUseraddrdetail() {
		return useraddrdetail;
	}
	public void setUseraddrdetail(String useraddrdetail) {
		this.useraddrdetail = useraddrdetail;
	}
	public String getUseraddretc() {
		return useraddretc;
	}
	public void setUseraddretc(String useraddretc) {
		this.useraddretc = useraddretc;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", usergender="
				+ usergender + ", zipcode=" + zipcode + ", useraddr=" + useraddr + ", useraddrdetail=" + useraddrdetail
				+ ", useraddretc=" + useraddretc + ", userbirth=" + userbirth + ", userphone=" + userphone + "]";
	}
	
	
    
	
	
}
