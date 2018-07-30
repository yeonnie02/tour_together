package com.cndy.tt.paging;

import java.util.List;

import com.cndy.tt.diary.Diary;

public interface PagingDao {

	public List<Diary> selectPaging(PagingVo pagingVo);
	public int selectTotalPaging();
	
/*	public List<Paging> selectByWriter(PagingVo pagingVo);
	public int countSelectByWriter();*/
	
	public boolean insert(Diary diary);
	public boolean deleteAll();
	
}
