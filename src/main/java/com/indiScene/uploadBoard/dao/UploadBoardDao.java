package com.indiScene.uploadBoard.dao;

import java.util.HashMap;

import com.indiScene.uploadBoard.dto.UploadBoardDto;

public interface UploadBoardDao {
	public int write(UploadBoardDto dto);
	public int boardGroupNumberMax();
	public void boardGroupNumberUpdate(HashMap<String,Integer> hMap);
}
