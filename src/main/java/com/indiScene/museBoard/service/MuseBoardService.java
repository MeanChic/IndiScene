package com.indiScene.museBoard.service;

import org.springframework.web.servlet.ModelAndView;

import com.indiScene.museBoard.dto.MuseBoardDto;

public interface MuseBoardService {
	public void write(ModelAndView mav);
	public void writeOk(ModelAndView mav);
//	public void record(MultipartHttpServletRequest request, HttpServletResponse response);
	public void list(ModelAndView mav);
	public void read(ModelAndView mav);
	public void MuseBoardWriteNumber(MuseBoardDto boardDto);
	public void update(ModelAndView mav);
	public void updateOk(ModelAndView mav);
	public void delete(ModelAndView mav);
//	public void like(ModelAndView mav);
	public void collabo(ModelAndView mav);
	public void collaboAdopt(ModelAndView mav);
	public void collaboOk(ModelAndView mav);
	public void museToUpload(ModelAndView mav);
}