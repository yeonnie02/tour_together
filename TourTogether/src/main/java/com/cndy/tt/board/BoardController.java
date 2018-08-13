package com.cndy.tt.board;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

@Controller
public class BoardController {
	@Resource(name="BoardService")
	private BoardService service;
	@RequestMapping(value = "/board.do")
	public ModelAndView board() {
	
		ModelAndView mv = new ModelAndView("board/board");
		List<BoardDTO> list = service.listService();
		
		mv.addObject("list", list);

		return mv;	
	}
	@RequestMapping(value="board/search.do")
	@ResponseBody
	public JSONArray scrollSearch(@RequestParam("page") long page) {
		
		JSONArray json = new JSONArray();
		JSONObject object = null;
		
		List<BoardDTO> dto = service.pageService(page);
		
		for(BoardDTO b : dto) {
			object = new JSONObject();
			object.put("data", b);
			json.add(object);
		}
		
		//System.out.println(json);
		return json;
	}
	@RequestMapping(value = "/insert.do")
	public String board_insert(Locale locale, Model model) {

		return "board/board_insert";	
	}
	@RequestMapping(value = "/test.do")
	public String board_test(Locale locale, Model model) {

		return "board/board_test";	
	}
	@RequestMapping(value="/detail.do")
	@ResponseBody
	public String board_detail(@RequestParam("position") String position,HttpSession session) {
		
		JSONParser jsParser = new JSONParser();
		Object ob = null;
		
		//System.out.println(session.getAttribute("position"));
		
		try {
			ob = jsParser.parse(position);
		}catch(ParseException pe){
			System.out.println(pe);
		}
		JSONArray json = (JSONArray)ob;
		//System.out.println(json);
		
		session.setAttribute("position", json);

		return "";
	}
	@RequestMapping(value="/content_in.do")
	public String content_insert() {
		return "board/board_detail";
	}
	@RequestMapping(value="/all_insert.do")
	public String all_insert(HttpSession session,
			@RequestParam("title") String title, @RequestParam("start_date") java.util.Date start_dateU,@RequestParam("end_date") java.util.Date end_dateU,
			@RequestParam("budget") int budget,@RequestParam("company") int company,@RequestParam("board_type") int board_type,
			@RequestParam("board_content") String board_content,@RequestParam("tour_time") int tour_time){
		
		//System.out.println(session.getAttribute("position"));
		
		Date start_date = new Date(start_dateU.getTime());
		Date end_date = new Date(end_dateU.getTime());
		BoardDTO dto = new BoardDTO(title,start_date,end_date,budget,company,board_type,board_content,tour_time);
		service.insert(dto, session);
		
		return "redirect:board.do";
	}
	@RequestMapping(value="board/list.do")
	public String board_list() {
		return "board/board_list";
	}	
	@RequestMapping(value="board/content.do")
	public String board_content() {
		return "board/board_content";
	}
	@RequestMapping(value="board/form.do")
	public String board_form() {
		return "board/board_form";
	}
//	@RequestMapping(value="/region.do")
//	public String region_select() {
//		return "board/region_select";
//	}
}
