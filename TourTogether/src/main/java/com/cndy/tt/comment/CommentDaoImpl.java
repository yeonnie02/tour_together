package com.cndy.tt.comment;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "com.cndy.tt.mybatis.Comment.";
	
	@Override
	public List<Comment> list(long board_no) {
		List<Comment> comments = sqlSession.selectList(ns + "commentSelectAll", board_no);
		return comments;
	}

	@Override
	public void insert(Comment comment) {
		sqlSession.insert(ns + "commentInsert", comment);
	}

	@Override
	public void updateSteps(HashMap<String, Object> map) {
		sqlSession.update(ns + "UpdateSteps", map);
		
	}

	@Override
	public void insertReply(Comment comment) {
		sqlSession.insert(ns + "replyInsert", comment);
	}

	@Override
	public int maxStep(HashMap<String, Object> map) {
		int maxStep = sqlSession.selectOne(ns + "commentSelectMaxStep", map);
		return maxStep;
	}

	@Override
	public int countLev(HashMap<String, Object> map) {
		return sqlSession.selectOne(ns + "countLev", map);
	}
	
}
