package com.cndy.tt.member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("firstname")//세션
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
    @RequestMapping(value = "/add03", method = RequestMethod.POST)
    @ResponseBody//자바 객체를 HTTP 요청의 body 내용으로 매핑하는 역할
    public long add03(@ModelAttribute Member member, HttpSession session) {//객체구조가 같은건가 어떻게 Member타입 객체에 알아서 저장되지? http://springmvc.egloos.com/535572
        System.out.println("MemberController - add03()");
        System.out.println("id : "+member.getId());
        System.out.println("first_name : "+member.getFirst_name());
        System.out.println("last_name: "+member.getLast_name());
        System.out.println("gender : "+member.getGender());
        System.out.println("birthday : "+member.getBirthday());
        System.out.println("email : "+member.getEmail());
       /* if(member.getGender()==null) {//처리안하면 오류 왜? -> 뷰단에서 넘겨받은 gender값이 java의 null과 같지 않은 듯 -> Member.xml에서 이 로직을 대신해서 처리해둠
        	//nested exception is org.springframework.jdbc.UncategorizedSQLException: Error setting null for parameter #4 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property.
        	member.setGender("0");
        }*/
        session.setAttribute("email", member.getEmail());
        session.setAttribute("id", member.getId());//로그인할때 페북에서 매번 정보를 가져오는데 그 정보를 세션에 저장//이렇게하면 안대는건감
        long checkIdNum = memberService.checkIdService(member);//해당 id의 행 갯수 count를 리턴하지말고 list해서 가져오는게 좋을 까? 단위 속도는 행갯수만 가져오는게 빠르겠지?
        
        if(checkIdNum < 1)//페이스북에서 넘어온 id값이 db에 없을 때만 db에 저장
        	memberService.insertService(member);
        
        return checkIdNum;
    }
    @RequestMapping(value = "/sessionoff", method = RequestMethod.POST)
    public void sessionOff(HttpSession session) {
    	System.out.println("MemberController - sessionOff()");
    	session.invalidate();
    	//session.removeAttribute("member");
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    //@ResponseBody
    public String profile(Model model, HttpServletRequest request) {
    	System.out.println("MemberController - profile()");
    	HttpSession session = request.getSession();
    	String id = (String) session.getAttribute("id");
    	Member member = memberService.profileContentService(id);//여기 오류면 다시 로그인하면됨-세션만료되서 id값이 null인듯

        model.addAttribute("member", member);
    	model.addAttribute("firstname", member.getFirst_name());
    	model.addAttribute("lastname", member.getLast_name());
    	model.addAttribute("gender", member.getGender());
    	model.addAttribute("birthday", member.getBirthday());
    	model.addAttribute("email", member.getEmail());
    	
    	//"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=107653436827534&height=50&width=50&ext=1532586109&hash=AeRTJwySruGrzWKS"
    	
    	//File fStore = new File(Path.FILE_STORE+"20180613063200aae0f291-4828-46da-a39e-524101ae7322.jpg");
/*		if(!fStore.exists()) fStore.mkdirs();

        File files[] = fStore.listFiles();
        if(files.length == 0){
        }else{
	        for(File f: files){
	        	
	        }
        }*/
        
    	/*  response.setContentType( "image/gif" ); 
    	  ServletOutputStream os;
		try {
			os = response.getOutputStream();
			 String imgpath = null;
			  File f = new File(Path.FILE_STORE+"20180613063200aae0f291-4828-46da-a39e-524101ae7322.jpg");
			  if(f.exists()){
				  imgpath = Path.FILE_STORE+"20180613063200aae0f291-4828-46da-a39e-524101ae7322.jpg"; 
				  
			  } 
	    	  FileInputStream fis = new FileInputStream(imgpath);  
	    	  int length; 
	    	  byte[] buffer = new byte[10];
	    	  while ( ( length = fis.read( buffer ) ) != -1 ) 
	    	  os.write( buffer, 0, length );   

		} catch (IOException e) {
			e.printStackTrace();
		}
    	 */
    	  //model.addAttribute("img", f);
    	return "member/profile";
    }
    
    @RequestMapping("/userpic")
    public String listAttach(HttpSession session, HttpServletResponse response) {
    	  response.setContentType( "image/gif" ); 
    	  ServletOutputStream os;
    	  FileInputStream fis = null;
		try {
			os = response.getOutputStream();
			 String imgpath = null;
			  File f = new File(Path.FILE_STORE+"20180613063200aae0f291-4828-46da-a39e-524101ae7322.jpg");
			  if(f.exists()){
				  imgpath = Path.FILE_STORE+"20180613063200aae0f291-4828-46da-a39e-524101ae7322.jpg"; 
			  } 
	    	  fis = new FileInputStream(imgpath);  
	    	  int length; 
	    	  byte[] buffer = new byte[10];
	    	  while ( ( length = fis.read( buffer ) ) != -1 ) 
	    	  os.write( buffer, 0, length );   
	    	  return null;

		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    }

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute Member member, HttpSession session) {
		System.out.println("MemberController - update()");
		System.out.println("intro : "+member.getIntro());
		member.setId((String)session.getAttribute("id"));
		long count = memberService.updateService(member);
		if(count>0) {
			System.out.println("update completed..");
		}else {
			System.out.println("nothing completes..");
		}
		return "redirect:/member/profile";
	}

}
