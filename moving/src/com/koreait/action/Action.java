package com.koreait.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//앞으로 비즈니스 로직을 수행할 모든 클래스들의 틀
	//execute()는 실제 로직이 구현될 메소드(각 비즈니스 로직을 담아줄 클래스에서 재정의)
	//로직을 수행했다면 결과로 "어디로", "어떻게" 이동할 지가 나오기 때문에
	//그 두 정보를 가지고 있는 ActionTo 객체를 만들어서 리턴하도록 설계를 한다.
	ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
