package com.indiScene.bestBoard.dto;

/**
 * @type : BestBoardDto
 * @date : 2015. 7. 20.
 * @author : Kim MinSic
 * @description : Bestboard table 대응된 DTO
 */
public class BestBoardDto {
	private String board_num;
	private int board_like;
	private String subject;
	private String content;
	private java.util.Date register_date;
	private int count;
	private String file_path;
	private String file_name;
	private int seq_level;
	private int seq_num;
	private int group_num;
	private String artist_id;
	private int genre_code;
	private String image_path;
	private java.util.Date best_date;

	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
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
	public java.util.Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(java.util.Date register_date) {
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
	public String getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}
	public int getGenre_code() {
		return genre_code;
	}
	public void setGenre_code(int genre_code) {
		this.genre_code = genre_code;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public java.util.Date getBest_date() {
		return best_date;
	}
	public void setBest_date(java.util.Date best_date) {
		this.best_date = best_date;
	}
}
