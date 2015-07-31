package com.indiScene.freeboard.service;

import org.springframework.web.servlet.ModelAndView;

public interface FreeBoardService {

	public void freeBoardWrite(ModelAndView mav);

	public void freeBoardWriteOk(ModelAndView mav);

	public void freeBoardList(ModelAndView mav);

	public void freeBoardRead(ModelAndView mav);

	public void freeBoardDelete(ModelAndView mav);

	public void freeBoardDeleteOk(ModelAndView mav);

	public void freeBoardUpdate(ModelAndView mav);

	public void freeBoardUpdateOk(ModelAndView mav);

/*	
	public void noticeDeleteOk(ModelAndView mav);

	public void noticeUpdate(ModelAndView mav);

	public void noticeUpdateOk(ModelAndView mav);
	*/
}
