package com.indiScene.muse.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.muse.service.MuseService;
import com.indiScene.muse.service.MuseServiceImpl;

/**
 * @name:MuseController
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 동호회 개설및 관리 가입을 위한 controller
 */
@Controller
public class MuseController {
	
	@Autowired
	private MuseService service;
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
	public ModelAndView logup(MultipartHttpServletRequest request, HttpServletResponse response,ModelAndView mav, MuseDto museDto){
		mav.addObject("request", request);
		mav.addObject("response",response);
		mav.addObject("museDto", museDto);
		logger.info("Logup Controller");
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
		//logger.info("--name Check");
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
		//logger.info("--muse Check");
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
		//logger.info("--muse Check");
		mav.addObject("request", request);
		service.museMain(mav);
		
		return mav;
	}
	
	/**
	 * @name:museCancle
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	muse 가입신청을 취소하기위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/museCancle.do", method=RequestMethod.GET)
	public ModelAndView museCancle(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		//logger.info("--muse Cancle");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.museCancle(mav);
		
		return null;
	}
	
	/**
	 * @name:museSignup
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	muse를 가입을 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/museSignup.do", method=RequestMethod.GET)
	public ModelAndView museSignup(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		logger.info("--muse Cancle");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.museSignup(mav);
		
		return null;
	}
	
	/**
	 * @name:goin
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	가입되어 있는 muse로 입장하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/goin.do", method=RequestMethod.GET)
	public ModelAndView goin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		mav.addObject("request",request);
		service.goin(mav);
		
		return mav;
	}
	
	/**
	 * @name:masterCheck
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	muse개설자인지 확인하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/masterCheck.do", method=RequestMethod.GET)
	public ModelAndView masterCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		//logger.info("--masterCheck Ok");
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.masterCheck(mav);
		
		return null;
	}
	
	/**
	 * @name:museMember
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	muse에 가입되어있는 회원 명단을 확인하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/museMember.do", method=RequestMethod.GET)
	public ModelAndView museMember(HttpServletRequest request, ModelAndView mav){
		//logger.info("-- museMember");
		
		mav.addObject("request", request);
		String check = request.getParameter("check");
		mav.addObject("check", check);
		
		service.museMember(mav);
		
		return mav;
	}
	
	/**
	 * @name:outMember
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	가입되어 있는 회원을 삭제하거나 가입 요청을 거부하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/outMember.do", method=RequestMethod.GET)
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		//logger.info("--muse Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.outMember(mav);
		
		return null;
	}
	
	/**
	 * @name:inviteMember
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	가입요청을한 회원을 승인하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museCreate/inviteMember.do", method=RequestMethod.GET)
	public ModelAndView inviteMember(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){	
		//logger.info("--muse Check");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.inviteMember(mav);
		
		return null;
	}
	
	/**
	 * deleteMuse
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	개설된 muse를 삭제하는 메소드
	 */
	@RequestMapping(value="/museGuest/deleteMuse.do", method=RequestMethod.GET)
	public ModelAndView deleteMuse(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.deleteMuse(mav);
		
		return null;
	}
}
