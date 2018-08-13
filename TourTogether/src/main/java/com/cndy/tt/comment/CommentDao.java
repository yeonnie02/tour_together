package com.cndy.tt.comment;

import java.util.HashMap;
import java.util.List;

public interface CommentDao {
	List<Comment> list(long board_no);
	void insert(Comment comment);
	void insertReply(Comment comment);
	void updateSteps(HashMap<String, Object> map);
	int maxStep(HashMap<String, Object> map);
	int countLev(HashMap<String, Object> map);
}
