package com.indiScene.museGuest.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.museGuest.dto.MuseGuestDto;
import com.indiScene.museGuest.service.MuseGuestServiceImpl;

/**
 * @name:MuseGuestController
 * @date :2015. 7. 7.
 * @author: 김정승
 * @description :	muse 방명록의 작성, 삭제, 수정, 읽기를 위한 controller
 */
@Controller
public class MuseGuestController {
	
	@Autowired
	private MuseGuestServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:guest
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록의 처음페이지를 보이기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.GET)
	public ModelAndView guest(HttpServletRequest request, ModelAndView mav, HttpServletResponse response){
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		return service.getList(mav);
	}
	
	/**
	 * @name:guest
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록의 작성을 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.POST)
	public ModelAndView guest(HttpServletRequest request, HttpServletResponse response, MuseGuestDto guestDto){
		//logger.info("--" + request.getParameter("artist_id"));
		//logger.info("-- id : " + guestDto.getArtist_id() + guestDto.getMuse_name() + guestDto.getGuest_content() + guestDto.getGuest_num());
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guestDto", guestDto);
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.write(mav);
		return null;
	}
	
	/**
	 * @name:update
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록을 수정하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museGuest/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.update(mav);
		return null;
	}
	
	/**
	 * @name:delete
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	작성된 방명록을 삭제하기 위해 service class를 호출하는 method
	 */
	@RequestMapping(value="/museGuest/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		service.delete(mav);
		return null;
	}
}
