package com.indiScene.notice.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.notice.dto.NoticeDto;
import com.indiScene.notice.service.NoticeService;

@Controller
public class NoticeController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response){
	
		logger.info("test----------");	
		ModelAndView mav=new ModelAndView();
		noticeService.test(mav);
	
		return mav;
	}
	
	@RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("write test--------");	
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeWrite(mav);
		
		return mav;	
	}
	
	@RequestMapping(value="/notice/write.do",method=RequestMethod.POST)
	//보내준 정보가 잘 갔는지 확인하는 구문 
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletRequest response,NoticeDto noticeDto){
		
		logger.info("WriteOk------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("noticeDto",noticeDto);
		noticeService.noticeWriteOk(mav);
		
		return mav;	
	}
	
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mav){
		logger.info("notice List =======================");
		
		mav.addObject("request", request);
		noticeService.noticeList(mav);
		return mav;
	}

	@RequestMapping(value="/notice/read.do", method=RequestMethod.GET)
	public ModelAndView noticeRead(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeRead---------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		noticeService.noticeRead(mav);
		return mav;
	}
	
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeDelete--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDelete(mav);
		return mav;
	}
	
	@RequestMapping(value="/notice/deleteOk.do", method=RequestMethod.POST)
	public ModelAndView noticeDeleteOk(HttpServletRequest request, HttpServletRequest response){
		
		logger.info("noticeDeleteOk--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDeleteOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/notice/update.do", method=RequestMethod.GET)
	public ModelAndView noticeUpdate(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeUpdate--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeUpdate(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/notice/updateOk.do", method=RequestMethod.POST)
	public ModelAndView noticeUpdateOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto){
		logger.info("noticeUpdateOk--------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);		//pageNumber
		mav.addObject("noticeDto",noticeDto);	//boardNumber, subject, content
		noticeService.noticeUpdateOk(mav);
		
		return mav;
	}
	
}
