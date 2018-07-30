package com.cndy.tt.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String ns = "com.spring.mybatis.BoardDTO";
	
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
		System.out.println(loc);
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
}
