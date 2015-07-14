package com.indiScene.notice.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.notice.dto.NoticeDto;


public interface NoticeDao {

	public int noticeGroupNumberMax();
	
	public int insert(NoticeDto noticeDto);
	
	public int noticeGroupNumberUpdate(HashMap<String, Integer> hMap);
	
	public List<NoticeDto> getNoticeList(int startRow, int endRow);
	
	public NoticeDto noticeRead(String board_num);
	
	public int noticeDelete(String board_num);
	
	public int noticeUpdate(NoticeDto noticeDto);
	
	public NoticeDto noticeUpdateSelect(String board_num);

	public int getNoticeCount();

	

}
