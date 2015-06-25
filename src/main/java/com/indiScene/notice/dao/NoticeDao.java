package com.indiScene.notice.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.notice.dto.NoticeDto;


public interface NoticeDao {

	public int noticeGroupNumberMax();
	public int insert(NoticeDto noticeDto);
	public int noticeGroupNumberUpdate(HashMap<String, Integer> hMap);
	public int getCount();
	public List<NoticeDto> getNoticeList(int startRow, int endRow);
	public NoticeDto noticeRead(int board_num);
	public int noticeDelete(int board_num);
	public int noticeUpdate(NoticeDto noticeDto);
	public NoticeDto noticeUpdateSelect(int board_num);


}
