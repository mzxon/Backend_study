package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class SungjukDAO { //Data Access Object
						  //데이터베이스 관련 비즈니스 로직 구현
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public SungjukDAO() { //기본생성자
		dbopen=new DBOpen();
	}
	
	//입력한 데이터 DB에 추가하기 (일반방법)
	public int insert(String uname, int kor, int eng, int mat, int aver, String addr) {
		int cnt=0; //성공 또는 실패 여부 반환
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)");
			sql.append(" VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uname);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, mat);
			pstmt.setInt(5, aver);
			pstmt.setString(6, addr);
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	//입력한 데이터 DB에 추가하기 (DTO 사용방법)
	public int create(SungjukDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)");
			sql.append(" VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}

	//DB에서 모든 데이터 가져오기 (SELECT & 반복문)
	public ArrayList<SungjukDTO> list() { //전체 목록 가져오기
		//데이터베이스에서 가져온 데이터(rs)를 한꺼번에 모아서 (ArrayList)
		//sungjukList.jsp에 전달한다.
		
		ArrayList<SungjukDTO> list=null;//<>제네릭 : 원하는 자료형만 모을 수 있도록
		//->SungjukDTO의 자료형만
		
		
		try {
			con=dbopen.getConnection(); //DB연결
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY wdate DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery(); //SQL문에서 선택된 데이터를 rs에 저장 
			if(rs.next()){
				list=new ArrayList<>(); //전체 행을 저장
				do {
					//커서가 가리키는 한 줄 저장
					SungjukDTO dto=new SungjukDTO();//SungjukDTO 객체 생성
					dto.setSno(rs.getInt("sno")); //rs의"sno"값을 가져와서 dto의 setSno(함수)에 넣기
					dto.setUname(rs.getString("uname")); //rs의 값을 가져와서 setUname을 통해 DTO클래스의 private 변수에 접근
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setWdate(rs.getString("wdate"));
					
					list.add(dto); //list에 저장
					
				}while(rs.next());
			}else {
				list=null;
			}
			
		} catch (Exception e) {
			System.out.println("목록실패:" + e);
		} finally {
			DBClose.close(con,pstmt,rs);
		}
		return list;
	}

	//조건에 맞는(sno) DB 출력하기
	public SungjukDTO read(int sno) {
		SungjukDTO dto=null;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
			}
		}catch (Exception e) {
			System.out.println("상세보기 실패 :" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}
	
	//조건에 맞는 DB 삭제하기
	public int delete(int sno) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk");
			sql.append(" WHERE sno=?");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제실패 :"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	//사용자가 입력한 값으로 DB 업데이트하기
	public int update(SungjukDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=?, kor=?, eng=?, mat=?, addr=? ");
			sql.append(" WHERE sno=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setString(5, dto.getAddr());
			pstmt.setInt(6, dto.getSno());
			
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("행수정 실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}

}




















