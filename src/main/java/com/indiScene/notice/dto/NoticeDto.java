package com.indiScene.notice.dto;

import java.util.Date;

public class NoticeDto {
	private String subject;			//문자	문자varchar2(255)
	private String content;			//내용	문자varchar2(255)
	private Date register_date;		//날짜	날짜 Date
	private int count;				//조회수	숫자 Integer 
	private int seq_level;			//시퀀스레벨 	숫자 Integer 
	private int seq_num;			//시퀀스 번호 	숫자 Integer 
	private int group_num;			//그룹번호		숫자 Integer 
	private String board_num;		//게시판순번 	숫자 Integer 

	
	
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

	
	
	
}
