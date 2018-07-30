package com.cndy.tt.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cndy.tt.member.Member;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao{
	
	@Autowired //
	private SqlSessionTemplate sqlSession;
	private String ns = "com.cndy.tt.mybatis.Member.";
	
	@Override
	public List<Member> initDateList() {
		List<Member> chart = sqlSession.selectList(ns + "initDateSelectAll");
		return chart;
	}
	
	@Override
	public List<Integer> initNumList() {
		List<Integer> chart = sqlSession.selectList(ns + "initCountSelectAll");
		//System.out.println("chart: "+chart);
		return chart;
	}

	@Override
	public List<Date> newDateList(int startYear, int startMonth, int endYear, int endMonth) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String endDate = null;
		
		String startDate = (startYear+"-"+startMonth+"-01");
		if(endMonth == 1 || endMonth == 3 || endMonth == 5 || endMonth == 7 || endMonth == 8 || endMonth == 10 || endMonth == 12) {
			endDate = (endYear+"-"+endMonth+"-31");
		}else if(endMonth == 2){
			endDate = (endYear+"-"+endMonth+"-28");
		}else {
			endDate = (endYear+"-"+endMonth+"-30");
		}
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		List<Date> newChart = sqlSession.selectList(ns + "newDateList", map);
		return newChart;
	}
	
	@Override
	public List<Integer> newCountList(int startYear, int startMonth, int endYear, int endMonth) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String endDate = null;
		
		String startDate = (startYear+"-"+startMonth+"-01");
		if(endMonth == 1 || endMonth == 3 || endMonth == 5 || endMonth == 7 || endMonth == 8 || endMonth == 10 || endMonth == 12) {
			endDate = (endYear+"-"+endMonth+"-31");
		}else if(endMonth == 2){
			endDate = (endYear+"-"+endMonth+"-28");
		}else {
			endDate = (endYear+"-"+endMonth+"-30");
		}
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		List<Integer> newChart = sqlSession.selectList(ns + "newCountList", map);

		return newChart;
	}

	@Override
	public int chartGenFList() {
		int chartF = sqlSession.selectOne(ns + "chartF");
		return chartF;
	}

	@Override
	public int chartGenMList() {
		int chartM = sqlSession.selectOne(ns + "chartM");
		return chartM;
	}

	@Override
	public int chartClsAList() {
		int chartClsA = sqlSession.selectOne(ns + "chartClsA");
		return chartClsA;
	}

	@Override
	public int chartClsPList() {
		int chartClsP = sqlSession.selectOne(ns + "chartClsP");
		return chartClsP;
	}
}
