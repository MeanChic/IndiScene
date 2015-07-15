package com.indiScene.uploadBoard.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.uploadBoard.dto.UploadBoardDto;

public interface UploadBoardService {
	public void write(ModelAndView mav);
	public void writeOk(ModelAndView mav);
	public void record(MultipartHttpServletRequest request, HttpServletResponse response);
	public void list(ModelAndView mav);
	public void read(ModelAndView mav);
	public void uploadBoardWriteNumber(UploadBoardDto boardDto);
	public void update(ModelAndView mav);
	public void updateOk(ModelAndView mav);
	public void delete(ModelAndView mav);
	public void like(ModelAndView mav);
	public void collabo(ModelAndView mav);
}