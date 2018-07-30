package com.cndy.tt.paging;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cndy.tt.admin.Member;
import com.cndy.tt.diary.Diary;

@Repository("pagingDao")
public class PagingDaoImpl implements PagingDao {
	
	private Logger logger = LoggerFactory.getLogger(PagingDaoImpl.class);
	private final String NS = "com.cndy.tt.mybatis.Paging.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Diary> selectPaging(PagingVo pagingVo) {
		logger.info("selectPaging() : " + pagingVo);
		return sqlSession.selectList(NS+"selectPaging", pagingVo);
	}
	

	@Override
	public int selectTotalPaging() {
		logger.info("selectTotalPaging()");
		return sqlSession.selectOne(NS+"selectTotalPaging");
	}

	
	@Override
	public boolean insert(Diary diary) {
		logger.info("insert() : " + diary);
		return sqlSession.insert(NS+"insert", diary)==1 ? true : false;
	}
	@Override
	public boolean deleteAll() {
		logger.info("deleteAll()");
		return sqlSession.delete(NS+"deleteAll")==0 ? true : false;
	}


	@Override
	public List<Member> selectAdminPaging(PagingVo pagingVo) {
		logger.info("selectPaging() : " + pagingVo);
		return sqlSession.selectList(NS+"selectAdminPaging", pagingVo);
	}
	
	@Override
	public int selectAdminTotalPaging() {
		logger.info("selectTotalPaging()");
		return sqlSession.selectOne(NS+"selectAdminTotalPaging");
	}

	@Override
	public List<Member> selectAdminSearchPaging(String searchOpt, String inputText, PagingVo pagingVo) {
		logger.info("selectAdminSearchPaging()");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("inputText", inputText);
		map.put("pagingVo", pagingVo);
		return sqlSession.selectList(NS+"selectAdminSearchPaging", map);
	}

	@Override
	public int selectAdminSearchTotalPaging(String searchOpt, String inputText) {
		logger.info("selectAdminSearchTotalPaging()");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("inputText", inputText);
		return sqlSession.selectOne(NS+"selectAdminSearchTotalPaging", map);
	}

}
