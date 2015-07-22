package com.indiScene.commonIO.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.commonIO.dto.CommonDto;

public interface CommonIOService {
	public void imageUpload(ModelAndView mav);
	public List<String> mainImageFind(Object list);
	public void multiFileUpload(MultipartHttpServletRequest request,CommonDto dto);
	public void multiFileDelete(CommonDto dto);
	public void download(ModelAndView mav) throws IOException;
	public void myUploadMusic(ModelAndView mav);
	public void myLikeMusic(ModelAndView mav);
	public void myCollaboMusic(ModelAndView mav);
}
