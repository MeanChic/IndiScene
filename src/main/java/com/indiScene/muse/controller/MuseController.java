package com.indiScene.muse.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.muse.service.MuseServiceImpl;
import com.indiScene.performBoard.dto.PerformBoardDto;
import com.indiScene.performBoard.service.PerformBoardServiceImpl;

/**
 * @name:MuseController
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 동호회 개설및 관리 가입을 위한 controller
 */
@Controller
public class MuseController {
	
	@Autowired
	private MuseServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:logup
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	muse 개설을 위한 페이지 이동
	 */
	@RequestMapping(value="/museCreate/logup.do", method=RequestMethod.GET)
	public ModelAndView logup(HttpServletRequest request, ModelAndView mav){
		mav.addObject("request", request);
		
		mav.setViewName("museCreate/logup");
		
		return mav;
	}
	
	/**
	 * @name:logup
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	muse 개설을 위해 muse servie로 이동
	 */
	@RequestMapping(value="/museCreate/logup.do", method=RequestMethod.POST)
	public ModelAndView logup(MultipartHttpServletRequest request, ModelAndView mav, MuseDto museDto){
		mav.addObject("request", request);
		mav.addObject("museDto", museDto);
		service.logup(mav);
		
		return mav;
	}
	
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	muse 이름을 체크하기 위해 service로 이동
	 */
	@RequestMapping(value="/museCreate/nameCheck.do", method=RequestMethod.GET)
	public ModelAndView nameCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--name Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		service.nameCheck(mav);
		return null;
	}
	
	/**
	 * @name:museCheck
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	회원이 개설한 뮤즈가 있는지 확인하기 위해 service로 이동
	 */
	@RequestMapping(value="/museCreate/museCheck.do", method=RequestMethod.GET)
	public ModelAndView museCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Check");
		mav.addObject("request", request);
		
		mav.addObject("response", response);
		service.museCheck(mav);
		return null;
	}
	
	/**
	 * @name:museMain
	 * @date :2015. 6. 25.
	 * @author: 김정승
	 * @description :	
	 */
	@RequestMapping(value="/museCreate/musemain.do", method=RequestMethod.GET)
	public ModelAndView museMain(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Check");
		mav.addObject("request", request);
		service.museMain(mav);
		//mav.setViewName("museCreate/musemain");
		return mav;
	}
	
	@RequestMapping(value="/museCreate/museCancle.do", method=RequestMethod.GET)
	public ModelAndView museCancle(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Cancle");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.museCancle(mav);
		
		return null;
	}
	
	@RequestMapping(value="/museCreate/museSignup.do", method=RequestMethod.GET)
	public ModelAndView museSignup(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Cancle");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.museSignup(mav);
		
		return null;
	}
	
	@RequestMapping(value="/museCreate/goin.do", method=RequestMethod.GET)
	public ModelAndView goin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		mav.addObject("request",request);
		String muse_name = request.getParameter("muse_name");
		mav.addObject("muse_name",muse_name);
		mav.setViewName("museCreate/goin");
		return mav;
	}
	
	@RequestMapping(value="/museCreate/masterCheck.do", method=RequestMethod.GET)
	public ModelAndView masterCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--masterCheck Ok");
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.masterCheck(mav);
		return null;
	}
	
	@RequestMapping(value="/museCreate/museMember.do", method=RequestMethod.GET)
	public ModelAndView museMember(HttpServletRequest request, ModelAndView mav){
		mav.addObject("request", request);
		logger.info("-- museMember");
		service.museMember(mav);
		return mav;
	}
	
	@RequestMapping(value="/museCreate/outMember.do", method=RequestMethod.GET)
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.outMember(mav);
		return null;
	}
	@RequestMapping(value="/museCreate/inviteMember.do", method=RequestMethod.GET)
	public ModelAndView inviteMember(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){	
		logger.info("--muse Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.inviteMember(mav);
		return null;
	}
}
