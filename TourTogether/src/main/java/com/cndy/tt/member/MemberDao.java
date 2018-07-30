package com.cndy.tt.member;

public interface MemberDao {
	void insert(Member member);
	long checkId(Member member); 
	Member profileContent(String id);
	long profileUpdate(Member member);
}
