package kr.co.itwill.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.co.itwill.comment.CommentDTO;

@Controller
@RequestMapping("/product")
public class ProductCont {
	
	public ProductCont() {
		System.out.println("----ProductCont()객체 생성됨");
	}
	
	@Autowired
	ProductDAO productDao;
	
	//http://localhost:9095/product/write
	@RequestMapping("/write")
	public String write() {
		return "product/write";
	}//write() end
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map
					  ,@RequestParam MultipartFile img
					  ,HttpServletRequest req) {
		
		//System.out.println(map);
		//System.out.println(map.get("product_name"));
		//System.out.println(map.get("price"));
		//System.out.println(map.get("description"));
		
		//주의사항 : 파일업로드할 때 리네임 되지 않음
		//업로드된 파일은 /storage 폴더에 저장
		
		String filename="-";
		long filesize=0;
		if(img != null && !img.isEmpty()) {
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage"); //실제 경로
				img.transferTo(new File(path+"\\"+filename)); //파일저장
				
			} catch (Exception e) {
				e.printStackTrace(); //System.out.println(e);
			}
		}
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		productDao.insert(map);
		return "redirect:/product/list";
	}//insert() end
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", productDao.list());
		
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue="") String product_name) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", productDao.search(product_name));
		mav.addObject("product_name", product_name); //검색어
		return mav;
	}
	
	/*
		@RequestParam
		http://localhost:9095?aaa=bbb&ccc=ddd
		
		httP://localhost:9095/bbb/ddd
	
	*/
	
	//예)http://localhost:9095/product/detail/5
	@RequestMapping("detail/{product_code}")
	public ModelAndView detail(@PathVariable int product_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/detail");
		mav.addObject("product", productDao.detail(product_code));
		return mav;
	}
	
	@RequestMapping("/delete")
	public String delete(int product_code, HttpServletRequest req) {
		//삭제하고자 하는 파일명 가져오기
		String filename=productDao.filename(product_code);
		
		//첨부된 파일 삭제하기
		if(filename != null && !filename.equals("-")) {
			ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage"); //실제 물리적인 경로
			File file=new File(path+"\\"+filename);
			if(file.exists()) {
				file.delete();
			}
		}
		
		productDao.delete(product_code); //테이블 행 삭제
		
		return "redirect:/product/list";
		
	}//delete() end
	
	
	
	
	
	@RequestMapping("/update")
	public String update(@RequestParam Map<String, Object> map
					  	,@RequestParam MultipartFile img
					  	,HttpServletRequest req) {
		
		
		String filename="-";
		long filesize=0;
		
		if(img != null && !img.isEmpty()) {
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage"); //실제 경로
				img.transferTo(new File(path+"\\"+filename)); //파일저장
				
			} catch (Exception e) {
				e.printStackTrace(); //System.out.println(e);
			}//try end
		}else {
			int product_code=(int) map.get("product_code");
			Map<String, Object> product=productDao.detail(product_code);
			filename=product.get("FILENAME").toString();
			filesize=(long)product.get("FILESIZE");
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		productDao.update(map);
		return "redirect:/product/list";
	
	}//update()end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
