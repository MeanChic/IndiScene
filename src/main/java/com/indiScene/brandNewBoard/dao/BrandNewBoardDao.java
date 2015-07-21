package com.indiScene.brandNewBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.brandNewBoard.dto.BrandNewBoardDto;

public interface BrandNewBoardDao {
	public List<BrandNewBoardDto> getBrandNewList(HashMap<String, Integer> rowMap);
	public int getBrandNewCount();
	public void readCount(String board_num);
	public BrandNewBoardDto read(String board_num);
}
