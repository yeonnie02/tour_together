package com.cndy.tt.paging;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
/*	@Override
	public List<Paging> selectByWriter(PagingVo pagingVo){
		logger.info("selectByWriter();"+ pagingVo);
		return sqlSession.selectList(NS+"SelectByWriter", pagingVo);
	}
*/
	@Override
	public int selectTotalPaging() {
		logger.info("selectTotalPaging()");
		return sqlSession.selectOne(NS+"selectTotalPaging");
	}

/*	@Override
	public int countSelectByWriter() {
		logger.info("countSelectByWriter()");
		return sqlSession.selectOne(NS+"CountSelectbyWriter");
	}*/
	
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

}
