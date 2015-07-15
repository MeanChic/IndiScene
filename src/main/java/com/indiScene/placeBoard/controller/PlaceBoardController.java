package com.indiScene.placeBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.placeBoard.dto.PlaceBoardDto;
import com.indiScene.placeBoard.service.PlaceBoardService;

/**
@name  : MarketBoardController
@date  : 2015. 6. 25.
@auther: 나혁진
@description :거래 게시판 컨트롤러
 */
@Controller
public class PlaceBoardController  {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardService marketBoardService;
	 	
	/**
	@name  : enterBoard
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :거래게시판 리스트를 불러오기위해 service를 호출
	 */
	@RequestMapping(value="/placeBoard/enterBoard.do", method=RequestMethod.GET)
	public ModelAndView enterBoard(HttpServletRequest request, HttpServletResponse response){
	//logger.info("PlaceBoardWrite------------------------------");
	
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
	@RequestMapping(value="/placeBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request){
		//logger.info("PlaceBoardWrite------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("placeBoard/write");
		
		return mav;
	}
	
	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :입력내용을 dto에 담아 service 에 보낸다
	 */
	@RequestMapping(value="/placeBoard/write.do", method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, HttpServletResponse response, PlaceBoardDto marketBoardDto){
		logger.info("PlaceBoardWriteOk");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("marketBoardDto",marketBoardDto);
		
		marketBoardService.write(mav);
		
		return mav;
	}

//	/**  commonIO로 독립시킴
//	@name  : imageUpload
//	@date  : 2015. 6. 25.
//	@auther: 나혁진
//	@description :이미지 업로드를 위해 service를 호출한다
//	 */
//	@RequestMapping(value="/marketBoard/imageUpload.do", method = RequestMethod.POST)
//	public ModelAndView imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
//        logger.info("imageUpload-----------------------------------------"); 
//             
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("request",request);
//		mav.addObject("upFile",upload);
//	
//		marketBoardService.imageUpload(mav);
//		
//		return mav;
//	}

	
		/**
	@name  : read
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :게시글을 읽기위해 글 번호를 mav에 담아 service를 호출한다.
	 */
	@RequestMapping(value="/placeBoard/read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		//logger.info("PlaceBoardRead-----------------------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		marketBoardService.read(mav);
		
		return mav;
	}	
	
	@RequestMapping(value="/placeBoard/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		//logger.info("PlaceBoardDelete---------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.delete(mav);

		return mav;
	}
	
	@RequestMapping(value="/placeBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response){
		logger.info("PlaceBoardDeleteOk---------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.deleteOk(mav);

		return mav;
	}
	
	@RequestMapping(value="/placeBoard/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
		//logger.info("PlaceBoardUpdate------------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.update(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="/placeBoard/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, PlaceBoardDto marketBoardDto){
		//logger.info("PlaceBoardUpdateOk------------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("marketBoardDto",marketBoardDto);
		
		marketBoardService.updateOk(mav);
		
		return mav;
	}
	
	//CommonIOController 로 독립함
//	@RequestMapping(value="/marketBoard/download.do", method=RequestMethod.GET)
//	public ModelAndView download(HttpServletRequest request, HttpServletResponse response)throws Throwable{
//		logger.info("download------------------------------------");
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("request", request);
//		mav.addObject("response", response);
//		
//		marketBoardService.download(mav); 
//		
//		return null;
//	}

	
	
}
