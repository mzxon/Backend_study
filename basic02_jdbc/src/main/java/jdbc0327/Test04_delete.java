package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test04_delete {

	public static void main(String[] args) {
		//sungjuk테이블 행 삭제 연습
		
		try {	
	
			String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 연결 성공!");
		
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk WHERE sno=113");
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());

			int cnt=pstmt.executeUpdate();
			if(cnt==0) {
				System.out.println("행 삭제 실패!");
			}else {
				System.out.println("행 삭제 성공!");
			}
			
			pstmt.close();
			con.close();
			
			System.out.println("실행결과 : " + cnt);
			
		} catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}

	}

}
