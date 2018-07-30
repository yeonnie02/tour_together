package com.cndy.tt.diary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("diaryDao")
public class DiaryDaoImpl implements DiaryDao {
	private String TAG = "DiaryDaoImpl";
	
	@Autowired //
	private SqlSessionTemplate sqlSession;
	private String ns = "com.cndy.tt.mybatis.Diary.";

	@Override
	public List<Diary> list() {
		List<Diary> diaryList = sqlSession.selectList(ns + "diarySelectAll");
		return diaryList;
	}

	@Override
	public boolean insert(Diary diary) {
		int i = sqlSession.insert(ns + "diaryInsert", diary);
		if(i>0) return true;
		else return false;
	}

	@Override
	public void delete(long diary_no) {
		sqlSession.delete(ns + "diaryDelete", diary_no);
	}

	@Override
	public void edit(Diary diary) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Diary> content(long diary_no) {
		System.out.println(TAG + " diary_no: " + diary_no);
		List<Diary> content = sqlSession.selectList(ns + "diaryContent", diary_no); 
		System.out.println(TAG + "content: " + content);
		return content;
	}
	
}
