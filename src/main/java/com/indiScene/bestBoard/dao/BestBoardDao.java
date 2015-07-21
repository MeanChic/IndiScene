package com.indiScene.bestBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.bestBoard.dto.BestBoardDto;
import com.indiScene.uploadBoard.dto.UploadBoardDto;

public interface BestBoardDao {
	public List<BestBoardDto> getBestList(HashMap<String, Integer> rowMap);
	public int getBestCount();
	public void readCount(String board_num);
	public BestBoardDto read(String board_num);
	public int musicAppend(HashMap<String,String> hMap);
	public List<UploadBoardDto> getMusicList(String artist_id);
	public UploadBoardDto getAppendMusic(String board_num);
	public int musicListDelete(HashMap<String, String> hMap);
}
