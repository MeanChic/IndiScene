package com.indiScene.performBoard.dto;

import java.util.Date;

import com.indiScene.commonIO.dto.CommonDto;

/**
@name  : MarketBoardDto
@date  : 2015. 6. 25.
@auther: 나혁진
@description :거래 게시판 db를 처리하기위한 dto
 */
public class PerformBoardDto implements CommonDto {
	private String board_num;
	private String zipcode;
	private String address;
	private String subject;

	private String content;
	private Date register_date;
	private int count;

	private String file_path;
	private String file_name;
	
	private String artist_id;
	
	private int seq_level;			//시퀀스레벨 	
	private int seq_num;			//시퀀스 번호 	
	private int group_num;			//그룹번호		

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

	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
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

	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}


	
}
