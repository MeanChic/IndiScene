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

/**
 * @name : FreeBoardController
 * @date : 2015. 6. 26.
 * @author : 손유진
 * @description : 자유게시판 컨트롤러 
 */
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

	/**
	 * @name : freeBoardWrite
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 자유게시글 등록 (자유롭게 이용가능 )
	 */
	@RequestMapping(value="/freeBoard/write.do",method=RequestMethod.POST)
	public ModelAndView freeBoardWrite(HttpServletRequest request, HttpServletRequest response,FreeBoardDto freeBoardDto){
		logger.info("board_Number ***" + freeBoardDto.getBoard_num());
		logger.info("WriteOk------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("freeBoardDto",freeBoardDto);
		freeBoardService.freeBoardWriteOk(mav);
	
		return mav;	
	}

	/**
	 * @name : freeBoardList
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 자유게시판 리스트 
	 */
	@RequestMapping(value="/freeBoard/list.do", method=RequestMethod.GET)
	public ModelAndView freeBoardList(HttpServletRequest request, ModelAndView mav){
		logger.info("freeBoard List =======================");
		
		mav.addObject("request", request);
		freeBoardService.freeBoardList(mav);
		return mav;
	}
	
	/**
	 * @name : freeBoardRead
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 자유게시글 읽기 
	 */
	@RequestMapping(value="/freeBoard/read.do", method=RequestMethod.GET)
	public ModelAndView freeBoardRead(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("freeBoard Read---------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		freeBoardService.freeBoardRead(mav);
		return mav;
	}
	
	/**
	 * @name : freeBoardDelete
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 자유게시글 삭제 ( 본인만 가능 ) 
	 */
	@RequestMapping(value="/freeBoard/delete.do", method=RequestMethod.GET)
	public ModelAndView freeBoardDelete(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("freeBoardDelete--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		freeBoardService.freeBoardDelete(mav);
		
		return mav;
	}
	/**
	 * @name : freeBoardDeleteOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 삭제 확인 
	 */
	@RequestMapping(value="/freeBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView freeBoardDelete(HttpServletRequest request, HttpServletRequest response){
		
		logger.info("freeBoardDeleteOk--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		freeBoardService.freeBoardDeleteOk(mav);
		return mav;
	}
	

	/**
	 * @name : freeBoardUpdate
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 자유게시판 게시글 수정
	 */
	@RequestMapping(value="/freeBoard/update.do", method=RequestMethod.GET)
	public ModelAndView freeBoardUpdate(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("freeBoardUpdate--------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		freeBoardService.freeBoardUpdate(mav);
		
		return mav;
	}

	/**
	 * @name : freeBoardUpdateOk
	 * @date : 2015. 6. 26.
	 * @author : 손유진
	 * @description : 수정 확인
	 */
	@RequestMapping(value="/freeBoard/update.do", method=RequestMethod.POST)
	public ModelAndView freeBoardUpdateOk(HttpServletRequest request, HttpServletResponse response, FreeBoardDto freeBoardDto){ 
		
		logger.info("freeBoardUpdateOk--------------");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);		//pageNumber
		mav.addObject("freeBoardDto",freeBoardDto);	//boardNumber, subject, content
		freeBoardService.freeBoardUpdateOk(mav);
		
		return mav;
	}
	
}
