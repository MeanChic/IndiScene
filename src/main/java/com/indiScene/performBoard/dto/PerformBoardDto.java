package com.indiScene.performBoard.dto;

import java.util.Date;

public class PerformBoardDto {
	private String subject;	//문자	VARCHAR2(255)
	private String content;	//문자	VARCHAR2(255)
	private Date register_date; //날짜	DATE
	private int count;	//	숫자	INTEGER
	private String file_path;	//문자	VARCHAR2(255)
	private String file_name;	//문자	VARCHAR2(255)
	private String zipcode;	//문자	VARCHAR2(255)
	private String address;	//문자	VARCHAR2(255)
	private Date d_day;	//날짜	DATE
	private int group_num;	//숫자	INTEGER
	private int seq_level;	//숫자	INTEGER
	private int seq_num;	//숫자	INTEGER
	private String artist_id;	//(FK)	문자	VARCHAR2(255)
	private String board_num;	//(PK)	문자	VARCHAR2(255)
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getD_day() {
		return d_day;
	}
	public void setD_day(Date d_day) {
		this.d_day = d_day;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getSeq_level() {
		return seq_level;
	}
	public void setSeq_level(int seq_level) {
		this.seq_level = seq_level;
	}
	public int getSeq_num() {
		return seq_num;
	}
	public void setSeq_num(int seq_num) {
		this.seq_num = seq_num;
	}
	public String getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	
}
