package com.indiScene.museGuest.dto;

import java.util.Date;

/**
 * @name:MuseGuestDto
 * @date :2015. 7. 7.
 * @author: 김정승
 * @description :	방명록의 저장되는 내용을 보관하는 DTO class
 */
public class MuseGuestDto {
	private int guest_num;
	private String muse_name;
	private String artist_id;
	private String guest_content;
	private Date guest_date;
	
	public int getGuest_num() {
		return guest_num;
	}
	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}
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
	public String getGuest_content() {
		return guest_content;
	}
	public void setGuest_content(String guest_content) {
		this.guest_content = guest_content;
	}
	public Date getGuest_date() {
		return guest_date;
	}
	public void setGuest_date(Date guest_date) {
		this.guest_date = guest_date;
	}
}
