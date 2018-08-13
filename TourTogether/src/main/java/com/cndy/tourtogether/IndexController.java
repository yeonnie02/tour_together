package com.cndy.tourtogether;

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
}
