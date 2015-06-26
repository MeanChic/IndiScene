package com.indiScene.marketBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.marketBoard.dto.MarketBoardDto;
import com.indiScene.marketBoard.service.MarketBoardService;




 
/**
@name  : MarketBoardController
@date  : 2015. 6. 25.
@auther: 나혁진
@description :거래 게시판 컨트롤러
 */
@Controller
public class MarketBoardController  {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MarketBoardService marketBoardService;
	 	
	/**
	@name  : enterBoard
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :거래게시판 리스트를 불러오기위해 service를 호출
	 */
	@RequestMapping(value="/marketBoard/enterBoard.do", method=RequestMethod.GET)
	public ModelAndView enterBoard(HttpServletRequest request, HttpServletResponse response){
	logger.info("MarketBoardWrite------------------------------");
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("request",request);
	marketBoardService.enterBoard(mav);
	
	return mav;
	
	}
	
	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :게시판 내용 입력을 받기위해 write.jsp 파일을 반환시킨다
	 */
	@RequestMapping(value="/marketBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request){
		logger.info("MarketBoardWrite------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("marketBoard/write");
		
		return mav;
	}
	
	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :입력내용을 dto에 담아 service 에 보낸다
	 */
	@RequestMapping(value="/marketBoard/write.do", method=RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response, MarketBoardDto marketBoardDto){
		logger.info("MarketBoardWriteOk");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("marketBoardDto",marketBoardDto);
		
		marketBoardService.write(mav);
		
		return mav;
	}

	/**
	@name  : fileUpload
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :이미지 업로드를 위해 service를 호출한다
	 */
	@RequestMapping(value="/marketBoard/fileUpload.do", method = RequestMethod.POST)
	public ModelAndView fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
        logger.info("FileUpload-----------------------------------------"); 
             
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("upFile",upload);
	
		marketBoardService.fileUpload(mav);
		
		return mav;
	}
	
		/**
	@name  : read
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :게시글을 읽기위해 글 번호를 mav에 담아 service를 호출한다.
	 */
	@RequestMapping(value="/marketBoard/read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("MarketBoardRead");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		marketBoardService.read(mav);
		
		return mav;
	}	
}
