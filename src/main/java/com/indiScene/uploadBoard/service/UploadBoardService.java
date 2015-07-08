package com.indiScene.uploadBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface UploadBoardService {
	public void write(ModelAndView mav);
	public void writeOk(ModelAndView mav);
}
