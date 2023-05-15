package net.mem;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemMainTest {
	
	public static void main(String[] args){
		//MyBatis Framework 기반 JDBC 연습
		
		try {
			//factory 공장
			//->어떤 특정 정보를 주면 객체로 생성해 줌
			//->객체 생성 : new연산(POJO방식), Bean
			
			//1)DB연결 환경 설정 파일 가져오기
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			
			//2)DB연결하기 위한 팩토리빈(factory bean)생성
			//	DBOpen + DAO
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("------DB연결 성공");
			
			
		} catch (Exception e) {
			System.out.println("실패 :" + e);
		}
	}
}
