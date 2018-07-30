package com.cndy.tt.comment;

import java.util.List;

public interface CommentService {
	List<Comment> listService(long board_no);
	void insertService(Comment comment);
		
}
