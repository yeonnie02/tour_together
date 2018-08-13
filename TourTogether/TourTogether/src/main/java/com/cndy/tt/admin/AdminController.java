package com.cndy.tt.admin;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cndy.tt.member.Member;
import com.cndy.tt.paging.PagingService;
import com.cndy.tt.paging.PagingVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="pagingService")
	private PagingService pagingService;
	
	@RequestMapping(value="admin_mem.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String memCont(Model model, PagingVo pagingVo, HttpSession session) {
		List<Member> list = pagingService.selectAdminPagingService(pagingVo);
		pagingVo.setTotal(pagingService.selectAdminTotalPagingService());
		model.addAttribute("list", list);
		session.setAttribute("pagingVo", pagingVo);
		
		return "admin_mem";
	}
	
	@RequestMapping(value="searchMem.do", method= {RequestMethod.POST})
	public String memSearch(Model model, PagingVo pagingVo, HttpSession session,
								@RequestParam(value="searchOpt") String searchOpt,
								@RequestParam(value="inputText") String inputText) {
		List<Member> list = pagingService.selectAdminSearchPagingService(searchOpt, inputText, pagingVo);
		pagingVo.setTotal(pagingService.selectAdminSearchTotalPagingService(searchOpt, inputText));
		model.addAttribute("list", list);
		model.addAttribute("searchOpt", searchOpt);
		model.addAttribute("inputText", inputText);
		
		session.setAttribute("pagingVo", pagingVo);
		
		return "admin_search";
	}
	
	@RequestMapping(value="admin_stat_join.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView chartJoin(Model model) {
		List<Member> chartDate = adminService.chartDateService();
		List<Integer> chartNum = adminService.chartNumService();
		model.addAttribute("chartCount", chartNum);
		String view = "admin_stat_join";
		ModelAndView mv = new ModelAndView(view, "chart", chartDate);
		return mv;
	}
	
	@RequestMapping(value="admin_stat_gen.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView chartGend(Model model) {
		int chartGenF = adminService.chartGenFService();
		int chartGenM = adminService.chartGenMService();
		int chartClsA = adminService.chartClsAService();
		int chartClsP = adminService.chartClsPService();
		model.addAttribute("chartGenF", chartGenF);
		model.addAttribute("chartClsA", chartClsA);
		model.addAttribute("chartClsP", chartClsP);
		String view = "admin_stat_genNcls";
		ModelAndView mv = new ModelAndView(view, "chartGenM", chartGenM);
		return mv;
	}
	
	@RequestMapping(value="changeChart.do")
	@ResponseBody
	public JSONArray buttonSearch(@RequestParam("startYear") int startYear,
								@RequestParam("startMonth") int startMonth,
								@RequestParam("endYear") int endYear,
								@RequestParam("endMonth") int endMonth) {
		
		JSONArray json = new JSONArray();
		JSONObject object = null;

		List<Date> newChartDate = adminService.newChartDateService(startYear, startMonth, endYear, endMonth);
		List<Integer> newChartCount = adminService.newChartCountService(startYear, startMonth, endYear, endMonth);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(Date date : newChartDate) {
			object = new JSONObject();
			String dateStr = dateFormat.format(date);
			
			object.put("Date", dateStr);
			System.out.println("object: "+object);
			json.add(object);			
		}
		for(Integer i : newChartCount) {
			object = new JSONObject();
			
			object.put("CountData", i);
			json.add(object);
		}
		return json;
	}
} 
