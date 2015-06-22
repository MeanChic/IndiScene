package com.indiScene.performBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.performBoard.dao.PlaceBoardDaoImpl;

@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	
	@Autowired
	private PlaceBoardDaoImpl boardDao;
}
