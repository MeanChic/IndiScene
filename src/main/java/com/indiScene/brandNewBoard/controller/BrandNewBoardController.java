package com.indiScene.brandNewBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.brandNewBoard.service.BrandNewBoardService;

@Controller
public class BrandNewBoardController {
	@Autowired
	private BrandNewBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/brandNewBoard/list.do", method=RequestMethod.GET)
	public ModelAndView bestList(HttpServletRequest request){
		logger.info("brandNewBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.brandNewList(mav);
		
		return mav; 
	}
	
	@RequestMapping(value="/brandNewBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("brandNewBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
}
