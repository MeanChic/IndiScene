package com.indiScene.performBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.performBoard.dto.PerformBoardDto;

public interface PerformBoardDao {
	public int boardGroupNumberMax();	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
	public int insert(PerformBoardDto boardDto);
	public int getBoardCount();
	public List<PerformBoardDto> getBoardList(int startRow, int endRow);
}
