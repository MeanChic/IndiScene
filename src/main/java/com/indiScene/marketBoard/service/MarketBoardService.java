package com.indiScene.marketBoard.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.indiScene.marketBoard.dto.MarketBoardDto;



public interface MarketBoardService {
	
	public void enterBoard(ModelAndView mav);
	
	public void write(ModelAndView mav);
	
	public void read(ModelAndView mav);
	
	//public void imageUpload(ModelAndView mav);
	//CommonIOServce로 독립함
	
	public void delete(ModelAndView mav);
	
	public void deleteOk(ModelAndView mav);
	
	public void update(ModelAndView mav);
	
	public void updateOk(ModelAndView mav);

	
	//public List<String> mainImageFind(List<MarketBoardDto> marketList); 
	//CommonIOServce로 독립함
	
	//public void download(ModelAndView mav) throws Throwable;
	//CommonIOServce로 독립함
}
