package com.indiScene.museGuest.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:MuseGuestService
 * @date :2015. 7. 7.
 * @author: 김정승
 * @description :	MUSE방명록을 관리하는 service class
 */
public interface MuseGuestService {
	public void write(ModelAndView mav);
	
	public ModelAndView getList(ModelAndView mav);
	
	public void update(ModelAndView mav);
	
	public void delete(ModelAndView mav);
}
