package com.indiScene.performBoard.controller;

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

import com.indiScene.performBoard.dto.PerformBoardDto;
import com.indiScene.performBoard.service.PerformBoardService;

/**
@name  : PerformBoardController
@date  : 2015. 6. 25.
@auther: 김정승
@description :공연 게시판 컨트롤러
 */
@Controller
public class PerformBoardController  {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PerformBoardService marketBoardService;
	 	
	/**
	@name  : enterBoard
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :공연게시판 리스트를 불러오기위해 service를 호출
	 */
	@RequestMapping(value="/performBoard/map.do", method=RequestMethod.GET)
	public String map(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller Zipcode page----------------------");
		return "performBoard/map";
	}
	
	@RequestMapping(value="/performBoard/zipcode.do", method=RequestMethod.GET)
	public String Zipcode(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller Zipcode page----------------------");
		return "performBoard/zipcode";
	}
	
	@RequestMapping(value="/performBoard/zipcode.do", method=RequestMethod.POST)
	public ModelAndView Zipcode(HttpServletRequest request, HttpServletResponse response, String dong){
		logger.info("-----Controller find Zipcode----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		marketBoardService.findZipcode(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/performBoard/enterBoard.do", method=RequestMethod.GET)
	public ModelAndView enterBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("PerformBoardWrite------------------------------");
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		marketBoardService.enterBoard(mav);
	
		return mav;
	}
	
	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :게시판 내용 입력을 받기위해 write.jsp 파일을 반환시킨다
	 */
	@RequestMapping(value="/performBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request){
		logger.info("performBoardWrite------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performBoard/write");
		
		return mav;
	}
	
	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :입력내용을 dto에 담아 service 에 보낸다
	 */
	@RequestMapping(value="/performBoard/write.do", method=RequestMethod.POST)
	public ModelAndView write(MultipartHttpServletRequest request, HttpServletResponse response, PerformBoardDto marketBoardDto){
		//logger.info("performBoarddWriteOk             -->" + request.getParameter("hour"));
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("marketBoardDto",marketBoardDto);
		
		marketBoardService.write(mav);
		
		return mav;
	}

//	/**  commonIO로 독립시킴
//	@name  : imageUpload
//	@date  : 2015. 6. 25.
//	@auther: 김정승
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
	@auther: 김정승
	@description :게시글을 읽기위해 글 번호를 mav에 담아 service를 호출한다.
	 */
	@RequestMapping(value="/performBoard/read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request){
		logger.info("performBoardRead-----------------------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		marketBoardService.read(mav);
		
		return mav;
	}	
	
	
	/**
	@name  : delete
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :게시글삭제를 위해 글 번호를 mav에 담아 service를 호출한다.
	 */
	@RequestMapping(value="/performBoard/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		logger.info("performBoardDelete---------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.delete(mav);

		return mav;
	}
	
	/**
	@name  : delete
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :게시글삭제를 위해 글 번호를 mav에 담아 service를 호출한다.
	 */
	@RequestMapping(value="/performBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response){
		logger.info("performBoardDeleteOk---------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.deleteOk(mav);

		return mav;
	}
	
	/**
	@name  : update
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :게시글 수정내용을 불러오기 위해  service를 호출한다.
	 */
	@RequestMapping(value="/performBoard/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
		logger.info("performBoardUpdate------------------------------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		marketBoardService.update(mav);
		
		return mav;
	}
	
	/**
	@name  : read
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :게시글을 수정하기 위해 내용을 담아 service를 호출한다.
	 */
	@RequestMapping(value="/performBoard/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, PerformBoardDto marketBoardDto){
		logger.info("performBoardUpdateOk------------------------------------------------");
		
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
