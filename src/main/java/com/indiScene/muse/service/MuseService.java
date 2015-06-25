package com.indiScene.muse.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:MuseService
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
public interface MuseService {
	public void nameCheck(ModelAndView mav);
	public void logup(ModelAndView mav);
	public void museCheck(ModelAndView mav);
	/*public void boardWrite(ModelAndView mav);
	public void list(ModelAndView mav);
	public void writeOk(ModelAndView mav);
	public void read(ModelAndView mav);*/
}
