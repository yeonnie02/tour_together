package com.cndy.tt.member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	String tag = " [ MemberServiceImpl ] ";
	
	@Resource(name="memberDao")
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean insertService(Member member) {
		// 이용자의 비밀번호를 bcrypt 알고리듬으로 암호화하여 DB에 저장한다
		String encodedPassword = passwordEncoder.encode(member.getPassword());
		System.out.println(tag+ " encodedPassword: "+encodedPassword);
		member.setPassword(encodedPassword);
		System.out.println(tag+ " member : "+member.toString());
		
		if(memberDao.insert(member) && memberDao.insertAuthority(member.getId()))
			return true;
		else return false;
	}
	@Override
	public long checkIdService(Member member) {
		return memberDao.checkId(member);
	}
	@Override
	public Member profileContentService(String id) {
		return memberDao.profileContent(id);
	}
	@Override
	public long updateService(Member member) {
		return memberDao.profileUpdate(member);
	}

	@Override
	public String checkAuthorityService(String id) {
		return memberDao.checkAuthority(id);
	}

}
