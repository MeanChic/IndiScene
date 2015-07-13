package com.indiScene.uploadBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.uploadBoard.dto.UploadBoardDto;
import com.indiScene.uploadBoard.service.UploadBoardService;

@Controller
public class UploadBoardController {
	
	@Autowired
	private UploadBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/uploadBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){
		logger.info("upload Write Start ------ ");
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("request",request);

		service.write(mav);	
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/write.do",method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, HttpServletResponse response, UploadBoardDto uploadBoardDto){
		logger.info("upload WriteOk Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("uploadBoardDto", uploadBoardDto);
		
		service.writeOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/record.do", method=RequestMethod.POST)
	public ModelAndView record(MultipartHttpServletRequest request, HttpServletResponse response){
		logger.info("record start");
		
		service.record(request,response);
		
		return null;
	}
	
	@RequestMapping(value="/uploadBoard/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request){
		logger.info("uploadBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.list(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("uploadBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/update.do", method=RequestMethod.GET)
	public ModelAndView upload(HttpServletRequest request){
		logger.info("uploadBoard Update Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.update(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/update.do", method=RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest request, UploadBoardDto uploadBoard){
		logger.info("upload UpdateOK Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("uploadBoard", uploadBoard);
		
		service.updateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/uploadBoard/delete.do",method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		logger.info("uploadBoard Delete Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.delete(mav);
		
		return mav;
	}
}
