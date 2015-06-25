package com.indiScene.muse.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.muse.service.MuseServiceImpl;
import com.indiScene.performBoard.dto.PerformBoardDto;
import com.indiScene.performBoard.service.PerformBoardServiceImpl;

/**
 * @name:MuseController
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
@Controller
public class MuseController {
	
	@Autowired
	private MuseServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:logup
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/logup.do", method=RequestMethod.GET)
	public ModelAndView logup(HttpServletRequest request, ModelAndView mav){
		mav.addObject("request", request);
		
		mav.setViewName("museCreate/logup");
		
		return mav;
	}
	
	/**
	 * @name:logup
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/logup.do", method=RequestMethod.POST)
	public ModelAndView logup(MultipartHttpServletRequest request, ModelAndView mav, MuseDto museDto){
		mav.addObject("request", request);
		mav.addObject("museDto", museDto);
		service.logup(mav);
		
		return mav;
	}
	
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/nameCheck.do", method=RequestMethod.GET)
	public ModelAndView nameCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--name Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		service.nameCheck(mav);
		return null;
	}
	
	/**
	 * @name:museCheck
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/museCheck.do", method=RequestMethod.GET)
	public ModelAndView museCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Check");
		mav.addObject("request", request);
		
		mav.addObject("response", response);
		service.museCheck(mav);
		return null;
	}
	
	/**
	 * @name:museMain
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/musemain.do", method=RequestMethod.GET)
	public ModelAndView museMain(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Check");
		mav.setViewName("museCreate/musemain");
		return mav;
	}
	/*@RequestMapping(value="/performBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, ModelAndView mav){
		mav.addObject("request", request);
		service.boardWrite(mav);
		mav.setViewName("performBoard/write");
		
		return mav;
	}
	
	@RequestMapping(value="/performBoard/write.do", method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, PerformBoardDto boardDto){
		logger.info("-- Write Post=========================");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("boardDto", boardDto);
		service.writeOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/performBoard/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, ModelAndView mav){
		logger.info("ch List =======================");
		
		mav.addObject("request", request);
		service.list(mav);
		return mav;
	}
	
	@RequestMapping(value="/performBoard/read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request, ModelAndView mav){
		logger.info("ch Read =========================");
		mav.addObject("request", request);
		
		service.read(mav);
		
		return mav;
	}
	*/
}
