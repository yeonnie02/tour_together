package com.cndy.tt.paging;

import java.util.List;

import com.cndy.tt.diary.Diary;

public interface PagingService {
	
	public List<Diary> selectPagingService(PagingVo pagingVo);
	public int selectTotalPagingService();
	
	public boolean insertService(Diary diary);
	public boolean deleteAllService();
	
}
