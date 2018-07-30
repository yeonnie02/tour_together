package com.cndy.tt.diary;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cndy.tt.comment.Comment;
import com.cndy.tt.comment.CommentService;


@Controller
@RequestMapping("/diary")
public class DiaryController {

	
	@Resource(name="diaryService")
	private DiaryService diaryService;
	

	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="content.do", method= {RequestMethod.GET})
	public ModelAndView content(@RequestParam("diary_no") long diary_no) {
		
		List<Diary> content = diaryService.contentService(diary_no);
		List<Comment> comments = commentService.listService(diary_no);
		
		String view = "diary/diary_content";
		ModelAndView mv = new ModelAndView(view, "diary", content);
		
		mv.addObject("comments", comments);
		return mv;
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() {
		return "diary/diary_write";
	}	
	
	@RequestMapping(value="write.do", method=RequestMethod.POST)
	public ModelAndView write(Diary diary) {
		
		ModelAndView mv = new ModelAndView();
		boolean flag = diaryService.insertService(diary);
		if(flag) {
			mv.addObject("result", true);
		}else {
			mv.addObject("result", false);
		}
		mv.setViewName("diary/result_msg");
		return mv;
	}
	
	@RequestMapping(value="delete.do")
	public String delete(@RequestParam("diary_no") long diary_no) {
		
		diaryService.deleteService(diary_no);
		return "redirect:/diary/list.do";
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("diary_no") long diary_no) {
		
		List<Diary> content = diaryService.contentService(diary_no);
		System.out.println("content "+content.get(0).getDiary_no());
		String view = "diary/diary_edit";
		ModelAndView mv = new ModelAndView(view, "diary", content);
		return mv;
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.POST)
	public String update(Diary diary) {
		
		System.out.println("DiaryController update: diary_no "+diary.getDiary_no()+" title "
				+diary.getTitle()+" email: "+ diary.getEmail()+" region: "+diary.getRegion()
				+diary.getCompany()+ " content "+diary.getDiary_content());
		diaryService.editService(diary);
		long diary_no = diary.getDiary_no();
		return "redirect:/diary/content.do?diary_no="+diary_no;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
