package com.indiScene.brandNewBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.brandNewBoard.service.BrandNewBoardService;

/**
 * @type : BrandNewBoardController
 * @date : 2015. 7. 22.
 * @author : MS
 * @description : 신곡게시판의 요청을 받아주는 클래스
 */
@Controller
public class BrandNewBoardController {
	@Autowired
	private BrandNewBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name : brandNewList
	 * @date : 2015. 7. 22.
	 * @author : Kim MinSic
	 * @description : 신곡 List 요청을 받는다.
	 */
	@RequestMapping(value="/brandNewBoard/list.do", method=RequestMethod.GET)
	public ModelAndView brandNewList(HttpServletRequest request){
		logger.info("brandNewBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.brandNewList(mav);
		
		return mav; 
	}
	
	/**
	 * @name : read
	 * @date : 2015. 7. 22.
	 * @author : Kim MinSic
	 * @description : 신곡 게시물을 읽는다.
	 */
	@RequestMapping(value="/brandNewBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("brandNewBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
}
