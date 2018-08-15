package com.cndy.tt.board;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cndy.tt.file.HandlerFile;

@Repository("boardDao")
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String ns = "com.spring.mybatis.BoardDTO";
	
	private static final String CHATING = "file/chating/";
	
	@Autowired
	ServletContext servletContext;
	
	public List<BoardDTO> list(){
		List<BoardDTO> list = sqlSession.selectList(ns+".boardSelectAll");
		return list;
	}
	public List<BoardDTO> pageList(long page){
		List<BoardDTO> list = sqlSession.selectList(ns+".pageSelectAll",page);
		
		return list;
	}
	public void insert(BoardDTO dto,HttpSession session) {
		
		HashMap<String,Object> location = new HashMap<String,Object>();
		JSONArray loc = (JSONArray)session.getAttribute("position");
		String region = (String)session.getAttribute("region");
		System.out.println(region+" : "+loc);
		int board_no = sqlSession.insert(ns+".boardInsert", dto);
		board_no = dto.getBoard_no();
		location.put("board_no", board_no);
		for(int i=0;i<loc.size();i++){
			JSONObject obj = (JSONObject)loc.get(i);
			location.put("jb", obj.get("jb"));
			location.put("ib", obj.get("ib"));
			sqlSession.insert(ns+".locationInsert",location);
		}
		
	}
	public HashMap<String,String> chat_make(String chating_id1,String chating_id2){
		HashMap<String,String> email = new HashMap<String,String>();
		HashMap<String,String> result_chat = new HashMap<String,String>();
		email.put("chating_member",chating_id1);
		email.put("user_member",chating_id2);
		
		System.out.println(email);
		int num = sqlSession.selectOne(ns+".Chating_search", email);
		if(num>0){
			//Integer chating_room = sqlSession.selectOne(ns+".Chating_select", email);
			result_chat = sqlSession.selectOne(ns+".Chating_select", email);
			System.out.println("채팅방 번호 : "+result_chat.get("room_num"));
			System.out.println("채팅방 아이디1 : "+result_chat.get("chating_member"));
			System.out.println("채팅방 아이디2 : "+result_chat.get("user_member"));
			System.out.println("채팅방 내용 : "+result_chat.get("chating_content"));
			result_chat.put("chating_member", chating_id1);
			result_chat.put("user_member", chating_id2);
			return result_chat;
		}else{
			String webappRoot = servletContext.getRealPath("/");
			System.out.println(webappRoot);
			String filePath = webappRoot+CHATING;
			//Map<String, String> fileNames = new HandlerFile("D",webappRoot+CHATING).getUploadFileName();
			System.out.println("-----------");
			boolean bool = file_make(filePath,chating_id1+"-"+chating_id2+".txt");
			System.out.println(bool);
			if(bool) {
				email.put("chating_content", filePath+chating_id1+"-"+chating_id2+".txt");
				System.out.println("insert ----- ");
				int no = sqlSession.insert(ns+".chating_insert",email);
				String chat_no = email.get("chat_no");
				System.out.println("생성됨 번호 : "+chat_no);
				email.put("room_num", chat_no);
			}else{
				System.out.println("생성실패");
			}
		}
		return email;
	}
	boolean file_make(String filePath,String filename){
		System.out.println("filePath : "+filePath);
		File file = new File(filePath);
		FileWriter writer = null;
		if(!file.exists()){
			file.mkdirs();
			System.out.println("created directory successfully!");
			file = new File(filePath+filename);
			System.out.println(file);
		}else{
			file = new File(filePath+filename);
			System.out.println(file);
		}
		try{
			writer = new FileWriter(file);
			System.out.println("DONE");
		}catch(IOException e){
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(writer != null) writer.close();
			}catch(IOException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
}
