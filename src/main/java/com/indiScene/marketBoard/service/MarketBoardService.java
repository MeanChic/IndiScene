package com.indiScene.marketBoard.service;

import org.springframework.web.servlet.ModelAndView;



public interface MarketBoardService {
	
	public void enterBoard(ModelAndView mav);
	
	public void write(ModelAndView mav);
	
	public void read(ModelAndView mav);
	
	public void fileUpload(ModelAndView mav);
	
	
}
