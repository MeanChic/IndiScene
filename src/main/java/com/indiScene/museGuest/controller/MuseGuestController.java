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

@Controller
public class MuseGuestController {
	
	@Autowired
	private MuseGuestServiceImpl service;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.GET)
	public ModelAndView guest(HttpServletRequest request, ModelAndView mav, HttpServletResponse response){
		//String muse_name = request.getParameter("muse_name");
		//mav.addObject("muse_name", muse_name);
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		
		
		return service.getList(mav);
	}
	
	@RequestMapping(value="/museGuest/guest.do", method=RequestMethod.POST)
	public ModelAndView guest(HttpServletRequest request, HttpServletResponse response, MuseGuestDto guestDto){
		logger.info("--" + request.getParameter("artist_id"));
		logger.info("-- id : " + guestDto.getArtist_id() + guestDto.getMuse_name() + guestDto.getGuest_content() + guestDto.getGuest_num());
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guestDto", guestDto);
		mav.addObject("request", request);
		mav.addObject("response", response);
		service.write(mav);
		return null;
	}
	
	@RequestMapping(value="/museGuest/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		
		
		
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		service.update(mav);
		return null;
	}
	
	@RequestMapping(value="/museGuest/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){
		
		
		
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		service.delete(mav);
		return null;
	}
}
