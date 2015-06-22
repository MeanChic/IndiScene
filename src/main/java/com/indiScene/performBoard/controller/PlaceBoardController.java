package com.indiScene.performBoard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.performBoard.service.PlaceBoardServiceImpl;

@Controller
public class PlaceBoardController {
	
	@Autowired
	private PlaceBoardServiceImpl service;
	
	@RequestMapping(value="/indiScene/write.do", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, ModelAndView mav){
		mav.setViewName("performBoard/write");
		
		return mav;
	}
}
