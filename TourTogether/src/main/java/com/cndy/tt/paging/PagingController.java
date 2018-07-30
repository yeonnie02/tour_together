package com.cndy.tt.paging;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cndy.tt.diary.Diary;

@Controller
public class PagingController {
	@Resource(name="pagingService")
	private PagingService pagingService;
	
	@RequestMapping(value="diary/list.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String paging(Model model, PagingVo pagingVo, HttpSession session) {
		System.out.println("PagingController: paging()"+pagingVo);
		List<Diary> list = pagingService.selectPagingService(pagingVo);
		pagingVo.setTotal(pagingService.selectTotalPagingService());
		model.addAttribute("list", list);
		session.setAttribute("pagingVo", pagingVo);
		
		return "diary/diary_list";
	}
}
