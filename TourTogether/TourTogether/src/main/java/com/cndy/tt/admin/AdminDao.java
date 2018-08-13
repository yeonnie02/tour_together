package com.cndy.tt.admin;

import java.util.Date;
import java.util.List;

import com.cndy.tt.member.Member;

public interface AdminDao {
	List<Member> initDateList();
	List<Integer> initNumList();
	List<Date> newDateList(int startYear, int startMonth, int endYear, int endMonth);
	List<Integer> newCountList(int startYear, int startMonth, int endYear, int endMonth);
	int chartGenFList();
	int chartGenMList();
	int chartClsAList();
	int chartClsPList();
}
