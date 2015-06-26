package com.indiScene.muse.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:MuseService
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 개설및 관리 가입을 위한 service class
 */
public interface MuseService {
	
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 이름이 기존에 존재하는지 확인하는 method
	 */
	public void nameCheck(ModelAndView mav);
	
	/**
	 * @name:logup
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 개설을 위한 method
	 */
	public void logup(ModelAndView mav);
	
	/**
	 * @name:museCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	회원이 이전에 muse를 개설했는지 확인하는 method
	 */
	public void museCheck(ModelAndView mav);
	
	/**
	 * @name:museMain
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : museMain페이지로 이동할때 	
	 */
	public void museMain(ModelAndView mav);
}
