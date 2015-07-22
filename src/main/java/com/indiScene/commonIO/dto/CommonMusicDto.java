package com.indiScene.commonIO.dto;

public interface CommonMusicDto {
	public String getBoard_num() ;
	public void setBoard_num(String board_num) ;
	public int getBoard_like();
	public void setBoard_like(int board_like) ;
	public String getSubject();
	public void setSubject(String subject);
	public String getContent();
	public void setContent(String content);
	public java.util.Date getRegister_date();
	public void setRegister_date(java.util.Date register_date);
	public int getCount() ;
	public void setCount(int count);
	public String getFile_path();
	public void setFile_path(String file_path);
	public String getFile_name();
	public void setFile_name(String file_name);
	public int getSeq_level();
	public void setSeq_level(int seq_level);
	public int getSeq_num();
	public void setSeq_num(int seq_num);
	public int getGroup_num();
	public void setGroup_num(int group_num);
	public String getArtist_id();
	public void setArtist_id(String artist_id);
	public int getGenre_code();
	public void setGenre_code(int genre_code);
	public String getImage_path() ;
	public void setImage_path(String image_path);
	public String getMuse_name();
	public void setMuse_name(String muse_name);
}
