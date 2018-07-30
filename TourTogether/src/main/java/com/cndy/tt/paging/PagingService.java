package com.cndy.tt.paging;

import java.util.List;


import com.cndy.tt.admin.Member;
import com.cndy.tt.diary.Diary;

public interface PagingService {
	
	public List<Diary> selectPagingService(PagingVo pagingVo);
	public int selectTotalPagingService();

	public boolean insertService(Diary diary);
	public boolean deleteAllService();
	
	public List<Member> selectAdminPagingService(PagingVo pagingVo);
	public int selectAdminTotalPagingService();
	
	public List<Member> selectAdminSearchPagingService(String searchOpt, String inputText, PagingVo pagingVo);
	public int selectAdminSearchTotalPagingService(String searchOpt, String inputText);
}
