package com.indiScene.marketBoard.dao;

import java.util.List;

import com.indiScene.marketBoard.dto.MarketBoardDto;

public interface MarketBoardDao {
	
	public int getCount();
	
	public List<MarketBoardDto> getMarketList(int startRow,int endRow, String searchWord, String searchType);
	
	public int insert(MarketBoardDto marketBoardDto);
	
	public MarketBoardDto read(String boardNumber);
	
	public int count(String boardNumber);
	
	public String passCheck(String artist_id);
	
	public int delete(String board_num);
	
	public MarketBoardDto update(String board_num);
	
	public int updateOk(MarketBoardDto marketBoardDto);

	//public int searchGetCount(String searchType, String searchWord);
	
}
