package com.indiScene.bestBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.bestBoard.dto.BestBoardDto;

public interface BestBoardDao {
	public List<BestBoardDto> getBestList(HashMap<String, Integer> rowMap);
	public int getBestCount();
	public void readCount(String board_num);
	public BestBoardDto read(String board_num);
}
