package com.cndy.tt.admin;

import java.sql.Date;

public class Member {
	private String email;
	private String telephone;
	private String pwd;
	private String firstName;
	private String lastName;
	private String profile_path;
	private int mem_class;
	private Date join_date;
	private Date use_date;
	private String intro;
	private String country;
	private String gender;
	
	public Member() {}
	public Member(String email, String telephone, String pwd, String firstName, String lastName, String profile_path,
			int mem_class, Date join_date, Date use_date, String intro, String country, String gender,
			Date join_Date2) {
		super();
		this.email = email;
		this.telephone = telephone;
		this.pwd = pwd;
		this.firstName = firstName;
		this.lastName = lastName;
		this.profile_path = profile_path;
		this.mem_class = mem_class;
		this.join_date = join_date;
		this.use_date = use_date;
		this.intro = intro;
		this.country = country;
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public int getMem_class() {
		return mem_class;
	}
	public void setMem_class(int mem_class) {
		this.mem_class = mem_class;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getUse_date() {
		return use_date;
	}
	public void setUse_date(Date use_date) {
		this.use_date = use_date;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
