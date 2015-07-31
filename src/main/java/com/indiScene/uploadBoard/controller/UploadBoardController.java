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

/**
 * @type : UploadBoardController
 * @date : 2015. 7. 13.
 * @author : Kim MinSic
 * @description : receive client's request
 */
@Controller
public class UploadBoardController {
	
	@Autowired
	private UploadBoardService service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name : write
	 * @date : 2015. 7. 13.
	 * @author : Kim MinSic
	 * @description : 글쓰기 화면을 불러온다.
	 */
	@RequestMapping(value="/uploadBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){
		logger.info("upload Write Start ------ ");
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("request",request);

		service.write(mav);	
		return mav;
	}
	
	/**
	 * @name : write
	 * @date : 2015. 7. 13.
	 * @author : Kim MinSic
	 * @description : 글쓰기에 필요한 정보를 입력받은 뒤 Database에 집어넣기 위한 과정
	 */
	@RequestMapping(value="/uploadBoard/write.do",method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, HttpServletResponse response, UploadBoardDto uploadBoardDto){
		logger.info("upload WriteOk Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("uploadBoardDto", uploadBoardDto);
		
		service.writeOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : record
	 * @date : 2015. 7. 14.
	 * @author : Kim MinSic
	 * @description : 녹음 완료된 파일을 전송받는다.
	 */
	@RequestMapping(value="/uploadBoard/record.do", method=RequestMethod.POST)
	public ModelAndView record(MultipartHttpServletRequest request, HttpServletResponse response){
		logger.info("record start");
		
		service.record(request,response);
		
		return null;
	}
	
	/**
	 * @name : list
	 * @date : 2015. 7. 16.
	 * @author : Kim MinSic
	 * @description : DataBase에 저장된 게시판목록을 호출한다.
	 */
	@RequestMapping(value="/uploadBoard/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request){
		logger.info("uploadBoard List Start----");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		service.list(mav);
		
		return mav;
	}
	
	/**
	 * @name : read
	 * @date : 2015. 7. 16.
	 * @author : Kim MinSic
	 * @description : 지정된 게시판을 읽는다.
	 */
	@RequestMapping(value="/uploadBoard/read.do",method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("uploadBoard Read Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.read(mav);
		
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 7. 17.
	 * @author : Kim MinSic
	 * @description : 지정된 게시판을 수정할 수 있는 페이지를 호출한다.
	 */
	@RequestMapping(value="/uploadBoard/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request){
		logger.info("uploadBoard Update Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.update(mav);
		
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 7. 17.
	 * @author : Kim MinSic
	 * @description : 변경된 정보로 게시판 정보를 수정한다.
	 */
	@RequestMapping(value="/uploadBoard/update.do", method=RequestMethod.POST)
	public ModelAndView update(MultipartHttpServletRequest request, UploadBoardDto uploadBoard){
		logger.info("upload UpdateOK Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("uploadBoard", uploadBoard);
		
		service.updateOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 7. 18.
	 * @author : Kim MinSic
	 * @description : 게시판을 삭제하기위한 페이지를 호출한다.
	 */
	@RequestMapping(value="/uploadBoard/delete.do",method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		logger.info("uploadBoard Delete Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.delete(mav);
		
		return mav;
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 7. 18.
	 * @author : Kim MinSic
	 * @description : 고객 비밀번호를 확인하여 게시판을 삭제한다.
	 */
	@RequestMapping(value="/uploadBoard/delete.do",method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response){
		logger.info("uploadBoard DeleteOk Start~~~~~~~");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		service.deleteOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : like
	 * @date : 2015. 7. 19.
	 * @author : Kim MinSic
	 * @description : 고객이 추천한 게시판의 추천수를 올린다.
	 */
	@RequestMapping(value="/uploadBoard/like.do",method=RequestMethod.GET)
	public ModelAndView like(HttpServletRequest request, HttpServletResponse response){
		logger.info("uploadBoard Like Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("response", response);
		service.like(mav);
		
		return null;
	}
	
	/**
	 * @name : collabo
	 * @date : 2015. 7. 21.
	 * @author : Kim MinSic
	 * @description : 콜라보레이션 요청을 받아 페이지를 호출한다.
	 */
	@RequestMapping(value="/uploadBoard/collabo.do", method=RequestMethod.GET)
	public ModelAndView collabo(HttpServletRequest request){
		logger.info("uploadBoard Collabo Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		service.collabo(mav);
		
		return mav;
	}
	

	/**
	 * @name : collabo
	 * @date : 2015. 7. 31.
	 * @author : Kim MinSic
	 * @description : 콜라보레이션된 곡정보와 함께 데이터베이스에 입력한다.
	 */
	@RequestMapping(value="/uploadBoard/collabo.do", method=RequestMethod.POST)
	public ModelAndView collabo(HttpServletRequest request, UploadBoardDto board){
		logger.info("upload CollaboOk Start ---------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("uploadBoardDto", board);
		
		service.collaboOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : collaboAdopt
	 * @date : 2015. 7. 25.
	 * @author : Kim MinSic
	 * @description : 현재 게시물의 곡과 새로 올라온 음원의 콜라보레이션을 진행한다.
	 */
	@RequestMapping(value="/uploadBoard/collaboAdopt.do", method=RequestMethod.POST)
	public ModelAndView collaboAdopt(MultipartHttpServletRequest request, HttpServletResponse response, UploadBoardDto board){
		logger.info("uploadBoard Collabo Start-----------------");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("response", response);
		mav.addObject("uploadBoard", board);
		
		service.collaboAdopt(mav);
		
		return null;
	}
}
