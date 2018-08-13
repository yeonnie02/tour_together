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
@SessionAttributes("firstname")//����
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
    @RequestMapping(value = "/add03", method = RequestMethod.POST)
    @ResponseBody//�ڹ� ��ü�� HTTP ��û�� body �������� �����ϴ� ����
    public long add03(@ModelAttribute Member member, HttpSession session) {//��ü������ �����ǰ� ��� MemberŸ�� ��ü�� �˾Ƽ� �������? http://springmvc.egloos.com/535572
        System.out.println("MemberController - add03()");
        System.out.println("id : "+member.getId());
        System.out.println("first_name : "+member.getFirst_name());
        System.out.println("last_name: "+member.getLast_name());
        System.out.println("gender : "+member.getGender());
        System.out.println("birthday : "+member.getBirthday());
        System.out.println("email : "+member.getEmail());
       /* if(member.getGender()==null) {//ó�����ϸ� ���� ��? -> ��ܿ��� �Ѱܹ��� gender���� java�� null�� ���� ���� �� -> Member.xml���� �� ������ ����ؼ� ó���ص�
        	//nested exception is org.springframework.jdbc.UncategorizedSQLException: Error setting null for parameter #4 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property.
        	member.setGender("0");
        }*/
        session.setAttribute("id", member.getId());//�α����Ҷ� ��Ͽ��� �Ź� ������ �������µ� �� ������ ���ǿ� ����//�̷����ϸ� �ȴ�°ǰ�
        long checkIdNum = memberService.checkIdService(member);//�ش� id�� �� ���� count�� ������������ list�ؼ� �������°� ���� ��? ���� �ӵ��� �హ���� �������°� ��������?
        
        if(checkIdNum < 1)//���̽��Ͽ��� �Ѿ�� id���� db�� ���� ���� db�� ����
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
    	Member member = memberService.profileContentService(id);//���� ������ �ٽ� �α����ϸ��-���Ǹ���Ǽ� id���� null�ε�

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
