package com.indiScene.performBoard.dao;

import java.util.List;

import com.indiScene.performBoard.dto.PerformBoardDto;

public interface PerformBoardDao {
	
	public int getCount();
	
	public List<PerformBoardDto> getMarketList(int startRow,int endRow);
	
	public int insert(PerformBoardDto marketBoardDto);
	
	public PerformBoardDto read(String boardNumber);
	
	public int count(String boardNumber);
	
	public String passCheck(String artist_id);
	
	public int delete(String board_num);
	
	public PerformBoardDto update(String board_num);
	
	public int updateOk(PerformBoardDto marketBoardDto);
	
}
