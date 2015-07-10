package com.indiScene.uploadBoard.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface UploadBoardService {
	public void write(ModelAndView mav);
	public void writeOk(ModelAndView mav);
	public void record(MultipartHttpServletRequest request, HttpServletResponse response);
	public void list(ModelAndView mav);
	public void read(ModelAndView mav);
}
