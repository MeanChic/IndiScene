package com.indiScene.muse.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:MuseDao
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
public interface MuseDao {
	public MuseDto nameCheck(String muse_name);
	public int logup(MuseDto museDto);
	public MuseDto museCheck(String artist_id);
/*	public int boardGroupNumberMax();	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
	public int insert(PerformBoardDto boardDto);
	public int getBoardCount();
	public List<PerformBoardDto> getBoardList(int startRow, int endRow);
	public PerformBoardDto read(String board_num);*/
}
