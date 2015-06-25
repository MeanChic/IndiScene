package com.indiScene.notice.service;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeService {


	public void test(ModelAndView mav); 		//

	public void noticeWrite(ModelAndView mav);	//
	
	public void noticeWriteOk(ModelAndView mav);//

	public void noticeList(ModelAndView mav);

	public void noticeRead(ModelAndView mav);

	public void noticeDelete(ModelAndView mav);

	public void noticeDeleteOk(ModelAndView mav);

	public void noticeUpdate(ModelAndView mav);

	public void noticeUpdateOk(ModelAndView mav);

	


}
