package com.cndy.tt.comment;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {

	@Resource(name="commentService")
	private CommentService commentService;
	
	/*@ReqeustMapping(value="diary/commentList.do")
	public void list()*/
	
	@RequestMapping(value="diary/insertComment.do", method=RequestMethod.POST)
	public String insert(Comment comment) {
		
		commentService.insertService(comment);
		long diary_no = comment.getBoard_no();
		return "redirect:/diary/content.do?diary_no="+diary_no;
	}
}
