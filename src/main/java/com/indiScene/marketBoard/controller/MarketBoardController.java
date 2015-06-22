package com.indiScene.marketBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.marketBoard.service.MarketBoardService;





@Controller
public class MarketBoardController  {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MarketBoardService marketBoardService;
	
	
	@RequestMapping(value="/marketBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){
	logger.info("MarketBoardWrite------------------------------");
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("request",request);
	marketBoardService.enterBoard(mav);
	
	
	return null;
	
	}
	
	
		
}
