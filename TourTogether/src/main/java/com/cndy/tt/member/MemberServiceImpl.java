package com.cndy.tt.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDao")
	private MemberDao memberDao;
	
	@Override
	public void insertService(Member member) {
		memberDao.insert(member);
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
}
