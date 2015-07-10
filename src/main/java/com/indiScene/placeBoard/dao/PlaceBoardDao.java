package com.indiScene.placeBoard.dao;

import java.util.List;

import com.indiScene.placeBoard.dto.PlaceBoardDto;

public interface PlaceBoardDao {
	
	public int getCount();
	
	public List<PlaceBoardDto> getMarketList(int startRow,int endRow);
	
	public int insert(PlaceBoardDto marketBoardDto);
	
	public PlaceBoardDto read(String boardNumber);
	
	public int count(String boardNumber);
	
	public String passCheck(String artist_id);
	
	public int delete(String board_num);
	
	public PlaceBoardDto update(String board_num);
	
	public int updateOk(PlaceBoardDto marketBoardDto);
	
}
