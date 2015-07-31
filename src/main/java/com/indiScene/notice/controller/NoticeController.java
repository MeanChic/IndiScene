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

/**
 * @name : NoticeController
 * @date : 2015. 6. 25.
 * @author : 손유진
 * @description : 공지사항 게시판 컨트롤러 
 */
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
	
	/**
	 * @name : noticeWrite
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항글 등록 (관리자만 가능)
	 */
	@RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("write test--------");	
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeWrite(mav);	
		return mav;	
	}
	
	/**
	 * @name : noticeWrite
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 글 등록확인
	 */
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
	
	/**
	 * @name : noticeList
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description :  공지사항목록  
	 */
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mav){
		logger.info("notice List =======================");
		
		mav.addObject("request", request);
		noticeService.noticeList(mav);
		return mav;
	}

	/**
	 * @name : noticeRead
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 읽기 
	 */
	@RequestMapping(value="/notice/read.do", method=RequestMethod.GET)
	public ModelAndView noticeRead(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeRead---------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		noticeService.noticeRead(mav);
		return mav;
	}
	
	/**
	 * @name : noticeDelete
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 삭제 
	 */
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeDelete--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDelete(mav);
		return mav;
	}
	
	/**
	 * @name : noticeDeleteOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 삭제확인
	 */
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.POST)
	public ModelAndView noticeDeleteOk(HttpServletRequest request, HttpServletResponse response){
		logger.info("noticeDeleteOk--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeDeleteOk(mav);
		return mav;
	}
	
	/**
	 * @name : noticeUpdate
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description :  공지사항 수정 
	 */
	@RequestMapping(value="/notice/update.do", method=RequestMethod.GET)
	public ModelAndView noticeUpdate(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("noticeUpdate--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		noticeService.noticeUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @name : noticeUpdateOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 공지사항 수정
	 */
	@RequestMapping(value="/notice/update.do", method=RequestMethod.POST)
	public ModelAndView noticeUpdateOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto){ logger.info("noticeUpdateOk--------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);		//pageNumber
		mav.addObject("noticeDto",noticeDto);	//boardNumber, subject, content
		noticeService.noticeUpdateOk(mav);
		
		return mav;
	}
	
}
