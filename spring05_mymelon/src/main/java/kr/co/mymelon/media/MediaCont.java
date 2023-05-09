package kr.co.mymelon.media;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mymelon.mediagroup.MediagroupDTO;
import net.utility.UploadSaveManager;

@Controller
public class MediaCont {
	@Autowired
	private MediaDAO dao;
	
	public MediaCont() {
		System.out.println("------MediaCont() 객체 생성됨");
	}
	
	@RequestMapping("/media/list.do")
	public ModelAndView list(int mediagroupno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/list");
		mav.addObject("list", dao.list(mediagroupno));
		mav.addObject("mediagroupno", mediagroupno);
		return mav;
	}//list() end
	
	@RequestMapping(value="/media/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(int mediagroupno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/createForm");
		mav.addObject("mediagroupno", mediagroupno); //부모글번호
		
		return mav;
	
	}//createProc() end
	
	@RequestMapping(value="/media/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MediaDTO dto, HttpServletRequest req) {
					  //createProc(@String title, MultipartFile posterMF, MultipartFile filenameMF)
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/msgView");
		
		////////////////////////////////////////////////
		//첨부된 파일처리
		//->실제 파일은 /storage폴더에 저장
		//->저장된 파일 관련 정보는 media테이블에 저장
		
		//파일 저장 폴더의 실제 물리적인 경로 가져오기
		ServletContext application=req.getServletContext();
		String basePath=application.getRealPath("/storage");
		
		//1)<input type='file' name='posterMF'>
		MultipartFile posterMF=dto.getPosterMF(); //파일 가져오기
		// /storage폴더에 파일 저장하고, 리네임된 파일명 반환
		String poster=UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster); //리네임된 파일명을 dto객체 담기
		
		//2)<input type='file' name='filenameNF'>
		MultipartFile filenameMF = dto.getFilenameMF();
		String filename=UploadSaveManager.saveFileSpring30(filenameMF, basePath);
		dto.setFilename(filename);
		dto.setFilesize(filenameMF.getSize());
		////////////////////////////////////////////////
		
		int cnt=dao.create(dto);
		if(cnt==0) {
			String msg1 = "<p>음원 등록 실패</p>";
			String img = "<img src='../images/Jre.gif'>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			String msg1 = "<p>음원 등록 성공</p>";
			String img = "<img src='../images/Jre.gif'>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link2", link2);
		}
		
		return mav;
	
	}//createProc() end
	
	
	
	
	
	
	
	
	
	
}
