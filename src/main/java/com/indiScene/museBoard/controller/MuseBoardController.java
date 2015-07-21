package com.indiScene.museBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.museBoard.dto.MuseBoardDto;
import com.indiScene.museBoard.service.MuseBoardService;

@Controller
public class MuseBoardController {
	
	@Autowired
	private MuseBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/museBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){
		logger.info("museBoard Write Start ------ ");
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("request",request);

		service.write(mav);	
		return mav;
	}
	
	@RequestMapping(value="/museBoard/write.do",method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, HttpServletResponse response, MuseBoardDto MuseBoardDto){
		logger.info("museBoard WriteOk Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("MuseBoardDto", MuseBoardDto);
		
		service.writeOk(mav);
		
		return mav;
	}
	
/*	@RequestMapping(value="/museBoard/record.do", method=RequestMethod.POST)
	public ModelAndView record(MultipartHttpServletRequest request, HttpServletResponse response){
		logger.info("record start");
		
		service.record(request,response);
		
		return null;
	}*/
	
	@RequestMapping(value="/museBoard/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request){
		logger.info("MuseBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.list(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("MuseBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request){
		logger.info("MuseBoard Update Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.update(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/update.do", method=RequestMethod.POST)
	public ModelAndView update(MultipartHttpServletRequest request, MuseBoardDto MuseBoard){
		logger.info("museBoard UpdateOK Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("MuseBoard", MuseBoard);
		
		service.updateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/delete.do",method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		logger.info("uploadBoard Delete Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.delete(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/delete.do",method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response){
		logger.info("uploadBoard DeleteOk Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.deleteOk(mav);
		
		return mav;
	}
	
/*	@RequestMapping(value="/museBoard/like.do",method=RequestMethod.GET)
	public ModelAndView like(HttpServletRequest request, HttpServletResponse response){
		logger.info("MuseBoard Like Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("response", response);
		service.like(mav);
		
		return null;
	}*/
	
	@RequestMapping(value="/museBoard/collabo.do", method=RequestMethod.GET)
	public ModelAndView collabo(HttpServletRequest request){
		logger.info("MuseBoard Collabo Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		service.collabo(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/collabo.do", method=RequestMethod.POST)
	public ModelAndView collabo(HttpServletRequest request, MuseBoardDto board){
		logger.info("upload CollaboOk Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("MuseBoardDto", board);
		
		service.collaboOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/museBoard/collaboAdopt.do", method=RequestMethod.POST)
	public ModelAndView collaboAdopt(MultipartHttpServletRequest request, HttpServletResponse response, MuseBoardDto board){
		logger.info("MuseBoard Collabo Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("response", response);
		mav.addObject("museBoard", board);
		
		service.collaboAdopt(mav);
		
		return null;
	}
	
	public ModelAndView museToUpload(HttpServletRequest request, HttpServletResponse response){
		logger.info("MuseBoard museToUpload Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("response", response);
		
		service.museToUpload(mav);
		
		return null;
	}
}
