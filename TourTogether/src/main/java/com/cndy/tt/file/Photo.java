package com.cndy.tt.file;

public class Photo {
	private long photo_no;
	private long diary_no;
	private String old_file_name;
	private String save_file_name;
	
	public Photo() {}
	
	public Photo(long photo_no, long diary_no, String old_file_name, String save_file_name) {
		this.photo_no = photo_no;
		this.diary_no = diary_no;
		this.old_file_name = old_file_name;
		this.save_file_name = save_file_name;
	}
	public long getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(long photo_no) {
		this.photo_no = photo_no;
	}
	public long getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(long diary_no) {
		this.diary_no = diary_no;
	}
	public String getOld_file_name() {
		return old_file_name;
	}
	public void setOld_file_name(String old_file_name) {
		this.old_file_name = old_file_name;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	
}
