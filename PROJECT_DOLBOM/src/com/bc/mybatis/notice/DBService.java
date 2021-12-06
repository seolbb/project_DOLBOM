package com.bc.mybatis.notice;



import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// MyBatis 사용해서 작업할 sqlSession을 만들어 줄
// SqlSessionFactory 객체 생성을 위한 Class
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화구문
	static {

		try {
			/*
			String config="com/bc/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(config);
			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory sqlSessionFactory = factoryBuilder.build(reader);
			*/
			factory = new SqlSessionFactoryBuilder()
						.build(Resources.getResourceAsReader("com/bc/mybatis/notice/config.xml"));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
