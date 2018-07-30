package com.cndy.tt.admin;

import java.util.Date;
import java.util.List;

public interface AdminService {
	List<Member> chartDateService();
	List<Integer> chartNumService();
	List<Date> newChartDateService(int startYear, int startMonth, int endYear, int endMonth);
	List<Integer> newChartCountService(int startYear, int startMonth, int endYear, int endMonth);
	int chartGenFService();
	int chartGenMService();
	int chartClsAService();
	int chartClsPService();
}
