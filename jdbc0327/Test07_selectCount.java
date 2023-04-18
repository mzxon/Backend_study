package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.spi.DirStateFactory.Result;

public class Test07_selectCount {

	public static void main(String[] args) {
		//sungjuk 테이블의 행의 갯수를 출력하시오
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; //select문을 실행한 결과(테이블)를 저장
		
		try {	
	
			String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
		
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt");
			sql.append(" FROM sungjuk");
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs=pstmt.executeQuery(); //select문 실행 
			//rs가 count(*)를 가리키고 있음
			
			//cursor: 행을 가리키는 값. 이동할 수 있다.
			if(rs.next()) {//cursor가 있는지?
				System.out.println("자료있음");
				
				//1)칼럼 순서 접근
				//->select 칼럼1, 칼럼2, 칼럼3, ~~ 내가 작성한 순서가 곧 칼럼 순서
				//->자료형 일치하면서 가져온다.
				System.out.println("전체 행 갯수 : " + rs.getInt(1)); //1번칼럼
				
				//2)칼럼명으로 접근
				//-> select cnt, ~~
				System.out.println("전체 행 갯수 : " + rs.getInt("cnt"));
			
			}else System.out.println("자료없음");
			
		} catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}finally {
			//예외없이 무조건 실행
			try {
				if(rs!=null) pstmt.close();
			} catch (Exception e2) {}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {}
			try {
				if(con!=null) con.close();
			} catch (Exception e2) {}
		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
