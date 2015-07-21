package com.indiScene.bestBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.bestBoard.dto.BestBoardDto;
import com.indiScene.commonIO.dto.CommonMusicDto;

public interface BestBoardDao {
	public List<BestBoardDto> getBestList(HashMap<String, Integer> rowMap);
	public int getBestCount();
	public void readCount(String board_num);
	public BestBoardDto read(String board_num);
	public int musicAppend(HashMap<String,String> hMap);
	public List<CommonMusicDto> getMusicList(String artist_id);
	public List<CommonMusicDto> getMusicListMuse(String artist_id);
	public CommonMusicDto getAppendMusic(String board_num);
	public int musicListDelete(HashMap<String, String> hMap);
	public CommonMusicDto getAppendMusicMuse(String board_num);
}
