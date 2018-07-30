package com.cndy.tt.paging;

import java.util.List;

import com.cndy.tt.admin.Member;
import com.cndy.tt.diary.Diary;

public interface PagingDao {

	public List<Diary> selectPaging(PagingVo pagingVo);
	public int selectTotalPaging();
	
	public boolean insert(Diary diary);
	public boolean deleteAll();
	
	public boolean insert(Diary diary);
	public boolean deleteAll();
	
	public List<Member> selectAdminPaging(PagingVo pagingVo);
	public int selectAdminTotalPaging();
	
	public List<Member> selectAdminSearchPaging(String searchOpt, String inputText, PagingVo pagingVo);
	public int selectAdminSearchTotalPaging(String searchOpt, String inputText);
}
