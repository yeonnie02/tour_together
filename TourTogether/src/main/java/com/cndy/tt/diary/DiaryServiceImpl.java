package com.cndy.tt.diary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("diaryService")
public class DiaryServiceImpl implements DiaryService {
	@Resource(name="diaryDao")
	private DiaryDao diaryDao;
	
	@Override
	public List<Diary> listService() {
		return diaryDao.list();
	}

	@Override
	public boolean insertService(Diary diary) {
		return diaryDao.insert(diary);
	}

	@Override
	public void editService(Diary diary) {
		diaryDao.edit(diary);
	}

	@Override
	public void deleteService(long diary_no) {
		diaryDao.delete(diary_no);
	}

	@Override
	public List<Diary> contentService(long diary_no) {
		return diaryDao.content(diary_no);
	}
	
}
