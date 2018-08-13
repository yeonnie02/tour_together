package com.cndy.tt.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "com.cndy.tt.mybatis.Member";

	@Override
	public void insert(Member member) {
        System.out.println("MemberDaoImpl - insert()");
        System.out.println("id : "+member.getId());
        System.out.println("first_name : "+member.getFirst_name());
        System.out.println("last_name: "+member.getLast_name());
        System.out.println("gender : "+member.getGender());
		sqlSession.insert(ns + ".memberInsert", member);
	}

	@Override
	public long checkId(Member member) {
		System.out.println("MemberDaoImpl - checkId()");
		return sqlSession.selectOne(ns + ".checkIdSelect", member);
	}
	@Override
	public Member profileContent(String id) {
		System.out.println("MemberDaoImpl - profileContent()");
		return sqlSession.selectOne(ns + ".profileSelect", id);//selectOne->select하면 왜안될까
	}

	@Override
	public long profileUpdate(Member member) {
		System.out.println("MemberDaoImpl - profileUpdate()");
		return sqlSession.update(ns + ".profileUpdate", member);
	}
	
	@Override
	public List<Member> autoComplete(String b) {
		System.out.println("MemberDaoImpl - autoComplete()");
		return sqlSession.selectList(ns+".autoComplete", b);
	}
}
