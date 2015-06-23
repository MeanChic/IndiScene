package com.indiScene.performBoard.dao;

import java.util.HashMap;

public interface PerformBoardDao {
	public int boardGroupNumberMax();	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
}
