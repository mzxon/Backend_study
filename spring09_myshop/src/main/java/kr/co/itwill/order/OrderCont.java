package kr.co.itwill.order;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
public class OrderCont {
	
	public OrderCont() {
		System.out.println("------OrderCont()객체생성됨");
	}
	
	@RequestMapping("/orderform")
	public String orderForm() {
		return "/order/orderForm";
	}
	
	@RequestMapping("/insert")
	public ModelAndView orderInsert(@ModelAttribute OrderDTO dto, HttpSession session) {
		//오늘날짜 및 현재시각을 문자열 "년월일시분초"로 구성해서 반환하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		System.out.println(date);
		return null; 
	}
}
