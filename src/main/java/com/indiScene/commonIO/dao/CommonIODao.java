package com.indiScene.commonIO.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.commonIO.dto.CommonMusicDto;


public interface CommonIODao {

	public int getCommonBoardCount(String folderName,String searchWord, String searchType);

	public Object getCommonBoardList(int startRow, int endRow,
			String searchWord, String searchType, String folderName);
	
	public List<CommonMusicDto> getUploadMusic(HashMap<String,Object> rowMap);
	public List<CommonMusicDto> getMuseMusic(HashMap<String,Object> rowMap);
	public List<CommonMusicDto> getLikeMusic(HashMap<String,Object> rowMap);
	public List<CommonMusicDto> getUploadCollabo(HashMap<String,Object> rowMap);
	public List<CommonMusicDto> getMuseCollabo(HashMap<String,Object> rowMap);
	public int getUploadCount(String artist_id);
	public int getLikeCount(String artist_id);
	public int getCollaboCount(String artist_id);
}
