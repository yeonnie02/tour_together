package com.cndy.tourtogether;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/tour_together", method = RequestMethod.GET)
	public String index2() {
		return "index";
	}
	
	/*
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:home.do";
	}
	
	@RequestMapping(value = "/home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/list.do")
	public String list(Model model) throws Exception {
		return "boardList";
	}
	
	@RequestMapping(value = "/content.do")
	public String content(@RequestParam Integer num,  Model model) throws Exception {
		return "boardView";
	}*/

}
