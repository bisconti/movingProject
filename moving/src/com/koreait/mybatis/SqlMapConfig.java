package com.koreait.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory factory;

	//클래스 초기화 블럭, static 블럭(클래스가 처음 로딩될 때 딱 한번만 수행)
	static {
		try {
			String resource = "com/koreait/mybatis/config.xml";			//자원의 위치(설계도 위치)
			Reader reader = Resources.getResourceAsReader(resource);	//설계도를 공학자에게 읽혀주기
			factory = new SqlSessionFactoryBuilder().build(reader);		//건축가와 공학자의 합심으로 factory 짓기
		} catch (IOException e) {
			System.out.println("초기화 문제 발생 : "+e);
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}






