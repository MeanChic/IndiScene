package com.indiScene.performBoard.dao;

import java.util.HashMap;

public interface PlaceBoardDao {
	public int boardGroupNumberMax();	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
}
