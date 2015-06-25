package com.indiScene.performBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:PerformBoardDao
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
public interface PerformBoardDao {
	public int boardGroupNumberMax();	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
	public int insert(PerformBoardDto boardDto);
	public int getBoardCount();
	public List<PerformBoardDto> getBoardList(int startRow, int endRow);
	public PerformBoardDto read(String board_num);
}
