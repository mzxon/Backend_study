package kr.co.mymelon.mediagroup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service //Service도 됨
@Repository //모델클래스로 지정. 스프링컨테이너(톰캣)가 자동으로 객체 생성해줌
public class MediagroupDAO {
	
	//DBOpen dbopen=new DBOpen()과 동일한 형태
	@Autowired //스프링컨테이너가 생성해준 객체를 연결
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public MediagroupDAO() {
		System.out.println("-------ㅡMediagroupDAO()객체 생성됨");
		//객체생성되면 호출됨
	}
	
	
	//비즈니스 로직 구현
	
	public int create(MediagroupDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO mediagroup(mediagroupno, title) ");
			sql.append(" VALUES( mediagroup_seq.nextval, ?) ");
			
			cnt=jt.update(sql.toString(), dto.getTitle());
				
		} catch (Exception e) {
			System.out.println("미디어그룹등록실패 : "+e);
		}
		return cnt;
	}//create() end
	
	
	public List<MediagroupDTO> list(){
		List<MediagroupDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT mediagroupno, title ");
			sql.append(" FROM mediagroup ");
			sql.append(" ORDER BY mediagroupno DESC ");
			
			RowMapper<MediagroupDTO> rowMapper = new RowMapper<MediagroupDTO>() {
				
				@Override
				public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediagroupDTO dto = new MediagroupDTO();
				    dto.setMediagroupno(rs.getInt("mediagroupno"));
		            dto.setTitle(rs.getString("title"));
					return dto;
				}
			};
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("미디어그룹목록 실패 :"+e);
		}
		return list;
	}
	
	public int totalRowCount() {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) FROM mediagroup ");
			
			cnt=jt.queryForObject(sql.toString(), Integer.class);
			
		} catch (Exception e) {
			System.out.println("전체 행 갯수 : " + e);
		}
		return cnt;
	}
	
	public int delete(int mediagroupno) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" DELETE FROM mediagroup ");
			sql.append(" WHERE mediagroupno = ? ");
			cnt=jt.update(sql.toString(), mediagroupno);
			
			
		} catch (Exception e) {
			System.out.println("미디어그룹 삭제 실패 : "+e);
		}
		
		
		return cnt;
	}
	
}
