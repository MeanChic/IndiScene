package com.indiScene.commonIO.dto;

/**
@name  : CommonDto
@date  : 2015. 7. 5.
@auther: 나혁진
@description :공통부분을 상속하기위한 commonDto 인터페이스
 */
public interface CommonDto   {

	public String getContent();
	public void setContent(String content);

	public String getFile_path();
	public void setFile_path(String file_path);

	public String getFile_name();
	public void setFile_name(String file_name);

}
