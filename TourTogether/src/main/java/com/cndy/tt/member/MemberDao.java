package com.cndy.tt.member;

public interface MemberDao {
	boolean insert(Member member);
	long checkId(Member member); 
	Member profileContent(String id);
	long profileUpdate(Member member); 
	String checkAuthority(String id);
	boolean insertAuthority(String id);
	
}
