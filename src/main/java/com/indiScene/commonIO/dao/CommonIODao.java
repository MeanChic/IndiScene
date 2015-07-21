package com.indiScene.commonIO.dao;

import java.util.List;

import com.indiScene.marketBoard.dto.MarketBoardDto;


public interface CommonIODao {

	public int getCommonBoardCount(String folderName,String searchWord, String searchType);

	public Object getCommonBoardList(int startRow, int endRow,
			String searchWord, String searchType, String folderName);
}
