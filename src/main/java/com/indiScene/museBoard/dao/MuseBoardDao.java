package com.indiScene.museBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.museBoard.dto.MuseBoardDto;

public interface MuseBoardDao {
	public int write(MuseBoardDto dto);
	public int boardGroupNumberMax();
	public void boardGroupNumberUpdate(HashMap<String,Integer> hMap);
	public int getBoardCount();
	public List<MuseBoardDto> getBoardList(HashMap<String,Integer> rowMap);
	public MuseBoardDto read(String board_num);
	public void readCount(String board_num);
	public int delete(String board_num);
	public int update(MuseBoardDto upload);
/*	public int likeCheck(HashMap<String,String> hMap);
	public int like(HashMap<String,String> hMap);
	public int likeUpdate(HashMap<String,String> hMap);
	public int checkLike(HashMap<String,String> hMap);
	public void copyBest(String board_num);*/
	public int museToUpload(MuseBoardDto board);
}
