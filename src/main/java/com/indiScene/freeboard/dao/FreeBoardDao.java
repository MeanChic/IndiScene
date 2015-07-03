package com.indiScene.freeboard.dao;


import java.util.HashMap;
import java.util.List;

import com.indiScene.freeboard.dto.FreeBoardDto;


public interface FreeBoardDao {

	 public int insert(FreeBoardDto freeBoardDto);

	public int freeBoardGroupNumberUpdate(HashMap<String, Integer> hMap);

	public int freeBoardGroupNumberMax();

	public List<FreeBoardDto> getFreeBoardList(int startRow, int endRow);

	public FreeBoardDto freeBoardRead(int board_num);
	
	public int freeBoardDelete(int board_num);

	public FreeBoardDto freeBoardUpdateSelect(int board_num);

	public int freeBoardUpdate(FreeBoardDto freeBoardDto);

	public int getFreeBoardCount();


}
