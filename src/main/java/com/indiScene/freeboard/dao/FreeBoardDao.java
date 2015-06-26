package com.indiScene.freeboard.dao;


import java.util.HashMap;
import java.util.List;

import com.indiScene.freeboard.dto.FreeBoardDto;

public interface FreeBoardDao {

	 public int insert(FreeBoardDto freeBoardDto);

	public int freeBoardGroupNumberUpdate(HashMap<String, Integer> hMap);

	public int freeBoardGroupNumberMax();

	public int getCount();

	public List<FreeBoardDto> getFreeBoardList(int startRow, int endRow);

	
	
	/* 
	
	
	public int noticeGroupNumberUpdate(HashMap<String, Integer> hMap);
	
	public int getCount();
	
	public List<NoticeDto> getNoticeList(int startRow, int endRow);
	
	public NoticeDto noticeRead(int board_num);
	
	public int noticeDelete(int board_num);
	
	public int noticeUpdate(NoticeDto noticeDto);
	
	public NoticeDto noticeUpdateSelect(int board_num);

	*/ 
}
