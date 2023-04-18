package jdbc0328;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_selectJoin {

	public static void main(String[] args) {
		//문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
		/*
			g1001	d001	HTML
			g1001	p001	JAVA
			g1001	p002	Oracle
		*/
		
		String num="g1001";
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String url	   ="jdbc:oracle:thin:@localhost:1521:xe";
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 연결 성공!");
			
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT SU.hakno, GM.gname, GM.gcode ");
			sql.append(" FROM tb_gwamok GM join tb_sugang SU ");
			sql.append(" on GM.gcode = SU.gcode ");
			sql.append(" where SU.hakno=? ");
			sql.append(" order by GM.gcode ");
			

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("자료 있음!");

				do {
					System.out.print(rs.getString("hakno")+ " ");
					System.out.print(rs.getString("gname")+ " ");
					System.out.print(rs.getString("gcode")+ " ");
					System.out.println();
				}while(rs.next());
				
			}else {
				System.out.println("자료 없음!");
			}
			
			
		}catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}finally {
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
