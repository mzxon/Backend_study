package kr.co.itwill.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentCont {
	
	public CommentCont() {
		System.out.println("-----CommentCont()객체 생성됨");
	}
	
	@Autowired
	CommentDAO commentDao;
	
	@RequestMapping("/insert")
	@ResponseBody
	public int mCommentServiceInsert(@RequestParam int product_code, @RequestParam String content)throws Exception {
		//System.out.println(product_code);
		//System.out.println(content);
	
		CommentDTO comment=new CommentDTO();
		comment.setProduct_code(product_code);
		comment.setContent(content);
		
		//로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
		//->session.getAttribute()
		//따로 폼을 구현하지 않았기 때문에 임시로 "test"
		comment.setWname("test");
		
		
		return commentDao.commentInsert(comment);
	}//mCommentServiceInsert() end
	
	
	@RequestMapping("/list")
	@ResponseBody
	public List<CommentDTO> mCommentServiceList(@RequestParam int product_code)throws Exception{
		return commentDao.commentlist(product_code);
	}
	
}
