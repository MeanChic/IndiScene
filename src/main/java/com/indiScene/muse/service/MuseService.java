package com.indiScene.muse.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:MuseService
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 개설및 관리 가입을 위한 service class
 */
public interface MuseService {
	
	public void nameCheck(ModelAndView mav);
		
	public void logup(ModelAndView mav);
		
	public void museCheck(ModelAndView mav);
	
	public void museMain(ModelAndView mav);

	public void museCancle(ModelAndView mav);
	
	public void museSignup(ModelAndView mav);
	
	public void masterCheck(ModelAndView mav);
	
	public void museMember(ModelAndView mav);
	
	public void inviteMember(ModelAndView mav);
	
	public void outMember(ModelAndView mav);
	
	public void goin(ModelAndView mav);
}
