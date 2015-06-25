package com.indiScene.performBoard.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:PerformBoardService
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	
 */
public interface PerformBoardService {
	public void boardWrite(ModelAndView mav);
	public void list(ModelAndView mav);
	public void writeOk(ModelAndView mav);
	public void read(ModelAndView mav);
}
