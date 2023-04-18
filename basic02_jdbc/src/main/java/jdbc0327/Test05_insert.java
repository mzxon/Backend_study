package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test05_insert {

	public static void main(String[] args) {
		//변수를 이용해서 sungjuk 테이블 행 추가 연습
		
		try {	
	
			String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 연결 성공!");
			
			
			String uname="박지성";
			int kor=99, eng=98, mat=100;
			String addr="Seoul";
			
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, sysdate)");
			//-> ? 특정값으로 대입할 수 있는 표식
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			//-> ?의 갯수, 순서, 자료형이 일치해야 한다.
			pstmt.setString(1, uname); //1 -> 첫번재 물음표, uname 칼럼
			pstmt.setInt(2, kor);  	   //2 -> 첫번재 물음표, kor   칼럼
			pstmt.setInt(3, eng);  	   //3 -> 첫번재 물음표, eng   칼럼
			pstmt.setInt(4, mat);  	   //4 -> 첫번재 물음표, mat   칼럼
			pstmt.setString(5, addr);  //5 -> 첫번재 물음표, addr  칼럼
			
			
			int cnt=pstmt.executeUpdate();
			if(cnt==0) {
				System.out.println("행 추가 실패!)");
			}else {
				System.out.println("행 추가 성공!");
			}
			
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
