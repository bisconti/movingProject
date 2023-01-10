package com.koreait.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
