package jdbc0328;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test03_selectPaging {

	public static void main(String[] args) {
		//페이징
		//문제) sungjuk테이블에서 이름순으로 정렬후 행번호 4~6만 조회하시오
		int start=4; //시작 행번호
		int end=6;	 //끝  행번호
		
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
			sql.append(" SELECT * ");
			sql.append(" FROM( ");
			sql.append(" 		SELECT sno, uname, aver, addr, rownum as rnum ");
			sql.append(" 		FROM( ");
			sql.append(" 				SELECT sno, uname, aver, addr ");
			sql.append(" 				FROM sungjuk");
			sql.append(" 				ORDER BY uname ");
			sql.append(" 			) ");
			sql.append(" 	  ) ");
			sql.append(" WHERE rnum>=? and rnum<=?");
			
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("자료 있음!");

				do {
					System.out.print(rs.getString("rnum")+ " ");
					System.out.print(rs.getInt("sno")+ " ");
					System.out.print(rs.getString("uname")+ " ");
					System.out.print(rs.getInt("aver")+ " ");
					System.out.print(rs.getString("addr")+ " ");
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
