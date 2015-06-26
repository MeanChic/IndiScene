package com.indiScene.freeboard.service;

import org.springframework.web.servlet.ModelAndView;

public interface FreeBoardService {

	public void freeBoardWrite(ModelAndView mav);

	public void freeBoardWriteOk(ModelAndView mav);

	public void freeBoardList(ModelAndView mav);

/*	
 * public void noticeWriteOk(ModelAndView mav);

	public void noticeList(ModelAndView mav);

	public void noticeRead(ModelAndView mav);

	public void noticeDelete(ModelAndView mav);

	public void noticeDeleteOk(ModelAndView mav);

	public void noticeUpdate(ModelAndView mav);

	public void noticeUpdateOk(ModelAndView mav);
	*/
}
