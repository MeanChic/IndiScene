package com.indiScene.muse.dto;

import java.util.Date;

/**
 * @name:MuseDto
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 동호회 개설및 관리 가입을 위한 DTO
 */
public class MuseDto {
	private String muse_name; 		//(PK)	문자	VARCHAR2(255)
	private String artist_id; 		//(PK)(FK)	문자	VARCHAR2(255)
	private String muse_comment; 	//문자	VARCHAR2(255)
	private Date muse_date; 		//날짜	DATE
	private String muse_filepath; 	//문자	VARCHAR2(255)
	
	public String getMuse_name() {
		return muse_name;
	}
	public void setMuse_name(String muse_name) {
		this.muse_name = muse_name;
	}
	public String getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}
	public String getMuse_comment() {
		return muse_comment;
	}
	public void setMuse_comment(String muse_comment) {
		this.muse_comment = muse_comment;
	}
	public Date getMuse_date() {
		return muse_date;
	}
	public void setMuse_date(Date muse_date) {
		this.muse_date = muse_date;
	}
	public String getMuse_filepath() {
		return muse_filepath;
	}
	public void setMuse_filepath(String muse_filepath) {
		this.muse_filepath = muse_filepath;
	}

}
