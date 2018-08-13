package com.cndy.tourtogether;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index2() {
		return "index";
	}

	@RequestMapping(value = "/tour_together", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/home.do")
	public String home(){
		logger.info("Welcome Home!");
		return "index";
	}

	@RequestMapping(value = "/start", method = RequestMethod.POST, consumes = "application/json")
	//consumes 하는 형태는 application/json 형태이다.
	@ResponseBody //json 데이터를 받기위해 @ResponseBody 애너테이션
	public String startApp(@RequestBody String body) {
			System.out.println(body);
			return "/";		
	}
}
