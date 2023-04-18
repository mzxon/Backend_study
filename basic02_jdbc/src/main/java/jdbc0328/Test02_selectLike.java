package jdbc0328;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_selectLike {

	public static void main(String[] args) {
		//Like 연산자 연습
		//문제) 이름에 '나' 문자 있는 행을 조회하시오
		String col="uname";	//검색칼럼  keyfield
		String word="나";	//검색어	 keyword
		
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
			sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate");
			sql.append(" FROM sungjuk");
			
			//검색어를 입력하지 않으면 -> 전체 출력
			// => 글자갯수 0
			// => 공백은 포함안하게 제거 trim()
			//검색어를 입력하면 	    -> 조회된 결과 출력
			
			word=word.trim();
			//검색어가 존재하는가?
			if(word.length()>0) { //검색어가 존재할때만 where 조건절 포함해서 출력
				                  //where uname like '%나%';
				String where=" WHERE " + col + " LIKE '%" + word + "%'";
				sql.append(where);
			}
			
			sql.append(" ORDER BY sno DESC");
			
			//System.out.println(sql.toString());
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("자료 있음!");
				
				do {
					System.out.print(rs.getInt("sno")+ " ");
					System.out.print(rs.getString("uname")+ " ");
					System.out.print(rs.getInt("kor")+ " ");
					System.out.print(rs.getInt("eng")+ " ");
					System.out.print(rs.getInt("mat")+ " ");
					System.out.print(rs.getInt("tot")+ " ");
					System.out.print(rs.getInt("aver")+ " ");
					System.out.print(rs.getString("addr")+ " ");
					System.out.print(rs.getString("wdate")+ " ");
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
