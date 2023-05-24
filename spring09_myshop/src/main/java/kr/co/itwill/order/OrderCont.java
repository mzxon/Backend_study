package kr.co.itwill.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.comment.CommentDAO;

@Controller
@RequestMapping("/order")
public class OrderCont {
	
	public OrderCont() {
		System.out.println("------OrderCont()객체생성됨");
	}
	

    @Autowired
    OrderDAO orderDao;
	
	@RequestMapping("/orderform")
	public String orderForm() {
		return "/order/orderForm";
	}
	
	@RequestMapping("/insert")
	public ModelAndView orderInsert(@ModelAttribute OrderDTO dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		
		//오늘날짜 및 현재시각을 문자열 "년월일시분초"로 구성해서 반환하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		//System.out.println(date);
		
		//주문서번호 생성 알고리즘
		// 예) 최초주문 202305231717231
		// 	   있으면 	202305231717232
		
		String orderno=orderDao.orderno(date);
		if(orderno.equals("1")) {
			orderno=date+"1";
		}else {
			int n =Integer.parseInt(orderno.substring(14))+1;
			orderno=date+n;
		}
		
		//System.out.println(orderno);
		
		//String s_id=session.getAttribute("s_id"); 실제구현
		String s_id="test"; //임시
		
		//2) 총결제금액 구하기
		int totalamount =orderDao.totalamount(s_id);
		
		//3)dto에 주문서번호, 총결제금액, 세션아이디 추가로 담기
		dto.setOrderno(orderno);
		dto.setTotalamount(totalamount);
		dto.setId(s_id);
		
		//4)orderlist테이블에 행 추가하기
		int cnt=orderDao.orderlistInsert(dto);
		System.out.println("orderlist테이블에 행 추가 결과 : " + cnt);
		if(cnt==1) {
			
			//5)cart테이블에 있는 주문상품을 orderdetail 테이블에 옮겨 담기
			HashMap<String, String> map=new HashMap<>();
			map.put("orderno", orderno);
			map.put("s_id", s_id);
			
			int result=orderDao.orderdetailInsert(map);
			System.out.println("orderdetail 테이블에 행 추가 결과 :" + result);

			/////////////////////////////////////////////////
			if(result!=0) {
				//6)cart테이블 비우기
				orderDao.cartDelete(s_id);
			}
			
			//7)주문내역서 메일 보내기
			mav.setViewName("order/msgView");
			mav.addObject("list", orderDao.orderlist(s_id));
			
			
		}
		return mav; 
	}
	


}
