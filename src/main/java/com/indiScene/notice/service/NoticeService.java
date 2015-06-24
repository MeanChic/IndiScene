package com.indiScene.notice.service;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeService {

	public void test(ModelAndView mav); 		//

	public void noticeWrite(ModelAndView mav);	//
	
	public void noticeWriteOk(ModelAndView mav);//

	public void noticeList(ModelAndView mav);


}
