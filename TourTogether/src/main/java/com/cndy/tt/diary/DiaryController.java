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

import com.cndy.tt.paging.PagingService;
import com.cndy.tt.paging.PagingVo;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	private String TAG = "DiaryController ";
	
	@Resource(name="diaryService")
	private DiaryService diaryService;
	
	@Resource(name="pagingService")
	private PagingService pagingService;
	
	@RequestMapping(value="list.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String paging(Model model, PagingVo pagingVo, HttpSession session) {
		System.out.println("paging(): " + pagingVo);
		List<Diary> list = pagingService.selectPagingService(pagingVo);
		pagingVo.setTotal(pagingService.selectTotalPagingService());
		model.addAttribute("list", list);
		session.setAttribute("pagingVo", pagingVo);
		
		return "diary/diary_list";
	}
	
	@RequestMapping(value="content.do", method= {RequestMethod.GET})
	public ModelAndView content(@RequestParam("diary_no") long diary_no) {
		System.out.println(TAG + "diary_no : "+ diary_no);
		List<Diary> content = diaryService.contentService(diary_no);
		String view = "diary/diary_content";
		ModelAndView mv = new ModelAndView(view, "diary", content);
		return mv;
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() {
		return "diary/diary_write";
	}	
}
