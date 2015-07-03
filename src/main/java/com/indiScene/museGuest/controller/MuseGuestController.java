package com.indiScene.museGuest.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.museGuest.dto.MuseGuestDto;
import com.indiScene.museGuest.service.MuseGuestServiceImpl;

@Controller
public class MuseGuestController {
	
	@Autowired
	private MuseGuestServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.GET)
	public ModelAndView guest(HttpServletRequest request, ModelAndView mav){
		String muse_name = request.getParameter("muse_name");
		mav.addObject("muse_name", muse_name);
		mav.setViewName("museGuest/guest");
		return mav;
	}
	
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.POST)
	public ModelAndView guest(HttpServletRequest request,MuseGuestDto guestDto, ModelAndView mav){
		logger.info("--" + request.getParameter("artist_id"));
		logger.info("-- id : " + guestDto.getArtist_id() + guestDto.getMuse_name());
		return null;
	}
}
