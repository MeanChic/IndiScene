package com.indiScene.bestBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.bestBoard.service.BestBoardService;

@Controller
public class BestBoardController {
	@Autowired
	private BestBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/bestBoard/list.do", method=RequestMethod.GET)
	public ModelAndView bestList(HttpServletRequest request){
		logger.info("bestBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.bestList(mav);
		
		return mav; 
	}
	
	@RequestMapping(value="/bestBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("bestBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
}
