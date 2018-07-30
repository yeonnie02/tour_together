package com.cndy.tt.paging;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cndy.tt.admin.Member;
import com.cndy.tt.diary.Diary;


@Service("pagingService")
public class PagingServiceImpl implements PagingService {
	
	@Autowired
	private PagingDao dao;
	
	@Override
	public List<Diary> selectPagingService(PagingVo pagingVo) {
		return dao.selectPaging(pagingVo);
	}
	@Override
	public int selectTotalPagingService() {
		return dao.selectTotalPaging();
	}

	@Override
	public boolean insertService(Diary diary) {
		return dao.insert(diary);
	}
	@Override
	public boolean deleteAllService() {
		return dao.deleteAll();
	}

	@Override
	public List<Member> selectAdminPagingService(PagingVo pagingVo) {
		return dao.selectAdminPaging(pagingVo);
	}
	@Override
	public int selectAdminTotalPagingService() {
		return dao.selectAdminTotalPaging();
	}
	@Override
	public List<Member> selectAdminSearchPagingService(String searchOpt, String inputText, PagingVo pagingVo) {
		return dao.selectAdminSearchPaging(searchOpt, inputText, pagingVo);
	}
	@Override
	public int selectAdminSearchTotalPagingService(String searchOpt, String inputText) {
		return dao.selectAdminSearchTotalPaging(searchOpt, inputText);
	}
}
