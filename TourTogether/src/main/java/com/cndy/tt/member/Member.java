package com.cndy.tt.member;

import java.sql.Date;

public class Member {

	private String id;
	private String first_name;
	private String last_name;
	private String profile_path;
	private long member_class;
	private Date join_date;
	private Date use_date;
	private String intro;
	private String country;
	private String gender;
	private String birthday;//형식이 달라서 Date타입으로 받으면 콘솔에 오류(POST http://localhost:8080/tour_together/login/add03 400 ())
	private String email;
	private String telephone;
	
	public Member() {}
	public Member(String id, String first_name, String last_name, String gender, String birthday, String email) {//기본 정보만 테스트
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
	}
	
	public Member(String id, String first_name, String last_name, String profile_path, long member_class,
			Date join_date, Date use_date, String intro, String country, String gender, String birthday, String email,
			String telephone) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.profile_path = profile_path;
		this.member_class = member_class;
		this.join_date = join_date;
		this.use_date = use_date;
		this.intro = intro;
		this.country = country;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.telephone = telephone;
	}
	public String getId() {
		return id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public long getMember_class() {
		return member_class;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public Date getUse_date() {
		return use_date;
	}
	public String getIntro() {
		return intro;
	}
	public String getCountry() {
		return country;
	}
	public String getGender() {
		return gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getEmail() {
		return email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public void setMember_class(long member_class) {
		this.member_class = member_class;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public void setUse_date(Date use_date) {
		this.use_date = use_date;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}




}
