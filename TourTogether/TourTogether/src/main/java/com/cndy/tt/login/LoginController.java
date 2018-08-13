package com.cndy.tt.login;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cndy.tt.member.Member;
import com.cndy.tt.member.MemberServiceImpl;

@Controller
@RequestMapping("/login")
public class LoginController {
	String tag= "[ LoginController ] ";
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {	
		System.out.println(tag+ " login()");
		return "login/loginForm";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {	
		System.out.println(tag+ " join()");
		return "login/join";
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(Member member) {
		System.out.println(tag+ " insert()");
		System.out.println(tag+ " member id: "+member.getId()+" password: "
				+" email: "+ member.getEmail());
		
		boolean result = memberService.insertService(member);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("login/result_msg");
		
		return mv;
	}
}
