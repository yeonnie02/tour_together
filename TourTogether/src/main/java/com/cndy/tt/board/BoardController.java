package com.cndy.tt.board;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

@Controller
public class BoardController {
	@Resource(name="BoardService")
	private BoardService service;
	@RequestMapping(value = "board/board.do")
	public ModelAndView board() {
	
		ModelAndView mv = new ModelAndView("board/board");
		List<BoardDTO> list = service.listService();
		
		System.out.println(list.get(1).photo_path);
		
		mv.addObject("list", list);

		return mv;	
	}
	
    @RequestMapping(value = "board/region", method = RequestMethod.GET)
	public String region() {
		return "board/region_select";
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
	@RequestMapping(value = "board/insert.do")
	public String board_insert(@RequestParam("region") String region,HttpSession session) {

		System.out.println(region);
		session.setAttribute("region", region);
		return "board/board_insert";	
	}

	@RequestMapping(value="board/detail.do")
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
		System.out.println(session.getAttribute("position"));
		
		return "";
	}
	@RequestMapping(value="/board/content_in.do")
	public String content_insert() {
		return "board/board_form";
	}
	@RequestMapping(value="/board/all_insert.do")
	public String all_insert(HttpSession session,
			@RequestParam("title") String title, @RequestParam("start_date") java.util.Date start_dateU,@RequestParam("end_date") java.util.Date end_dateU,
			@RequestParam("budget") int budget,@RequestParam("company") int company,@RequestParam("board_type") int board_type,
			@RequestParam("board_content") String board_content,@RequestParam("tour_time") int tour_time, @RequestParam String photo_path){
		
		//System.out.println(session.getAttribute("position"));
		
		Date start_date = new Date(start_dateU.getTime());
		Date end_date = new Date(end_dateU.getTime());
		String region = (String)session.getAttribute("region");
		String email = (String)session.getAttribute("email");
		//System.out.println(photo_path+"------------------");
		session.removeAttribute("region");
		BoardDTO dto = new BoardDTO(title,email,start_date,end_date,budget,company,board_type,board_content,tour_time,region,photo_path);
		service.insert(dto, session);
		
		return "redirect:board.do";
	}

	@RequestMapping(value = "/board/form_board.do")
	public String form_dd() {
		System.out.println("form_dd");
		return "board/board_form";
	}
	@RequestMapping(value = "/board/form_content.do")
	public String form_content() {
		return "board/board_content";
	}
    @RequestMapping(value = "board/doA", method = RequestMethod.GET)
    public ModelAndView doA(@RequestParam("id") String id, HttpSession session){
        JSONObject cred = new JSONObject();
        JSONObject auth=new JSONObject();
        JSONObject parent=new JSONObject();
        cred.put("username","DaeHoo");
        cred.put("password", "pwd");
        auth.put("tenantName", "adm");
        auth.put("passwordCredentials", cred);
        parent.put("auth", auth);

        //URLConn conn = new URLConn("http://127.0.0.1",1516);
        //conn.urlPost(parent);
        //System.out.println("doA");
        System.out.println("id : "+session.getAttribute("id"));
        System.out.println("chat email : "+id);
        
        HashMap<String, String> chat = service.chat_service((String)session.getAttribute("id"), id);
        
        String path = chat.get("chating_content").replace("\\", "/");
        System.out.println("Controller : "+ chat.get("chating_content"));
        System.out.println("Controller path : "+path);
        chat.put("chating_content", path);
        
        ModelAndView mv = new ModelAndView("chat/chatting");
        mv.addObject("chat", chat);
        
        return mv;
    }
	@RequestMapping(value="/board/content.do")
	public String board_content(@RequestParam("no") int board_no) {
		System.out.println(board_no);
		return "board/board_content";
	}
	
	
}
