package com.cndy.tt.comment;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="diary/insertComment.do", method=RequestMethod.POST)
	public String insert(Comment comment) {
		
		commentService.insertService(comment);
		long diary_no = comment.getBoard_no();
		return "redirect:/diary/content.do?diary_no="+diary_no;
	}
	
	@RequestMapping(value="diary/deleteComment.do")
	public String delete(Comment comment) {
		//리플 있는 댓글 지우기 방지 처리하려면 lev 받아와서
		long comment_no = comment.getComment_no();
		long board_no = comment.getBoard_no();
		long refer = comment.getRefer();
		commentService.deleteService(comment_no, refer);
		return "redirect:/diary/content.do?diary_no="+ board_no;
	}
	
	@ResponseBody
	@RequestMapping(value="diary/loadReply.do")
	public List<Comment> selectReply(@RequestParam("board_no")long board_no, @RequestParam("refer")long refer){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("refer", refer);
		List<Comment> replies = commentService.replyListService(map);
		return replies;
	}
}
