package kr.co.itwill.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
   
   public ProductDAO() {
      System.out.println("---------ProductDAO() 객체 생성");
   }//ProductDAO() end
   
   
   //스프링 빈으로 생성된 객체를 가져와서 연결하기
   @Autowired
   SqlSession sqlSession;
   
   public List<Map<String, Object>> list(){
      return sqlSession.selectList("product.list");
   }//list() end
   
   public void insert(Map<String, Object> map) {
	   sqlSession.insert("product.insert", map);
   }
   
   public List<Map<String, Object>> search(String product_name){
	   return sqlSession.selectList("product.search", "%" + product_name +"%");
   }
   
   public Map<String, Object> detail(int product_code){
	   return sqlSession.selectOne("product.detail", product_code);
   }
   
   public String filename(int product_code) {
	   return sqlSession.selectOne("product.filename", product_code);
   }
   
   public void delete(int product_code) {
	   sqlSession.delete("product.delete", product_code);
   }

}//class end
