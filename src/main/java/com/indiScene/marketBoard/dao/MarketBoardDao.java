package com.indiScene.marketBoard.dao;

import java.util.List;

import com.indiScene.marketBoard.dto.MarketBoardDto;

public interface MarketBoardDao {
	
	public int getCount();
	
	public List<MarketBoardDto> getMarketList(int startRow,int endRow);
	
	public int insert(MarketBoardDto marketBoardDto);
	
	public MarketBoardDto read(String boardNumber);
	
	public int count(String boardNumber);
}
