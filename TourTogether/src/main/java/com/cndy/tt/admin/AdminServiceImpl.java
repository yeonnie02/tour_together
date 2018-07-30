package com.cndy.tt.admin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cndy.tt.member.Member;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Override
	public List<Member> chartDateService() {
		List<Member> chart = adminDao.initDateList();		
		return chart;
	}
	

	@Override
	public List<Integer> chartNumService() {
		List<Integer> chart = adminDao.initNumList();		
		return chart;
	}	
	

	@Override
	public List<Date> newChartDateService(int startYear, int startMonth, int endYear, int endMonth) {
		List<Date> newChart = adminDao.newDateList(startYear, startMonth, endYear, endMonth);		
		return newChart;
	}
	
	@Override
	public List<Integer> newChartCountService(int startYear, int startMonth, int endYear, int endMonth) {
		List<Integer> newChart = adminDao.newCountList(startYear, startMonth, endYear, endMonth);
		return newChart;
	}


	@Override
	public int chartGenFService() {
		int chartGenF = adminDao.chartGenFList();
		return chartGenF;
	}


	@Override
	public int chartGenMService() {
		int chartGenM = adminDao.chartGenMList();
		return chartGenM;
	}


	@Override
	public int chartClsAService() {
		int chartClsA = adminDao.chartClsAList();
		return chartClsA;
	}


	@Override
	public int chartClsPService() {
		int chartClsP = adminDao.chartClsPList();
		return chartClsP;
	}




}
