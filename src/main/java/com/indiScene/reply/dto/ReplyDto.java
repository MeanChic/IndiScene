package com.indiScene.reply.dto;

import java.util.Date;

/**
@name  : ReplyDto
@date  : 2015. 7. 8.
@auther: 나혁진
@description :한줄댓글 처리를 위한 Dto 클래스 이다
 */
public class ReplyDto {
	private String board_num;
	private int reply_num;
	private String reply_content;
	private Date reply_date;
	private String artist_id;
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date date) {
		this.reply_date = date;
	}
	public String getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}

	
}
