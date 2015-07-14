package com.indiScene.commonIO.dto;

import java.util.Date;

public interface CommonDto {
	public String getBoard_num();
	public void setBoard_num(String board_num);

	public String getZipcode();
	public void setZipcode(String zipcode);

	public String getAddress();
	public void setAddress(String address);

	public String getSubject();
	public void setSubject(String subject);

	public String getContent();
	public void setContent(String content);

	public Date getRegister_date();
	public void setRegister_date(Date register_date);

	public int getCount();
	public void setCount(int count);

	public String getFile_path();
	public void setFile_path(String file_path);

	public String getFile_name();
	public void setFile_name(String file_name);
	
	public String getArtist_id();
	public void setArtist_id(String artist_id); 
	
	public int getSeq_level();

	public void setSeq_level(int seq_level);
	public int getSeq_num();

	public void setSeq_num(int seq_num);
	
	public int getGroup_num();

	public void setGroup_num(int group_num);
	
	
}
