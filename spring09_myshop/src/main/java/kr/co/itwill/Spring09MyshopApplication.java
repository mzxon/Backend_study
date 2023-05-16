package kr.co.itwill;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
public class Spring09MyshopApplication { //시작클래스

	public static void main(String[] args) {
		SpringApplication.run(Spring09MyshopApplication.class, args);
	}
	
	//참조 spring08_mybatis 프로젝트 MemMainTest
	//Mapper 객체 생성
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean bean=new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		Resource[] res=new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*.xml");
		bean.setMapperLocations(res);
		return bean.getObject();
	}//sqlSessionFactory() end
	
	@Bean
	public SqlSessionTemplate sqlSesion(SqlSessionFactory factory) {
		return new SqlSessionTemplate(factory);
	}//sqlSession() end

}
