package com.indiScene.placeBoard.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.indiScene.placeBoard.dto.PlaceBoardDto;



public interface PlaceBoardService {
	
	public void enterBoard(ModelAndView mav);
	
	public void write(ModelAndView mav);
	
	public void read(ModelAndView mav);
	
	public void imageUpload(ModelAndView mav);
	
	public void delete(ModelAndView mav);
	
	public void deleteOk(ModelAndView mav);
	
	public void update(ModelAndView mav);
	
	public void updateOk(ModelAndView mav);
	
	public List<String> mainImageFind(List<PlaceBoardDto> marketList); 
	
	public void download(ModelAndView mav) throws Throwable;
	
}
