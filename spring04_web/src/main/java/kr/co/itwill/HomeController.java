package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//URL에서 요청, 응답이 가능한 클래스 지정
@Controller //-> 스프링컨테이너(Tomcat)이 자동으로 객체가 생성
public class HomeController {
	
	public HomeController() {
		System.out.println("------HomeController()객체 생성됨");
	}
	
	
	//요청 명령어 등록하고, 실행의 주체는 메소드(함수)
	
	//결과확인 http://localhost:9095/home.do
	@RequestMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav=new ModelAndView();
		// /WEB-INF/views/start.jsp
		mav.setViewName("start");
		
		//뷰페이지(start.jsp)와 값을 공유하기 위해 request 전역변수 활용하기
		//request.setAtrribute()와 동일한 함수
		mav.addObject("message", "어서오세요!");
		mav.addObject("img", "<img src='images/yellowstar.png'>");
		
		
		return mav;
	}
	
	
	
}
