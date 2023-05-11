package kr.co.mymelon.mediagroup;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller //객체생성 자동으로 해줌
//@RequestMapping("mediagroup/") -> 미리 설정해줄수도 있음
public class MediagroupCont {
	
	@Autowired
	private MediagroupDAO dao;
	
	
	public MediagroupCont() {
		System.out.println("-------ㅡMediagroupCont()객체 생성됨");
		//객체생성되면 호출됨
	}
	
	//미디어그룹 쓰기 페이지 호출
	//http://localhost:9095/mediagroup/create.do
	@RequestMapping(value="mediagroup/create.do", method=RequestMethod.GET)
	//값으로 mediagroup/create.do 가 들어오면 createForm()함수 실행
	public String createForm() {
		return "mediagroup/createForm";
		// /WEB-INF/views/mediagroup/createForm.jsp
	}//createForm() end
	
	@RequestMapping(value="mediagroup/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MediagroupDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt=dao.create(dto);
		if(cnt==0) {
			mav.setViewName("mediagroup/msgView");
			String msg1 = "<p>미디어 그룹 등록 실패</p>";
			String img = "<img src='../images/Jre.gif'>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}
		return mav;
	
	}//createProc() end
	
	
	
	

	/*
	@RequestMapping("mediagroup/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mediagroup/list");
		
		List<MediagroupDTO> list = dao.list();
		int totalRowCount=dao.totalRowCount(); //총 글갯수
		
		mav.addObject("list",list);
		mav.addObject("count", totalRowCount);
		
		return mav;
	}//list()end
	*/
	
	 @RequestMapping("mediagroup/list.do")
	    public ModelAndView list(HttpServletRequest req) {
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("mediagroup/list");
	       
	        int totalRowCount=dao.totalRowCount(); //총 글갯수
	       
	        //페이징
	        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
	        int pagePerBlock = 10;   // 페이지 리스트
	       
	        String pageNum=req.getParameter("pageNum");
	        if(pageNum==null){
	              pageNum="1";
	        }
	       
	        int currentPage=Integer.parseInt(pageNum);
	        int startRow   =(currentPage-1)*numPerPage+1;
	        int endRow     =currentPage*numPerPage;
	       
	        //페이지 수
	        double totcnt = (double)totalRowCount/numPerPage;
	        int totalPage = (int)Math.ceil(totcnt);
	         
	        double d_page = (double)currentPage/pagePerBlock;
	        int Pages     = (int)Math.ceil(d_page)-1;
	        int startPage = Pages*pagePerBlock;
	        int endPage   = startPage+pagePerBlock+1;
	       
	       
	        List list=null;     
	        if(totalRowCount>0){           
	              list=dao.list2(startRow, endRow);          
	        } else {           
	              list=Collections.EMPTY_LIST;           
	        }//if end
	         
	        //int number=0;
	        //number=totalRowCount-(currentPage-1)*numPerPage;
	         
	        //mav.addObject("number",    number);
	        mav.addObject("pageNum",   currentPage);
	        //mav.addObject("startRow",  startRow);
	        //mav.addObject("endRow",    endRow);
	        mav.addObject("count",     totalRowCount);
	        //mav.addObject("pageSize",  pagePerBlock);
	        mav.addObject("totalPage", totalPage);
	        mav.addObject("startPage", startPage);
	        mav.addObject("endPage",   endPage);
	        mav.addObject("list", list);
	        return mav;
	    }//list() end
	
	 
	@RequestMapping(value="mediagroup/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteProc(int mediagroupno){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mediagroup/deleteForm");
		mav.addObject("mediagruopno", mediagroupno);
		
		return mav;
		
	}
	
	@RequestMapping(value="mediagroup/delete.do", method=RequestMethod.POST)
	public ModelAndView deleteForm(int mediagroupno){
		ModelAndView mav = new ModelAndView();
		
		int cnt=dao.delete(mediagroupno);
		if(cnt==0) {
			mav.setViewName("mediagroup/msgView");
			String msg1 = "<p>미디어 그룹 삭제 실패</p>";
			String img = "<img src='../images/Jre.gif'>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}
		return mav;
		
	}
	
	@RequestMapping(value="mediagroup/update.do", method=RequestMethod.GET)
	public ModelAndView udateForm(int mediagroupno){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mediagroup/updateForm");
		mav.addObject("dto", dao.read(mediagroupno));		
		return mav;
		
	}
	
	@RequestMapping(value="mediagroup/update.do", method=RequestMethod.POST)
	public ModelAndView udateProc(@ModelAttribute MediagroupDTO dto){
		ModelAndView mav = new ModelAndView();
		
		int cnt=dao.update(dto);
		if(cnt==0) {
			mav.setViewName("mediagroup/msgView");
			String msg1 = "<p>미디어 그룹 수정 실패</p>";
			String img = "<img src='../images/Jre.gif'>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
