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
	private NoticeService noticeServic;
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response){
	
		logger.info("test----------");	
		ModelAndView mav=new ModelAndView();
		noticeServic.test(mav);
		return mav;
	}
	@RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response){
		// reqeust와 response, Dto를 보내준다. 
		logger.info("write test--------");
			
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeServic.noticeWrite(mav);
		return mav;	
	}
	@RequestMapping(value="/notice/write.do",method=RequestMethod.POST)
	//보내준 정보가 잘 갔는지 확인하는 구문 
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletRequest response,NoticeDto noticeDto){
		logger.info("WriteOk------------------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("noticeDto",noticeDto);
		
		noticeServic.noticeWriteOk(mav);
		return mav;
		
		
	}
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, ModelAndView mav){
		logger.info("notice List =======================");
		
		mav.addObject("request", request);
		noticeServic.noticeList(mav);
		return mav;
	}
	
	
}
