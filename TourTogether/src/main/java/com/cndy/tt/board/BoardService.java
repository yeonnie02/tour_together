package com.cndy.tt.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service("BoardService")
public class BoardService {
	@Resource(name="boardDao")
	private BoardDAO dao;
	public List<BoardDTO> listService(){
		return dao.list();
	}
	
	public List<BoardDTO> pageService(long page){
		return dao.pageList(page);
	}
	public void insert(BoardDTO dto,HttpSession session){
		dao.insert(dto,session);
	}
	public HashMap<String, String> chat_service(String chating_email1,String chating_email2){
		return dao.chat_make(chating_email1, chating_email2);
	}
}
