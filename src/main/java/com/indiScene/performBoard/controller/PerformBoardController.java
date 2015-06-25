package com.indiScene.performBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.performBoard.dto.PerformBoardDto;
import com.indiScene.performBoard.service.PerformBoardServiceImpl;

/**
 * @name:PerformBoardController
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
@Controller
public class PerformBoardController {
	
	@Autowired
	private PerformBoardServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:write
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/performBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, ModelAndView mav){
		mav.addObject("request", request);
		service.boardWrite(mav);
		mav.setViewName("performBoard/write");
		
		return mav;
	}
	
	/**
	 * @name:write
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/performBoard/write.do", method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, PerformBoardDto boardDto){
		logger.info("-- Write Post=========================");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("boardDto", boardDto);
		service.writeOk(mav);
		
		return mav;
	}
	
	/**
	 * @name:list
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/performBoard/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, ModelAndView mav){
		logger.info("ch List =======================");
		
		mav.addObject("request", request);
		service.list(mav);
		return mav;
	}
	
	/**
	 * @name:read
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/performBoard/read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request, ModelAndView mav){
		logger.info("ch Read =========================");
		mav.addObject("request", request);
		
		service.read(mav);
		
		return mav;
	}
	
}
