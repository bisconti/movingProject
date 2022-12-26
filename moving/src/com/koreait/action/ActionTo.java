package com.koreait.action;

public class ActionTo {
	//어디로 이동할 것인지
	private String path;

	//어떻게 이동할 것인지(true : redirect방식 / false : forward방식)
	private boolean isRedirect;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	//path:"joinview.jsp" / isRedirect : false
	
//	void f() {
//		String msg = "";
//		if(true) {
//			msg = "A";//ActionTo 객체 만들고 세팅
//		}
//		else if(true) {
//			msg = "B";
//		}
//		else if(true) {
//			msg = "C";
//		}
//		System.out.println(msg);//페이지 이동코드
//	}
	
	
}
