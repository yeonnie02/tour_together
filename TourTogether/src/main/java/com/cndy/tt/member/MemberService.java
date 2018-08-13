package com.cndy.tt.member;

public interface MemberService {
	void insertService(Member member);
	long checkIdService(Member member);
	Member profileContentService(String id);
	long updateService(Member member);
}
