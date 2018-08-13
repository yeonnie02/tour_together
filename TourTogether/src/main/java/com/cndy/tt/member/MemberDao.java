package com.cndy.tt.member;

import java.util.List;

public interface MemberDao {
	void insert(Member member);
	long checkId(Member member); 
	Member profileContent(String id);
	long profileUpdate(Member member);
	List<Member> autoComplete(String b);
}
