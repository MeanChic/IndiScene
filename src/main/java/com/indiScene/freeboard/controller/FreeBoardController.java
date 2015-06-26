package com.indiScene.freeboard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.freeboard.dto.FreeBoardDto;
import com.indiScene.freeboard.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());

	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping(value="/freeBoard/write.do", method=RequestMethod.GET)
	public ModelAndView freeBoardWrite(HttpServletRequest request, HttpServletResponse response){
	
	logger.info("write test--------");	
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("request",request);
	
	freeBoardService.freeBoardWrite(mav);
		return mav;	
	}


	@RequestMapping(value="/freeBoard/write.do",method=RequestMethod.POST)
	
	public ModelAndView freeBoardWrite(HttpServletRequest request, HttpServletRequest response,FreeBoardDto freeBoardDto){
		
		logger.info("WriteOk------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("freeBoardDto",freeBoardDto);
		freeBoardService.freeBoardWriteOk(mav);
		
		return mav;	
	}

	@RequestMapping(value="/freeBoard/list.do", method=RequestMethod.GET)
	public ModelAndView freeBoardList(HttpServletRequest request, ModelAndView mav){
		logger.info("freeBoard List =======================");
		
		mav.addObject("request", request);
		freeBoardService.freeBoardList(mav);
		return mav;
	}
	/*
	*//**
	 * @name : noticeRead
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 읽기 
	 *//*
	@RequestMapping(value="/notice/read.do", method=RequestMethod.GET)
	public ModelAndView noticeRead(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeRead---------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		noticeService.noticeRead(mav);
		return mav;
	}
	
	*//**
	 * @name : noticeDelete
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 삭제 
	 *//*
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeDelete--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDelete(mav);
		return mav;
	}
	
	*//**
	 * @name : noticeDeleteOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 삭제확인
	 *//*
	@RequestMapping(value="/notice/deleteOk.do", method=RequestMethod.POST)
	public ModelAndView noticeDeleteOk(HttpServletRequest request, HttpServletRequest response){
		
		logger.info("noticeDeleteOk--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDeleteOk(mav);
		return mav;
	}
	
	*//**
	 * @name : noticeUpdate
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description :  공지사항 수정 
	 *//*
	@RequestMapping(value="/notice/update.do", method=RequestMethod.GET)
	public ModelAndView noticeUpdate(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeUpdate--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeUpdate(mav);
		
		return mav;
	}
	
	*//**
	 * @name : noticeUpdateOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 수정
	 *//*
	@RequestMapping(value="/notice/updateOk.do", method=RequestMethod.POST)
	public ModelAndView noticeUpdateOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto){ logger.info("noticeUpdateOk--------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);		//pageNumber
		mav.addObject("noticeDto",noticeDto);	//boardNumber, subject, content
		noticeService.noticeUpdateOk(mav);
		
		return mav;
	}
	*/
	
}
