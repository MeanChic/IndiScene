package com.indiScene.bestBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.bestBoard.service.BestBoardService;

/**
 * @type : BestBoardController
 * @date : 2015. 7. 20.
 * @author : Kim MinSic
 * @description : 베스트 게시판과 플레이 리스트를 요청을 관리하는 클래스
 */
@Controller
public class BestBoardController {
	@Autowired
	private BestBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name : bestList
	 * @date : 2015. 7. 20.
	 * @author : Kim MinSic
	 * @description : Bestboard 목록을 불러온다.
	 */
	@RequestMapping(value="/bestBoard/list.do", method=RequestMethod.GET)
	public ModelAndView bestList(HttpServletRequest request){
		logger.info("bestBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.bestList(mav);
		
		return mav; 
	}
	
	/**
	 * @name : read
	 * @date : 2015. 7. 20.
	 * @author : Kim MinSic
	 * @description : Best 게시물을 읽는 요청을 받아온다.
	 */
	@RequestMapping(value="/bestBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("bestBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
	
	/**
	 * @name : musicListAppend
	 * @date : 2015. 7. 21.
	 * @author : Kim MinSic
	 * @description : 선택된 음악을 사용자의 플레이 리스트에 추가해준다.
	 */
	@RequestMapping(value="/webPlayer/musicListAppend.do", method=RequestMethod.GET)
	public ModelAndView musicListAppend(HttpServletRequest request,HttpServletResponse response){
		logger.info("musicList append Start======================");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("response",response);
		service.musicListAppend(mav);
		
		return null;
	}
	
	/**
	 * @name : getMusicList
	 * @date : 2015. 7. 21.
	 * @author : Kim MinSic
	 * @description : 사용자 아이디에 저장된 플레이리스트를 불러온다.
	 */
	@RequestMapping(value="/webPlayer/getMusicList.do", method=RequestMethod.GET)
	public ModelAndView getMusicList(HttpServletRequest request, HttpServletResponse response){
		logger.info("musicList get Start======================");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("response",response);
		service.getMusicList(mav);
		
		return null;
	}
	
	/**
	 * @name : musicListDelete
	 * @date : 2015. 7. 21.
	 * @author : Kim MinSic
	 * @description : 더이상 듣고싶지 않은 게시물을 플레이리스트에서 제거한다.
	 */
	@RequestMapping(value="/webPlayer/musicListDelete.do", method=RequestMethod.GET)
	public ModelAndView musicListDelete(HttpServletRequest request, HttpServletResponse response){
		logger.info("musicList delete Start======================");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("response",response);
		service.musicListDelete(mav);
		
		return null;
	}
}
