package net.mem;

import java.io.InputStream;
import java.util.List;

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
			
			//3)쿼리문 생성 및 변환
			//	->PreparedStatement와 비슷한 기능
			SqlSession sql=ssf.openSession(true);
			////////////////////////////////////////////////////////////////
			
			//4)쿼리문 실행
			
			// ① 행추가
			//int cnt=sql.insert("mem.insertRow", new MemDTO("홍길동", 30));
			//System.out.println("행추가 결과 :" + cnt);
			
		
			// ② 행수정
			//	-> num=4행의 이름과 나이를 수정하기
			//int result=sql.update("mem.updateRow", new MemDTO(4, "코리아", 23));
			//System.out.println("행수정 결과 : " + result);
			
		
			// ④ 행삭제
			//	->나이가 30이상 행 삭제
			//int result=sql.delete("mem.deleteRow", 30);
			
			// ② 전체목록
			/*
			List<MemDTO> list=sql.selectList("mem.selectAll");
			for(int i=0; i<list.size(); i++) {
				MemDTO dto=list.get(i);
				System.out.print(dto.getNum()+" ");
				System.out.print(dto.getName()+" ");
				System.out.print(dto.getAge()+" ");
				System.out.println();
			}
			*/
			////////////////////////////////////////////////////
			
			//	⑤ 검색
			//	-> 이름에 '리' 글자 있는 행을 조회
			/*
			List<MemDTO> list=sql.selectList("mem.search", "코");
			for(int i=0; i<list.size(); i++) {
				MemDTO dto=list.get(i);
				System.out.print(dto.getNum()+" ");
				System.out.print(dto.getName()+" ");
				System.out.print(dto.getAge()+" ");
				System.out.println();
			}
			*/
			
			// 	⑥ 상세보기
			//	-> num=4행 상세보기
			MemDTO dto=sql.selectOne("mem.selectRead", 4);
			System.out.print(dto.getNum()+" ");
			System.out.print(dto.getName()+" ");
			System.out.print(dto.getAge()+" ");
			System.out.println();
			
			// 	⑦ 전체 행 갯수
			System.out.println("전체 행 갯수 :" + sql.selectOne("mem.rowCount"));
			
			
		} catch (Exception e) {
			System.out.println("실패 :" + e);
		}
	}
}