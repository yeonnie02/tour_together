package com.cndy.tt.diary;

import java.util.List;

public interface DiaryService {
	List<Diary> listService();
	boolean insertService(Diary diary);
	void editService(Diary diary);
	void deleteService(long diary_no);
	List<Diary> contentService(long diary_no);
}
