package com.indiScene.commonIO.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.commonIO.service.CommonIOService;

@Controller
public class CommonIOController  {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
//	@Autowired
//	private MarketBoardService marketBoardService;
	 	
	@Autowired
	private CommonIOService commonIOService;

	/**
	@name  : imageUpload
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :이미지 업로드를 위해 service를 호출한다
	 */
	@RequestMapping(value="/commonIO/imageUpload.do", method = RequestMethod.POST)
	public ModelAndView imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
        logger.info("imageUpload-----------------------------------------"); 
             
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("upFile",upload);
	
		commonIOService.imageUpload(mav);
		
		return mav;
	}
	

	@RequestMapping(value="/CommonIO/download.do", method=RequestMethod.GET)
	public ModelAndView download(HttpServletRequest request, HttpServletResponse response)throws Throwable{
		logger.info("download------------------------------------");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		commonIOService.download(mav); 
		
		return null;
	}
	
}
