package com.indiScene.notice.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.notice.dto.NoticeDto;


public interface NoticeDao {

	int noticeGroupNumberMax();
	
	int insert(NoticeDto noticeDto);

	int noticeGroupNumberUpdate(HashMap<String, Integer> hMap);

	int getCount();

	public List<NoticeDto> getNoticeList(int startRow, int endRow);

	public NoticeDto noticeRead(int board_num);
	
	public int noticeDelete(int board_num);


}
