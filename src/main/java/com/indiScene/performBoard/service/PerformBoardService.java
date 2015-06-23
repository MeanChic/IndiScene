package com.indiScene.performBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface PerformBoardService {
	public void boardWrite(ModelAndView mav);
	public void list(ModelAndView mav);
	public void writeOk(ModelAndView mav);
}
