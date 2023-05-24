package kr.co.itwill.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	public OrderDAO() {
		System.out.println("-----OrderDAO()객체생성됨");
	}
	
	@Autowired
	SqlSession sqlSession;

	public String orderno(String date) {
		return sqlSession.selectOne("order.orderno", date);
	}
	
	public int totalamount(String id) {
		return sqlSession.selectOne("order.totalamount", id);
	}
	
	public int orderlistInsert(OrderDTO dto) {
		return sqlSession.insert("order.orderlistInsert", dto);
	}
	
	public int orderdetailInsert(HashMap<String, String> map) {
		return sqlSession.insert("order.orderdetailInsert", map);
	}
	
	public int cartDelete(String id) {
		return sqlSession.delete("order.cartDelete", id);
	}
	
	public List<OrderDTO> orderlist(String id){
		return sqlSession.selectList("order.orderlist", id);
	}
	
}
