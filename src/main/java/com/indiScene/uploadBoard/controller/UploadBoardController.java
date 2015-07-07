package com.indiScene.uploadBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.uploadBoard.service.UploadBoardServiceImpl;

@Controller
public class UploadBoardController {
	
	@Autowired
	private UploadBoardServiceImpl service;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/uploadBoard/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){
		logger.info("upload Write Start ------ ");
		ModelAndView mav= new ModelAndView();
		mav.addObject("str", "Success");
		
		/*try {
			PrintWriter writer =response.getWriter();
			writer.write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		mav.addObject("str1","success1");
		mav.addObject("str2","µÇ³ª?");
		mav.setViewName("uploadBoard/write");
		
		return mav;
	}
}
