package com.indiScene.uploadBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.uploadBoard.dto.UploadBoardDto;

public interface UploadBoardDao {
	public int write(UploadBoardDto dto);
	public int boardGroupNumberMax();
	public void boardGroupNumberUpdate(HashMap<String,Integer> hMap);
	public int getBoardCount();
	public List<UploadBoardDto> getBoardList(HashMap<String,Integer> rowMap);
	public UploadBoardDto read(String board_num);
	public void readCount(String board_num);
	public int delete(HashMap<String,String> hMap);
	public int update(UploadBoardDto upload);
	public int likeCheck(HashMap<String,String> hMap);
	public int like(HashMap<String,String> hMap);
	public int likeUpdate(HashMap<String,String> hMap);
	public int checkLike(HashMap<String,String> hMap);
	public void copyBest(String board_num);
}
