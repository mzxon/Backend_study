package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO { //Data Access Object
	 					 //데이터베이스 비지니스 로직 구현
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
	}
	
	public String loginProc(MemberDTO dto) {
		String result=null;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1') ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getString("mlevel");
			}
			
		} catch (Exception e) {
			System.out.println("로그인실패:"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return result;
	}
	
	public int duplecateID(String id) {
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT count(id) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		
		} catch (Exception e) {
			System.out.println("아이디중복확인실패:"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		
		
		
		
		
		return cnt;
	}
	
	
	
}
